// ignore_for_file: prefer_const_constructors

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:miniproject/screen/productpage.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final introKey = GlobalKey<IntroductionScreenState>();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([]);

    const bodyStyle = TextStyle(fontSize: 19.0);

    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return SafeArea(
      child: IntroductionScreen(
        key: introKey,
        globalBackgroundColor: Colors.white,

        pages: [
          PageViewModel(
            title: "Charin Shop",
            body: "สินค้าดี มีคุณภาพ สั่งซื้อง่าย สะดวกสบาย เพียงไม่กี่คลิ๊ก",
            image: Padding(
              padding: const EdgeInsets.only(top: 100.0),
              child: Image.network(
                'https://cdn-icons-png.flaticon.com/512/3225/3225194.png',
                width: 250,
              ),
            ),
            decoration: pageDecoration,
          ),
          PageViewModel(
            title: "Charin Shop",
            body:
                "ติดตามการซื้อขายได้ทุกที่ทุกเวลา ด้วยระบบที่ออกแบบมาเพื่อความง่าย",
            image: Padding(
              padding: const EdgeInsets.only(top: 100.0),
              child: Image.network(
                'https://static.vecteezy.com/system/resources/previews/009/418/828/non_2x/shop-marketing-3d-icon-illustration-for-your-website-user-interface-and-presentation-3d-render-illustration-free-png.png',
                width: 250,
              ),
            ),
            decoration: pageDecoration,
          ),
        ],
        onDone: () => Get.to(ProductPage()),
        onSkip: () => Get.to(ProductPage()),
        showSkipButton: true,
        skipOrBackFlex: 0,
        nextFlex: 0,
        showBackButton: false,
        //rtl: true, // Display as right-to-left
        back: const Icon(Icons.arrow_back),
        skip: const Text('ข้าม', style: TextStyle(fontWeight: FontWeight.w600)),
        next: const Icon(Icons.arrow_forward),
        done: const Text('เสร็จสิ้น',
            style: TextStyle(fontWeight: FontWeight.w600)),
        curve: Curves.fastLinearToSlowEaseIn,
        controlsMargin: const EdgeInsets.all(16),
        controlsPadding: kIsWeb
            ? const EdgeInsets.all(12.0)
            : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
        dotsDecorator: const DotsDecorator(
          size: Size(10.0, 10.0),
          color: Color(0xFFBDBDBD),
          activeSize: Size(22.0, 10.0),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
          ),
        ),
        dotsContainerDecorator: const ShapeDecoration(
          color: Colors.black87,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
        ),
      ),
    );
  }
}
