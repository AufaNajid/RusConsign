import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rusconsign/authentication/controllers/googleController.dart';
import 'package:rusconsign/authentication/widget/widget.dart';
import 'package:rusconsign/extension.dart';

class RegisterPage extends StatelessWidget {
  final GoogleController _googleController = GoogleController();

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
                  MyTextField(labelText: "Masukkan Username..."),
                  MyTextField(labelText: "Masukkan Email..."),
                  MyTextField(labelText: "Masukkan Password...", isObscured: true),
                ].withSpaceBetween(height: 10),
              ),
              const SizedBox(height: 40),
              MyButton(
                onClick: () {
                  Get.toNamed("/login");
                },
                text: "Register",
                backgroundColor: const Color(0xFFFF3D3D),
                foregroundColor: const Color(0xFFFFFFFF),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  _googleController.signInWithGoogle(context);
                },
                child: Column(
                  children: [
                    Text(
                      "Register dengan",
                      style: TextStyle(
                        fontSize: 11,
                        color: const Color(0xFF30475E),
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
                  Text(
                    "Sudah Punya Akun?",
                    style: TextStyle(
                      fontSize: 11,
                      color: const Color(0xFF30475E),
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/login');
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 11,
                        color: const Color(0xFF30475E),
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),
              const Text(
                "Dengan register ke RUS Consign, kamu menyetujui",
                style: TextStyle(
                  fontSize: 12,
                  color: const Color(0xFF30475E),
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.none,
                ),
              ),
              const Text(
                "Ketentuan dan Kebijakan Privasi kami.",
                style: TextStyle(
                  fontSize: 12,
                  color: const Color(0xFF30475E),
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
