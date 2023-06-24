import 'package:flutter_latihan/module/main_navigation/view/main_navigation_view.dart';
import 'package:flutter_latihan/shared/theme/theme.dart';
import 'package:flutter_latihan/state_util.dart';
import 'package:flutter/material.dart';

void main() async {
  runMainApp();
}

runMainApp() async {
  return runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Capek Ngoding',
      navigatorKey: Get.navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: getDefaultTheme(),
      home: const MainNavigationView(),
    );
  }
}
