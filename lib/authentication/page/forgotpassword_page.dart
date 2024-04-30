import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rusconsign/utils/colors.dart';
import 'package:rusconsign/utils/extension.dart';

import '../widget/widget.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        height: double.infinity,
        color: AppColors.background,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(
                image: AssetImage('assets/images/logo.png'),
                height: 95,
                width: 68,
              ),
              const SizedBox(height: 80),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Reset Password",
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.description,
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  const MyTextField(labelText: "Masukkan Email..."),
                  const MyTextField(labelText: "Masukkan Password Baru  ...", isObscured: true),
                  const MyTextField(labelText: "Konfirmasi Password...", isObscured: true),
                ].withSpaceBetween(height: 10),
              ),
              const SizedBox(height: 40),
              MyButton(
                onClick: () {
                  Get.toNamed("/login");
                },
                text: "Login",
                backgroundColor: AppColors.hargaStat,
                foregroundColor: AppColors.background,
                textAlign: TextAlign.center,
              ),
              MyButton(
                onClick: () {
                  Get.toNamed("/login");
                },
                text: "Kembali",
                backgroundColor: AppColors.background,
                foregroundColor: AppColors.description,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              const Text(
                "Dengan register ke RUS Consign, kamu menyetujui",
                style: TextStyle(
                  fontSize: 12,
                  color: AppColors.description,
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.none,
                ),
              ),
              const Text(
                "Ketentuan dan Kebijakan Privasi kami.",
                style: TextStyle(
                  fontSize: 12,
                  color: AppColors.description,
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.none,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
