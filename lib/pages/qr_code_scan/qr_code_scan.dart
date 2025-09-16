import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gainx/core/utils/theme_utils.dart';
import 'package:gainx/pages/qr_code_scan/bloc/qr_code_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:rxdart/rxdart.dart';
import 'package:toastification/toastification.dart';

class QrCodeScanPage extends StatelessWidget {
  const QrCodeScanPage({
    required this.nonce,
    super.key,
  });

  final String? nonce;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QrCodeBloc(
        authService: context.read(),
        reownService: context.read(),
        nonce: nonce,
      ),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Scan QR Code',
            style: TextStyle(
              fontFamily: 'CentraNo1-Medium',
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),
        body: _Body(nonce: nonce),
      ),
    );
  }
}

class _Body extends StatefulHookWidget {
  const _Body({
    required this.nonce,
  });

  final String? nonce;

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  MobileScannerController? controller;

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    controller = MobileScannerController();
    unawaited(controller!.start());
  }

  @override
  void dispose() {
    controller?.dispose();
    controller = null;

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (controller == null) {
      return const SizedBox.shrink();
    }

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (widget.nonce != null) {
          context.read<QrCodeBloc>().add(QrCodeSubmitedEvent());
        }
      });
      return null;
    }, []);

    useEffect(() {
      final sub = controller?.barcodes
          .map((event) => event.barcodes.first.rawValue)
          .distinctUnique()
          .listen((data) {
        if (data != null && context.mounted) {
          context.read<QrCodeBloc>().add(QrCodeReceivedEvent(nonce: data));
        }
      });

      return () => sub!.cancel();
    }, []);

    return BlocListener<QrCodeBloc, QrCodeState>(
      listenWhen: (p, c) {
        return p.status == SubmitQrCodeStatus.inProgress &&
            c.status == SubmitQrCodeStatus.success;
      },
      listener: (context, state) async {
        await Future<void>.delayed(const Duration(seconds: 1));

        toastification.show(
          style: ToastificationStyle.fillColored,
          type: ToastificationType.success,
          title: const Text('Login Successfully.'),
          borderRadius: BorderRadius.circular(6),
          autoCloseDuration: const Duration(seconds: 4),
        );

        if (context.mounted) {
          context.go('/swap');
        }
      },
      child: Stack(
        children: [
          MobileScanner(
            controller: controller,
          ),
          _Overlay(
            controller: controller!,
          ),
          BlocSelector<QrCodeBloc, QrCodeState, bool>(
            selector: (state) {
              return state.code != null;
            },
            builder: (context, isScanned) {
              return Padding(
                padding: EdgeInsetsGeometry.only(
                  top: MediaQuery.sizeOf(context).width * .7,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (isScanned)
                      Icon(
                        Icons.check_circle_rounded,
                        size: 46,
                        color: context.colorExtension.success,
                      )
                  ],
                ),
              );
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 126),
              child: TextButton.icon(
                onPressed: () async {
                  final res = await showModalBottomSheet<String>(
                    context: context,
                    useRootNavigator: true,
                    isScrollControlled: true,
                    useSafeArea: true,
                    backgroundColor: const Color(0xff202023),
                    showDragHandle: true,
                    builder: (_) {
                      return BlocProvider.value(
                        value: context.read<QrCodeBloc>(),
                        child: const _Manual(),
                      );
                    },
                  );

                  if (context.mounted && res != null) {
                    context
                        .read<QrCodeBloc>()
                        .add(QrCodeManulaEvent(message: res));
                  }
                },
                icon: const Icon(
                  Icons.edit,
                  color: Colors.white,
                ),
                label: const Text(
                  'Enter code manually',
                  style: TextStyle(
                    fontFamily: 'CentraNo1-Medium',
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Manual extends HookWidget {
  const _Manual();

  @override
  Widget build(BuildContext context) {
    final message = useState('');

    return BlocListener<QrCodeBloc, QrCodeState>(
      listenWhen: (p, c) {
        return p.status == SubmitQrCodeStatus.inProgress &&
            c.status == SubmitQrCodeStatus.success;
      },
      listener: (context, state) {
        Navigator.pop(context);
      },
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.viewInsetsOf(context).bottom,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextFormField(
                maxLength: 6,
                style: const TextStyle(
                  fontFamily: 'CentraNo1-medium',
                  fontSize: 16,
                ),
                onChanged: (value) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    message.value = value;
                  });
                },
                decoration: InputDecoration(
                  counterText: '',
                  filled: false,
                  hintText: 'Enter code manually',
                  hintStyle: TextStyle(
                    fontFamily: 'CentraNo1-Book',
                    fontSize: 14,
                    color: context.colorExtension.neutral,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: context.colorScheme.primary,
                    ),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: context.colorExtension.neutral,
                    ),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: context.colorExtension.neutral,
                    ),
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 74),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 36),
              child: BlocSelector<QrCodeBloc, QrCodeState, bool>(
                selector: (state) {
                  return state.status == SubmitQrCodeStatus.inProgress;
                },
                builder: (context, isInProgress) {
                  return FilledButton(
                    style: FilledButton.styleFrom(
                      minimumSize: const Size.fromHeight(48),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(80),
                      ),
                    ),
                    onPressed: message.value.length != 6 || isInProgress
                        ? null
                        : () {
                            context
                                .read<QrCodeBloc>()
                                .add(QrCodeManulaEvent(message: message.value));
                          },
                    child: isInProgress
                        ? const Center(
                            child: SizedBox.square(
                                dimension: 24,
                                child: CircularProgressIndicator.adaptive()),
                          )
                        : const Text(
                            'Confirm',
                            style: TextStyle(
                              fontFamily: 'CentraNo1-Medium',
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

class _Overlay extends StatelessWidget {
  const _Overlay({
    required this.controller,
  });

  final MobileScannerController controller;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<QrCodeBloc, QrCodeState, bool>(
      selector: (state) {
        return state.code != null;
      },
      builder: (context, isScanned) {
        return ValueListenableBuilder(
          valueListenable: controller,
          builder: (context, value, child) {
            // Not ready.
            if (!value.isInitialized ||
                !value.isRunning ||
                value.error != null ||
                value.size.isEmpty) {
              return const SizedBox();
            }

            return CustomPaint(
              size: value.size,
              painter: _CornerBorderPainter(
                scanWindow: Rect.fromCenter(
                  center: MediaQuery.sizeOf(context).center(
                      Offset(0, -(MediaQuery.sizeOf(context).width * .7 / 2))),
                  width: MediaQuery.sizeOf(context).width * .7,
                  height: MediaQuery.sizeOf(context).width * .7,
                ),
                borderColor: isScanned
                    ? context.colorExtension.success
                    : context.colorScheme.primary,
                cornerLength: 24,
                borderRadius: BorderRadius.circular(8),
                borderStrokeCap: StrokeCap.round,
                borderStrokeJoin: StrokeJoin.miter,
                borderStyle: PaintingStyle.stroke,
                borderWidth: 4,
                color: const Color(0xff000000).withValues(alpha: .64),
              ),
            );
          },
        );
      },
    );
  }
}

class _CornerBorderPainter extends CustomPainter {
  const _CornerBorderPainter({
    required this.borderColor,
    required this.borderRadius,
    required this.borderStrokeCap,
    required this.borderStrokeJoin,
    required this.borderStyle,
    required this.borderWidth,
    required this.color,
    required this.scanWindow,
    this.cornerLength = 12,
  });

  final Color borderColor;

  final BorderRadius borderRadius;

  final StrokeCap borderStrokeCap;

  final StrokeJoin borderStrokeJoin;

  final PaintingStyle borderStyle;

  final double borderWidth;

  final Color color;

  final Rect scanWindow;

  final double cornerLength;

  @override
  void paint(Canvas canvas, Size size) {
    if (scanWindow.isEmpty || scanWindow.isInfinite) return;

    final backgroundPath = Path()..addRect(Offset.zero & size);

    final cutoutRect = borderRadius == BorderRadius.zero
        ? RRect.fromRectAndCorners(scanWindow)
        : RRect.fromRectAndCorners(
            scanWindow,
            topLeft: borderRadius.topLeft,
            topRight: borderRadius.topRight,
            bottomLeft: borderRadius.bottomLeft,
            bottomRight: borderRadius.bottomRight,
          );

    final cutoutPath = Path()..addRRect(cutoutRect);
    final overlayWithCutoutPath = Path.combine(
      PathOperation.difference,
      backgroundPath,
      cutoutPath,
    );

    final overlayWithCutoutPaint = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..blendMode = BlendMode.srcOver;

    final borderPaint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth
      ..strokeCap = borderStrokeCap
      ..strokeJoin = borderStrokeJoin
      ..isAntiAlias = true;

    canvas.drawPath(overlayWithCutoutPath, overlayWithCutoutPaint);

    final cutout = RRect.fromRectAndCorners(scanWindow);

    final left = cutout.left;
    final top = cutout.top;
    final right = cutout.right;
    final bottom = cutout.bottom;

    final tlrx = cutout.tlRadiusX;
    final tlry = cutout.tlRadiusY;
    final trrx = cutout.trRadiusX;
    final trry = cutout.trRadiusY;
    final blrx = cutout.blRadiusX;
    final blry = cutout.blRadiusY;
    final brrx = cutout.brRadiusX;
    final brry = cutout.brRadiusY;

    final width = cutout.width;
    final height = cutout.height;

    final topH = math.max(0, math.min(cornerLength, width - tlrx - trrx));
    final bottomH = math.max(0, math.min(cornerLength, width - blrx - brrx));
    final leftV = math.max(0, math.min(cornerLength, height - tlry - blry));
    final rightV = math.max(0, math.min(cornerLength, height - trry - brry));

    final rTL = math.min(8, math.min(topH, leftV));
    final rTR = math.min(8, math.min(topH, rightV));
    final rBL = math.min(8, math.min(bottomH, leftV));
    final rBR = math.min(8, math.min(bottomH, rightV));

    canvas
      ..drawLine(
        Offset(left + tlrx + rTL, top),
        Offset(left + tlrx + topH, top),
        borderPaint,
      )
      ..drawLine(
        Offset(left, top + tlry + rTL),
        Offset(left, top + tlry + leftV),
        borderPaint,
      )
      ..drawLine(
        Offset(right - trrx - topH, top),
        Offset(right - trrx - rTR, top),
        borderPaint,
      )
      ..drawLine(
        Offset(right, top + trry + rTR),
        Offset(right, top + trry + rightV),
        borderPaint,
      )
      ..drawLine(
        Offset(left + blrx + rBL, bottom),
        Offset(left + blrx + bottomH, bottom),
        borderPaint,
      )
      ..drawLine(
        Offset(left, bottom - blry - leftV),
        Offset(left, bottom - blry - rBL),
        borderPaint,
      )
      ..drawLine(
        Offset(right - brrx - bottomH, bottom),
        Offset(right - brrx - rBR, bottom),
        borderPaint,
      )
      ..drawLine(
        Offset(right, bottom - brry - rightV),
        Offset(right, bottom - brry - rBR),
        borderPaint,
      );

    final path = Path()
      ..moveTo(left + tlrx + rTL, top)
      ..quadraticBezierTo(
        left + tlrx,
        top + tlry,
        left,
        top + tlry + rTL,
      )
      ..moveTo(right - trrx - rTR, top)
      ..quadraticBezierTo(
        right - trrx,
        top + trry,
        right,
        top + trry + rTR,
      )
      ..moveTo(left + blrx + rBL, bottom)
      ..quadraticBezierTo(
        left + blrx,
        bottom - blry,
        left,
        bottom - blry - rBL,
      )
      ..moveTo(right - brrx - rBR, bottom)
      ..quadraticBezierTo(
        right - brrx,
        bottom - brry,
        right,
        bottom - brry - rBR,
      );

    canvas.drawPath(path, borderPaint);
  }

  @override
  bool shouldRepaint(_CornerBorderPainter oldDelegate) {
    return true;
  }
}
