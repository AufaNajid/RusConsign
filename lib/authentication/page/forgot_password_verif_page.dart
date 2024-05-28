// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rusconsign/authentication/controllers/forgetpassword_controller.dart';
import 'package:rusconsign/authentication/widget/text_field_widget.dart';
import 'package:rusconsign/utils/app_responsive.dart';
import 'package:rusconsign/utils/colors.dart';
import 'package:rusconsign/utils/text_style.dart';

class ForgotPasswordPage extends StatelessWidget {
   ForgotPasswordPage({Key? key}) : super(key: key);
  final TextEditingController emailController = TextEditingController();
   final ForgotPasswordController controller = Get.put(ForgotPasswordController());

  @override
  Widget build(BuildContext context) {
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Verifikasi Email',
                      style: AppTextStyle().subHeader(AppColors.titleLine),
                    ),
                    const SizedBox(height: 12),
                    // Bind TextEditingController to TextFieldInput
                    TextFieldInput(
                      hintText: 'masukkanEmail'.tr,
                      controller: emailController,
                    ),
                    const SizedBox(height: 12),
                  ],
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: AppResponsive().screenWidth(context),
                  height: AppResponsive().screenWidth(context) * 0.1,
                  child: ElevatedButton(
                    onPressed: () {
                      // Call forgotPassword function when button is pressed
                      controller
                          .forgotPassword(emailController.text)
                          .then((message) {
                        // Show message according to the response
                        print('Response: $message');
                        if (message == 'Email found, proceed to next page') {
                          // Proceed to next page
                          Get.offNamed('/forgotpasswordresetpage');
                        } else {
                          // Show error message
                          Get.snackbar('Error', message,
                              backgroundColor: Colors.red,
                              colorText: Colors.white);
                        }
                      }).catchError((error) {
                        // Handle error
                        print('Error: $error');
                        Get.snackbar('Error', 'Failed to send request',
                            backgroundColor: Colors.red, colorText: Colors.white);
                      });
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4))),
                      backgroundColor:
                      MaterialStateProperty.all<Color>(AppColors.button1),
                    ),
                    child: Text('verivikasi'.tr,
                        style: AppTextStyle().header(AppColors.textButton1)),
                  ),
                ),
                const SizedBox(height: 30),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.offNamed('/login');
                      },
                      child: Text(
                        'kembali'.tr,
                        style:
                        AppTextStyle().descriptionBold(AppColors.description),
                      ),
                    )
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