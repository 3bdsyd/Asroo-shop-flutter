import 'dart:async';
import 'package:asroo_shop/utils/text_utils.dart';
import 'package:asroo_shop/view/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      Get.off(const WelcomeScreen(), transition: Transition.rightToLeft);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset('assets/images/online-delivery-service.json'),
          TextUtils(
            text: 'Asroo Shop',
            fontWeight: FontWeight.bold,
            color: context.theme.highlightColor,
            fontSize: 25,
            decoration: TextDecoration.none,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 200,
          ),
        ],
      ),
    );
  }
}
