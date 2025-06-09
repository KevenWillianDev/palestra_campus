import 'package:flutter/material.dart';
import 'package:qr_code_dart_scan/qr_code_dart_scan.dart';

class QRViewExample extends StatefulWidget {
  final Function(String) onScan;

  const QRViewExample({super.key, required this.onScan});

  @override
  State<StatefulWidget> createState() => _QRViewExampleState();
}

class _QRViewExampleState extends State<QRViewExample> {
  @override
  void reassemble() {
    super.reassemble();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: QRCodeDartScanView(
        scanInvertedQRCode: true,
        onCameraError: (String error) {
          debugPrint('Error: $error');
        },
        typeScan: TypeScan.live,
        onCapture: (Result result) {
          widget.onScan(result.text);
          Navigator.pop(context);
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
