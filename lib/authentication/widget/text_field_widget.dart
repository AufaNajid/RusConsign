import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:rusconsign/authentication/controllers/auth_controller.dart';
import '../../utils/colors.dart';
import '../../utils/text_style.dart';

class TextFieldInput extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;


  const TextFieldInput({
    Key? key,
    required this.hintText,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: AppColors.hargaStat,
      controller: controller,
      style: AppTextStyle().descriptionBold(AppColors.description),
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: AppColors.cardIconFill,
        hintText: hintText,
        hintStyle: AppTextStyle().description(AppColors.description),
      ),
      textAlign: TextAlign.left,
    );
  }
}

class TextFieldPassword extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;

  const TextFieldPassword({
    Key? key,
    required this.hintText,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find();
    return Obx(
      () => TextField(
        style: AppTextStyle().descriptionBold(AppColors.description),
        controller: controller,
        cursorColor: AppColors.hargaStat,
        textAlign: TextAlign.left,
        obscureText: !authController.isShow.value,
        decoration: InputDecoration(
          suffixIcon: GestureDetector(
            onTap: () {
              authController.showPassword();
            },
            child: Icon(
              authController.isShow.value
                  ? FeatherIcons.eye
                  : FeatherIcons.eyeOff,
              color: authController.isShow.value
                  ? AppColors.activeIcon
                  : AppColors.nonActiveIcon,
            ),
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: AppColors.cardIconFill,
          hintText: hintText,
          hintStyle: AppTextStyle().description(AppColors.description),
        ),
      ),
    );
  }
}

class TextFieldConfirmPassword extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;

  const TextFieldConfirmPassword({
    Key? key,
    required this.hintText,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find();
    return Obx(
      () => TextField(
        style: AppTextStyle().descriptionBold(AppColors.description),
        cursorColor: AppColors.hargaStat,
        textAlign: TextAlign.left,
        obscureText: !authController.isShow.value,
        decoration: InputDecoration(
          suffixIcon: GestureDetector(
            onTap: () {
              authController.isShow();
            },
            child: Icon(
              authController.isShow.value
                  ? FeatherIcons.eye
                  : FeatherIcons.eyeOff,
              color: authController.isShow.value
                  ? AppColors.activeIcon
                  : AppColors.nonActiveIcon,
            ),
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: AppColors.cardIconFill,
          hintText: hintText,
          hintStyle: AppTextStyle().description(AppColors.description),
        ),
      ),
    );
  }
}
