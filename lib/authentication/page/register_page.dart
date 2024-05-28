import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rusconsign/authentication/controllers/auth_controller.dart';
import 'package:rusconsign/authentication/controllers/google_controller.dart';
import 'package:rusconsign/authentication/widget/text_field_widget.dart';
import 'package:rusconsign/utils/app_responsive.dart';

import '../../utils/colors.dart';
import '../../utils/text_style.dart';

class RegisterPage extends StatelessWidget {
  final GoogleController googleController = GoogleController();

  RegisterPage({Key? key}) : super(key: key);

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AuthController());
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Image(
                  image: AssetImage('assets/images/logo.png'),
                  height: 95,
                  width: 68,
                ),
                const SizedBox(height: 80),
                Column(
                  children: [
                    TextFieldInput(
                      hintText: 'masukkanUsername'.tr,
                      controller: controller.usernameTextEditingController,
                    ),
                    const SizedBox(height: 12),
                    TextFieldInput(
                      hintText: 'masukkanEmail'.tr,
                      controller: controller.emailTextEditingController,
                    ),
                    const SizedBox(height: 12),
                    TextFieldPassword(
                      hintText: 'masukkanPassword'.tr,
                      controller: controller.passwordTextEditingController,
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: AppResponsive().screenWidth(context),
                  height: AppResponsive().screenWidth(context) * 0.1,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (controller
                              .usernameTextEditingController.text.isNotEmpty &&
                          controller
                              .emailTextEditingController.text.isNotEmpty &&
                          controller
                              .passwordTextEditingController.text.isNotEmpty) {
                        await controller.signin(
                          controller.usernameTextEditingController.text,
                          controller.emailTextEditingController.text,
                          controller.passwordTextEditingController.text,
                        );
                        if (controller.successfulRegister.value) {
                          Get.offNamed("/login");
                        } else {
                          Get.snackbar('Error', controller.message.value);
                        }
                      } else {
                        controller.message.value = "Please fill in all fields";
                        controller.successfulRegister.value = false;
                        Get.snackbar('Error', controller.message.value);
                      }
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(AppColors.button1),
                    ),
                    child: Text(
                      'Register',
                      style: AppTextStyle().header(AppColors.textButton1),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Column(
                  children: [
                    Text('registerDengan'.tr,
                        style:
                            AppTextStyle().description(AppColors.description)),
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        _signinWithGoogle();
                      },
                      child: Image.asset(
                        'assets/images/google_logo.png',
                        height: 40,
                        width: 40,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('sudahPunyaAkun'.tr,
                        style:
                            AppTextStyle().description(AppColors.description)),
                    const SizedBox(width: 6),
                    GestureDetector(
                      onTap: () {
                        Get.offNamed("/login");
                      },
                      child: Text(
                        'Login',
                        style: AppTextStyle()
                            .descriptionBold(AppColors.description),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: AppResponsive().screenHeight(context) * 0.1),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: AppResponsive().screenWidth(context) * 0.7,
                      child: Text('descRegister'.tr,
                          textAlign: TextAlign.center,
                          style: AppTextStyle()
                              .description(AppColors.description)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Future<void> _signinWithGoogle() async {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  try {
    final GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken,
      );

      await _firebaseAuth.signInWithCredential(credential);
      print("Sign in with Google succeeded");
      // Setelah berhasil login, arahkan pengguna ke halaman lain
      Get.offNamed('/menu');
    } else {
      print("Sign in aborted by user");
    }
  } catch (e) {
    print("Error during sign in with Google: $e");
  }
}