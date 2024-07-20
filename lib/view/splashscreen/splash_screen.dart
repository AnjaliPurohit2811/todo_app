import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/view/homepage/home_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});


  @override
  Widget build(BuildContext context) {
    Timer( const Duration(seconds: 5), () {
     Get.to(HomePage());
    });
    return Scaffold(
      backgroundColor: Color(0xffD6D7EF),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 250, left: 40),
            child: Container(
              height: 400,
              width: 350,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('asset/img/logo.png')),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
