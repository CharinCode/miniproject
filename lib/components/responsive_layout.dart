// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:miniproject/themes/colors.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileChild;

  const ResponsiveLayout({super.key, required this.mobileChild});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [primaryDark, primary],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  elevation: 12,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  //using for respon sivelayout
                  // Using for responsive layout
                  child: LayoutBuilder(builder: (
                    BuildContext context,
                    BoxConstraints constraints,
                  ) {
                    // เราจะใช้ constraints มาเช็คว่าหน้าจอของเรามีขนาดเท่าไหร่
                    Widget childWidget = mobileChild;
                    if (constraints.maxWidth > 800) {
                      return Text('ยังไม่รองรับ');
                    }
                    return childWidget;
                  }),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
