import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gainx/core/utils/theme_utils.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QrCodeScanPage extends StatelessWidget {
  const QrCodeScanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}

class _Body extends StatefulWidget {
  const _Body();

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  MobileScannerController? controller;

  MobileScannerController initController() => MobileScannerController();
  late StreamSubscription<BarcodeCapture>? sub;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    controller = initController();
    unawaited(controller!.start());

    sub = controller?.barcodes.take(1).listen((event) {
      final data = event.barcodes.first.rawValue;
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    controller = null;
    sub?.cancel();
    sub = null;

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (controller == null) {
      return const SizedBox.shrink();
    }

    return Stack(
      children: [
        const MobileScanner(),
        if (controller != null)
          ScanWindowOverlay(
            borderRadius: BorderRadius.circular(8),
            borderWidth: 4,
            color: context.colorScheme.primary,
            controller: controller!,
            scanWindow: Rect.fromCenter(
              center: MediaQuery.sizeOf(context).center(const Offset(0, -100)),
              width: 300,
              height: 200,
            ),
          ),
        Positioned(
          bottom: 40,
          child: TextButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.edit),
            label: const Text('Enter code manually'),
          ),
        ),
      ],
    );
  }
}
