import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:rusconsign/Page/registerSeller/controller/mitra_controller.dart';
import 'package:rusconsign/authentication/controllers/auth_login_controller.dart';
import 'package:rusconsign/utils/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  final loginOption = Get.put(AuthLoginController());
  final checkMitra = Get.put(MitraController());

  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(milliseconds: 2500),
      () async {
        await loginOption.checkUserStatus();
        checkMitra.checkMitraStatus();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Lottie.asset(
          repeat: false,
          'assets/animation/rus_consign1.json',
          width: 200,
          height: 200,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
