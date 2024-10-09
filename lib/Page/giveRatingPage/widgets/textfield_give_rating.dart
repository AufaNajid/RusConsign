

import 'package:flutter/material.dart';
import 'package:rusconsign/utils/colors.dart';
import 'package:rusconsign/utils/text_style.dart';

class TextFieldGiveRating extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final int maxlines;

  const TextFieldGiveRating({
    Key? key,
    required this.hintText,
    required this.controller,
    required this.maxlines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextField(
        controller: controller,
        style: AppTextStyle().descriptionBold(context, AppColors.description),
        cursorColor: AppColors.hargaStat,
        textAlign: TextAlign.left,
        maxLines: maxlines,
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
            hintStyle: AppTextStyle().description(context, AppColors.description)),
      ),
    );
  }
}
