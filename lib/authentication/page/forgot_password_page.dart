import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rusconsign/authentication/widget/text_field_widget.dart';
import 'package:rusconsign/utils/app_responsive.dart';
import 'package:rusconsign/utils/colors.dart';
import 'package:rusconsign/utils/text_style.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

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
                      'Reset Password',
                      style: AppTextStyle().subHeader(AppColors.titleLine),
                    ),
                    const SizedBox(height: 12),
                    TextFieldInput(hintText: 'masukkanEmail'.tr),
                    const SizedBox(height: 12),
                    TextFieldPassword(hintText: 'masukkanPasswordBaru'.tr),
                    const SizedBox(height: 12),
                    TextFieldConfirmPassword(hintText: 'konfirmasiPasswordBaru'.tr),
                    const SizedBox(height: 10),
                  ],
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: AppResponsive().screenWidth(context),
                  height: AppResponsive().screenWidth(context) * 0.1,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.offNamed('/login');
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4))),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(AppColors.button1),
                    ),
                    child: Text('ubah'.tr,
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
