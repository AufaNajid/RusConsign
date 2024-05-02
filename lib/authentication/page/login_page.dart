import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rusconsign/authentication/controllers/google_controller.dart';
import 'package:rusconsign/authentication/widget/widget.dart';
import 'package:rusconsign/utils/colors.dart';
import 'package:rusconsign/utils/extension.dart';

import '../../utils/text_style.dart';

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
                  const MyTextField(
                      labelText: "Masukkan Password...", isObscured: true),
                ].withSpaceBetween(height: 10),
              ),
              const SizedBox(height: 40),
              MyButton(
                onClick: () {
                  Get.toNamed("/register");
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
                    Text("Login dengan",
                        style:
                            AppTextStyle().description(AppColors.description)),
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
                  Text("Belum Punya Akun?",
                      style: AppTextStyle().description(AppColors.description)),
                  TextButton(
                    onPressed: () {
                      Get.toNamed("/register");
                    },
                    child: Text("Register",
                        style: AppTextStyle()
                            .descriptionBold(AppColors.description)),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text("Dengan Login ke RUS Consign, kamu menyetujui",
                  style: AppTextStyle().description(AppColors.description)),
              Text("Ketentuan dan Kebijakan Privasi kami.",
                  style: AppTextStyle().description(AppColors.description)),
            ],
          ),
        ),
      ),
    );
  }
}
