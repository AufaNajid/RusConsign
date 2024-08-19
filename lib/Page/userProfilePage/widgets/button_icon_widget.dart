import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rusconsign/utils/app_responsive.dart';
import 'package:rusconsign/utils/colors.dart';
import 'package:rusconsign/utils/text_style.dart';

class ButtonIconWidget extends StatelessWidget {
  final IconData icon;
  final String title;

  const ButtonIconWidget({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: AppResponsive().screenWidth(context) * 0.09,
      child: ElevatedButton.icon(
        icon: Icon(
          icon,
          color: AppColors.activeIconType,
        ),
        onPressed: () {
          Get.toNamed('/chatpage');
        },
        style: ButtonStyle(
          elevation: const MaterialStatePropertyAll(0),
          padding: const MaterialStatePropertyAll(EdgeInsets.zero),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          backgroundColor: const MaterialStatePropertyAll(AppColors.button1),
        ),
        label: Text(
          title,
          style: AppTextStyle().subHeader(context, AppColors.textButton1),
        ),
      ),
    );
  }
}
