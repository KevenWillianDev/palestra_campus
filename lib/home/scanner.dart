import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class MobileScannerSimple extends StatefulWidget {
  final void Function(BarcodeCapture barcodes) onDetect;
  const MobileScannerSimple({super.key, required this.onDetect});

  @override
  State<MobileScannerSimple> createState() => _MobileScannerSimpleState();
}

class _MobileScannerSimpleState extends State<MobileScannerSimple> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scannear qr code')),
      backgroundColor: Colors.black,
      body: MobileScanner(onDetect: widget.onDetect),
    );
  }
}
