import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rusconsign/utils/colors.dart';
import 'package:rusconsign/utils/text_style.dart';

class TextFieldRegisterSeller extends StatelessWidget {
  final String hintText;

  const TextFieldRegisterSeller({
    Key? key,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: AppTextStyle().descriptionBold(AppColors.description),
      cursorColor: AppColors.hargaStat,
      textAlign: TextAlign.left,
      decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: AppColors.cardIconFill,
          hintText: hintText,
          hintStyle: AppTextStyle().description(AppColors.description)),
    );
  }
}

class TextFieldRegisterSellerNumber extends StatelessWidget {
  final String hintText;

  const TextFieldRegisterSellerNumber({
    Key? key,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))],
      style: AppTextStyle().descriptionBold(AppColors.description),
      cursorColor: AppColors.hargaStat,
      textAlign: TextAlign.left,
      decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: AppColors.cardIconFill,
          hintText: hintText,
          hintStyle: AppTextStyle().description(AppColors.description)),
    );
  }
}
