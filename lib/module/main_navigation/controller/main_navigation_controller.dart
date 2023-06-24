import 'package:flutter/material.dart';
import 'package:flutter_latihan/core.dart';

class MainNavigationController extends State<MainNavigationView> {
  static late MainNavigationController instance;
  late MainNavigationView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  List apps = [
    {
      "ke": "1",
      "label": "QR Generator",
      "icon": Icons.qr_code,
      "page": const QrGeneratorView(),
    },
    {
      "ke": "2",
      "label": "QR Scanner",
      "icon": Icons.qr_code_scanner,
      "page": const QrcodeScannerView(),
    },
    {
      "ke": "3",
      "label": "Login Validator",
      "icon": Icons.error,
      "page": const LoginValidationView(),
    }
  ];
}
