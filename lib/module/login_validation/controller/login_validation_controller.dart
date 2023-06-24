
import 'package:flutter/material.dart';
import 'package:flutter_latihan/state_util.dart';
import '../view/login_validation_view.dart';

class LoginValidationController extends State<LoginValidationView> {
    static late LoginValidationController instance;
    late LoginValidationView view;

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
        
    