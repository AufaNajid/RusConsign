import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rusconsign/authentication/controllers/google_controller.dart';
import 'package:rusconsign/authentication/widget/text_field_widget.dart';
import 'package:rusconsign/utils/app_responsive.dart';

import '../../utils/colors.dart';
import '../../utils/text_style.dart';

class RegisterPage extends StatelessWidget {
  final GoogleController googleController = GoogleController();

  RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    TextFieldInput(hintText: 'masukkanUsername'.tr),
                    const SizedBox(height: 12),
                    TextFieldInput(hintText: 'masukkanEmail'.tr),
                    const SizedBox(height: 12),
                    TextFieldPassword(hintText: 'masukkanPassword'.tr)
                  ],
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: AppResponsive().screenWidth(context),
                  height: AppResponsive().screenWidth(context) * 0.1,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.offNamed('/menu');
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4))),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(AppColors.button1),
                    ),
                    child: Text('Register',
                        style: AppTextStyle().header(AppColors.textButton1)),
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
                        googleController.signInWithGoogle(context);
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
