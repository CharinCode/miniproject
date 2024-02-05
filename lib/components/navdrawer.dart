// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:miniproject/screen/login/login_screen.dart';
import 'package:miniproject/screen/productpage.dart';
import 'package:miniproject/screen/welcome.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.orangeAccent,
            ),
            child: Text(
              'Drawer Header',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text(
              'Home',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: () {
              Get.to(WelcomeScreen());
            },
          ),
          ListTile(
            leading: Icon(Icons.production_quantity_limits),
            title: Text(
              'Product',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: () {
              Get.to(ProductPage());
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text(
              'Logout',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: () {
              Get.to(LoginScreen());
            },
          ),
          // Add more list tiles for other menu items
        ],
      ),
    );
  }
}
