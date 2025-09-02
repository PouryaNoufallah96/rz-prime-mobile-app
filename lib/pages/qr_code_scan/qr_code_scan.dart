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
  const QrCodeScanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QrCodeBloc(
        authService: context.read(),
        reownService: context.read(),
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
        body: const _Body(),
      ),
    );
  }
}

class _Body extends StatefulHookWidget {
  const _Body();

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
      listenWhen: (previous, current) {
        return previous.status == SubmitQrCodeStatus.inProgress &&
            previous.status == SubmitQrCodeStatus.success;
      },
      listener: (context, state) {
        toastification.show(
          style: ToastificationStyle.fillColored,
          type: ToastificationType.success,
          title: const Text('Login Successfully.'),
          borderRadius: BorderRadius.circular(6),
          autoCloseDuration: const Duration(seconds: 4),
        );
        context.pop();
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
              padding: const EdgeInsets.only(bottom: 40),
              child: TextButton.icon(
                onPressed: () async {
                  final res = await showModalBottomSheet<String>(
                    context: context,
                    useRootNavigator: true,
                    isScrollControlled: true,
                    useSafeArea: true,
                    backgroundColor: const Color(0xff202023),
                    showDragHandle: true,
                    builder: (context) {
                      return const _Manual();
                    },
                  );

                  if (context.mounted && res != null) {
                    context
                        .read<QrCodeBloc>()
                        .add(QrCodeManulaEvent(message: res));
                  }
                },
                icon: const Icon(Icons.edit),
                label: const Text('Enter code manually'),
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

    return Padding(
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
                prefixIcon: const Icon(Icons.search_rounded),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: context.colorScheme.primary,
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
            child: FilledButton(
              style: FilledButton.styleFrom(
                minimumSize: const Size.fromHeight(48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(80),
                ),
              ),
              onPressed: message.value.length != 6
                  ? null
                  : () {
                      Navigator.pop(context, message.value);
                    },
              child: const Text(
                'Confirm',
                style: TextStyle(
                  fontFamily: 'CentraNo1-Medium',
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
        ],
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
                borderRadius: BorderRadius.zero,
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

    // 1) پس‌زمینه + کاتِ پنجره
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

    // 2) قلم خطوط گوشه
    final borderPaint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke // فقط خط می‌کشیم
      ..strokeWidth = borderWidth
      ..strokeCap = borderStrokeCap
      ..strokeJoin = borderStrokeJoin
      ..isAntiAlias = true;

    // 3) رسم Overlay
    canvas.drawPath(overlayWithCutoutPath, overlayWithCutoutPaint);

    // 4) فقط خطوط گوشه‌ها
    final left = cutoutRect.left;
    final top = cutoutRect.top;
    final right = cutoutRect.right;
    final bottom = cutoutRect.bottom;

    final tlrx = cutoutRect.tlRadiusX;
    final tlry = cutoutRect.tlRadiusY;
    final trrx = cutoutRect.trRadiusX;
    final trry = cutoutRect.trRadiusY;
    final blrx = cutoutRect.blRadiusX;
    final blry = cutoutRect.blRadiusY;
    final brrx = cutoutRect.brRadiusX;
    final brry = cutoutRect.brRadiusY;

    final width = cutoutRect.width;
    final height = cutoutRect.height;

    final topH = math.max(0, math.min(cornerLength, width - tlrx - trrx));
    final bottomH = math.max(0, math.min(cornerLength, width - blrx - brrx));
    final leftV = math.max(0, math.min(cornerLength, height - tlry - blry));
    final rightV = math.max(0, math.min(cornerLength, height - trry - brry));

    canvas
      ..drawLine(
        Offset(left + tlrx, top),
        Offset(left + tlrx + topH, top),
        borderPaint,
      )
      ..drawLine(
        Offset(left, top + tlry),
        Offset(left, top + tlry + leftV),
        borderPaint,
      )
      ..drawLine(
        Offset(right - trrx - topH, top),
        Offset(right - trrx, top),
        borderPaint,
      )
      ..drawLine(
        Offset(right, top + trry),
        Offset(right, top + trry + rightV),
        borderPaint,
      )
      ..drawLine(
        Offset(left + blrx, bottom),
        Offset(left + blrx + bottomH, bottom),
        borderPaint,
      )
      ..drawLine(
        Offset(left, bottom - blry - leftV),
        Offset(left, bottom - blry),
        borderPaint,
      )
      ..drawLine(
        Offset(right - brrx - bottomH, bottom),
        Offset(right - brrx, bottom),
        borderPaint,
      )
      ..drawLine(
        Offset(right, bottom - brry - rightV),
        Offset(right, bottom - brry),
        borderPaint,
      );
  }

  @override
  bool shouldRepaint(_CornerBorderPainter oldDelegate) {
    return oldDelegate.scanWindow != scanWindow ||
        oldDelegate.color != color ||
        oldDelegate.borderRadius != borderRadius ||
        oldDelegate.cornerLength != cornerLength ||
        oldDelegate.borderColor != borderColor ||
        oldDelegate.borderWidth != borderWidth ||
        oldDelegate.borderStrokeCap != borderStrokeCap ||
        oldDelegate.borderStrokeJoin != borderStrokeJoin;
  }
}
