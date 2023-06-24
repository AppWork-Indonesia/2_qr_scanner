import 'package:flutter/material.dart';
import 'package:flutter_latihan/core.dart';
import 'package:flutter_latihan/state_util.dart';

class QrcodeDetailView extends StatefulWidget {
  final String hasil;
  const QrcodeDetailView({Key? key, required this.hasil}) : super(key: key);

  Widget build(context, QrcodeDetailController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Hasil Scan"),
        leading: IconButton(
          onPressed: () => Get.offAll(const MainNavigationView()),
          icon: const Icon(
            Icons.arrow_back,
            size: 24.0,
          ),
        ),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Text(
                hasil,
                style: const TextStyle(
                  fontSize: 18.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<QrcodeDetailView> createState() => QrcodeDetailController();
}
