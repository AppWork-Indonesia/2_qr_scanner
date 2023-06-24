import 'package:flutter/material.dart';
import 'package:flutter_latihan/core.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:screenshot/screenshot.dart';
import '../controller/qr_generator_controller.dart';

class QrGeneratorView extends StatefulWidget {
  const QrGeneratorView({Key? key}) : super(key: key);

  Widget build(context, QrGeneratorController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("QR Generator"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              (controller.hasil.isNotEmpty)
                  ? Screenshot(
                      controller: controller.screenshotController,
                      child: QrImageView(
                        backgroundColor: Colors.white,
                        data: controller.hasil,
                        version: QrVersions.auto,
                        size: MediaQuery.of(context).size.width * 0.3,
                      ),
                    )
                  : SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: MediaQuery.of(context).size.height * 0.3,
                    ),
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 6.0,
                  horizontal: 12.0,
                ),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.text_format,
                        color: Colors.grey[500],
                      ),
                    ),
                    Expanded(
                      child: TextFormField(
                        initialValue: null,
                        decoration: InputDecoration.collapsed(
                          filled: true,
                          fillColor: Colors.transparent,
                          hintText: "Masukkan Kata",
                          hintStyle: TextStyle(
                            color: Colors.grey[500],
                          ),
                          hoverColor: Colors.transparent,
                        ),
                        onFieldSubmitted: (value) {},
                        onChanged: (value) => controller.createQR(value),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                ),
                onPressed: () => controller.saveQRToDownload(),
                child: const Text("Simpan QR"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<QrGeneratorView> createState() => QrGeneratorController();
}
