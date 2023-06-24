import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import '../view/qrcode_scanner_view.dart';

class QrcodeScannerController extends State<QrcodeScannerView> {
  static late QrcodeScannerController instance;
  late QrcodeScannerView view;

  @override
  void initState() {
    instance = this;
    // cameraController.switchCamera();
    super.initState();
  }

  @override
  void dispose() {
    cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  MobileScannerController cameraController = MobileScannerController(
    detectionSpeed: DetectionSpeed.normal,
    facing: CameraFacing.back,
    autoStart: true,
  );

  bool isResult = false;
}
