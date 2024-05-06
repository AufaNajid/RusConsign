import 'package:flutter/material.dart';
import 'package:rusconsign/utils/colors.dart';
import 'package:rusconsign/utils/text_style.dart';

class TextFieldRegisterSeller extends StatelessWidget {
  const TextFieldRegisterSeller({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide.none
        ),
        filled: true,
        fillColor: AppColors.cardIconFill,
        focusColor: AppColors.cardIconFill,
        hintText: "Masukkan nama",
        hintStyle: AppTextStyle().description(AppColors.description)),
        textAlign: TextAlign.left,
        style: AppTextStyle().description(AppColors.description),
    );
  }
}