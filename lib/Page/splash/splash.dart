// ignore_for_file: library_private_types_in_public_api

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:rusconsign/authentication/controllers/auth_login_controller.dart';
import 'package:rusconsign/utils/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final loginOption = Get.put(AuthLoginController());
  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 1650), () {
      if (loginOption.successfulLogin.value == true) {
        Get.offNamed("/menu");
      } else {
        Get.offNamed("/login");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Lottie.asset(
          'assets/animation/rus_consign1.json',
          width: 200,
          height: 200,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
