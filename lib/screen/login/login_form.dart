// ignore_for_file: unused_field, must_be_immutable, avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:miniproject/components/custom_textfield.dart';
import 'package:miniproject/components/round_button.dart';
import 'package:miniproject/components/social_media_options.dart';
import 'package:miniproject/screen/welcome.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKeyLogin = GlobalKey<FormState>();
  final _userController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const Text(
            "เข้าสู่ระบบ",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Form(
              key: _formKeyLogin,
              child: Column(children: [
                customTextField(
                  controller: _userController,
                  hintText: "Username",
                  prefixIcon: const Icon(Icons.person),
                  obscureText: false,
                  textInputType: TextInputType.text,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "กรุณากรอกUsername";
                    } else {}
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                customTextField(
                  controller: _passwordController,
                  hintText: "Password",
                  prefixIcon: const Icon(Icons.lock),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "กรุณากรอกรหัสผ่าน";
                    } else if (value.length < 6) {
                      return "กรุณากรอกรหัสผ่านอย่างน้อย 6 ตัวอักษร";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: const Text("ลืมรหัสผ่าน ?"),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                RoundedButton(
                    label: "LOGIN",
                    onPressed: () {
                      if (_formKeyLogin.currentState!.validate()) {
                        Get.to(const WelcomeScreen());
                        _formKeyLogin.currentState!.save();
                        print("Email: ${_userController.text}");
                        print("Password: ${_passwordController.text}");
                      } else {
                        print('กรอกรหัส');
                      }
                    })
              ])),
          const SizedBox(
            height: 10,
          ),
          const SocialMediaOptions(),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("ยังไม่มีบัญชีกับเรา ? "),
              InkWell(
                onTap: () {},
                child: const Text(
                  "สมัครฟรี",
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
