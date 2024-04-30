import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rusconsign/authentication/controllers/google_controller.dart';
import 'package:rusconsign/authentication/widget/widget.dart';
import 'package:rusconsign/utils/colors.dart';
import 'package:rusconsign/utils/extension.dart';

class LoginPage extends StatelessWidget {
  final GoogleController _googleController = GoogleController();

  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
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
                children: [
                  const MyTextField(labelText: "Masukkan Username..."),
                  const MyTextField(labelText: "Masukkan Email..."),
                  const MyTextField(labelText: "Masukkan Password...", isObscured: true),
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
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  _googleController.signInWithGoogle(context);
                },
                child: Column(
                  children: [
                    const Text(
                      "Login dengan",
                      style: TextStyle(
                        fontSize: 11,
                        color: AppColors.description,
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Image.asset(
                      'assets/images/google_logo.png',
                      height: 40,
                      width: 40,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Sudah Punya Akun?",
                    style: TextStyle(
                      fontSize: 11,
                      color: AppColors.description,
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.toNamed("/login");
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 11,
                        color: AppColors.description,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                "Dengan Login ke RUS Consign, kamu menyetujui",
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
