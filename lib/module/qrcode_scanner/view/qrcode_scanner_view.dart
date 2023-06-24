import 'package:flutter/material.dart';
import 'package:flutter_latihan/module/qrcode_detail/view/qrcode_detail_view.dart';
import 'package:flutter_latihan/module/qrcode_scanner/controller/qrcode_scanner_controller.dart';
import 'package:flutter_latihan/state_util.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QrcodeScannerView extends StatefulWidget {
  const QrcodeScannerView({Key? key}) : super(key: key);

  Widget build(context, QrcodeScannerController controller) {
    controller.view = this;

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          MobileScanner(
            // fit: BoxFit.contain,
            controller: controller.cameraController,
            onDetect: (capture) {
              if (!controller.isResult) {
                final List<Barcode> barcodes = capture.barcodes;
                // final Uint8List? image = capture.image;
                for (final barcode in barcodes) {
                  // debugPrint('Barcode found! ${barcode.rawValue}');
                  Get.to(QrcodeDetailView(hasil: barcode.rawValue!))
                      .then((value) {
                    controller.isResult = false;
                  });
                  controller.isResult = true;
                  break;
                }
              }
            },
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 100.0,
              ),
              const Text(
                "SCAN YOUR QR CODE",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () => controller.cameraController.toggleTorch(),
                    child: CircleAvatar(
                      radius: 28,
                      backgroundColor: Colors.white.withOpacity(0.4),
                      child: ValueListenableBuilder(
                        valueListenable: controller.cameraController.torchState,
                        builder: (context, state, child) {
                          switch (state) {
                            case TorchState.off:
                              return const Icon(
                                Icons.flash_off,
                                color: Colors.black87,
                                size: 28,
                              );
                            case TorchState.on:
                              return const Icon(
                                Icons.flash_on,
                                color: Colors.yellow,
                                size: 28,
                              );
                          }
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 50.0,
                  ),
                  InkWell(
                    onTap: () => controller.cameraController.switchCamera(),
                    child: CircleAvatar(
                      radius: 28,
                      backgroundColor: Colors.white.withOpacity(0.4),
                      child: ValueListenableBuilder(
                        valueListenable:
                            controller.cameraController.cameraFacingState,
                        builder: (context, state, child) {
                          switch (state) {
                            case CameraFacing.front:
                              return const Icon(
                                Icons.camera_front,
                                color: Colors.blue,
                                size: 28,
                              );
                            case CameraFacing.back:
                              return const Icon(
                                Icons.camera_rear,
                                color: Colors.blueAccent,
                                size: 28,
                              );
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              InkWell(
                onTap: () => Get.back(),
                child: CircleAvatar(
                  radius: 28,
                  backgroundColor: Colors.white.withOpacity(0.4),
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.black87,
                    size: 28,
                  ),
                ),
              ),
              const SizedBox(
                height: 70.0,
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  State<QrcodeScannerView> createState() => QrcodeScannerController();
}
