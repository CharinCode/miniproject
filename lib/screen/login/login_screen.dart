// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:miniproject/components/mobile_layout.dart';
import 'package:miniproject/components/responsive_layout.dart';

import 'package:miniproject/screen/login/login_form.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
        mobileChild: MobileLayout(
            imageWidget: Image.asset(
              "assets/images/login.png",
              width: 70,
            ),
            dataWidget: LoginForm()));
  }
}
