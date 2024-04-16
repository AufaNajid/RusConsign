import 'package:flutter/material.dart';
import 'package:rusconsign/authentication/widget/widget.dart';
import 'package:rusconsign/extension.dart';
import 'package:rusconsign/authentication/controllers/googleController.dart';


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
                  myTextField(labelText: "Masukkan Username..."),
                  myTextField(labelText: "Masukkan Email..."),
                  myTextField(labelText: "Masukkan Password...", isObscured: true),
                ].withSpaceBetween(height: 10),
              ),
              SizedBox(height: 40),
              myButton(
                onClick: () {
                  // Handle register button pressed
                  _register(context);
                },
                text: "Register",
                backgroundColor: Color(0xFFFF3D3D),
                foregroundColor: Color(0xFFFFFFFF),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  // Handle Google sign-in button pressed
                  _googleController.signInWithGoogle(context);
                },
                child: Column(
                  children: [
                    Text("Register dengan", style: TextStyle(
                        fontSize: 11,
                        color: Color(0xFF30475E),
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.none
                    )),
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
                      color: Color(0xFF30475E),
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Navigate to login page
                      Navigator.pushReplacementNamed(context, '/login');
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 11,
                        color: Color(0xFF30475E),
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                ].withSpaceBetween(height: 20),
              ),
              const SizedBox(height: 20),
              Text(
                "Dengan register ke RUS Consign, kamu menyetujui",
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xFF30475E),
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.none,
                ),
              ),
              Text(
                "Ketentuan dan Kebijakan Privasi kami.",
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xFF30475E),
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

  void _register(BuildContext context) {
    // Perform registration logic here
    // Example:
    Navigator.pushReplacementNamed(context, '/login'); // Navigate to login page
  }
}
