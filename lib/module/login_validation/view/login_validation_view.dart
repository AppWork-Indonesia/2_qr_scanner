
import 'package:flutter/material.dart';
import 'package:flutter_latihan/core.dart';
import '../controller/login_validation_controller.dart';

class LoginValidationView extends StatefulWidget {
    const LoginValidationView({Key? key}) : super(key: key);

    Widget build(context, LoginValidationController controller) {
    controller.view = this;

    return Scaffold(
        appBar: AppBar(
        title: const Text("LoginValidation"),
        actions: const [],
        ),
        body: SingleChildScrollView(
        child: Container(
            padding: const EdgeInsets.all(10.0),
            child: Column(
            children: const [],
            ),
        ),
        ),
    );
    }

    @override
    State<LoginValidationView> createState() => LoginValidationController();
}
    