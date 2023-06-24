import 'package:flutter/material.dart';
import '../view/qrcode_detail_view.dart';

class QrcodeDetailController extends State<QrcodeDetailView> {
  static late QrcodeDetailController instance;
  late QrcodeDetailView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
