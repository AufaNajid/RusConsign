import 'package:flutter/material.dart';
import '../../../utils/colors.dart';
import '../../../utils/text_style.dart';

class TextFieldInputChat extends StatelessWidget {
  final String hintText;

  const TextFieldInputChat({
    super.key,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: AppColors.hargaStat,
      style: AppTextStyle().descriptionBold(context, AppColors.description),
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
        hintStyle: AppTextStyle().description(context, AppColors.description),
      ),
      textAlign: TextAlign.left,
    );
  }
}