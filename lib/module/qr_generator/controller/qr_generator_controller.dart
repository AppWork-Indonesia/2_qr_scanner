import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';

import '../view/qr_generator_view.dart';

class QrGeneratorController extends State<QrGeneratorView> {
  static late QrGeneratorController instance;
  late QrGeneratorView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  String hasil = '';
  ScreenshotController screenshotController = ScreenshotController();

  void createQR(String value) {
    hasil = value;
    setState(() {});
  }

  Future<void> saveQRToDownload() async {
    try {
      Uint8List? capturedImage = await screenshotController.capture();

      final directory = await getExternalStorageDirectory();
      if (directory != null) {
        final downloadPath = '${directory.path}/Download';

        final downloadDirectory = Directory(downloadPath);
        if (!downloadDirectory.existsSync()) {
          downloadDirectory.createSync(recursive: true);
        }

        final qrFile = File('$downloadPath/$hasil.png');
        await qrFile.writeAsBytes(capturedImage!);

        print('QR code berhasil disimpan di folder "Download"');
      } else {
        print('Gagal mendapatkan direktori "Download"');
      }
    } catch (e) {
      print('Terjadi kesalahan saat menyimpan QR code: $e');
    }
  }
}
