import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rusconsign/utils/colors.dart';
import 'package:rusconsign/utils/text_style.dart';
class TextFieldEditData extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final int maxlines;

  const TextFieldEditData({
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

class TextFieldEditDataNumber extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;

  const TextFieldEditDataNumber({
    Key? key,
    required this.hintText,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))],
      style: AppTextStyle().descriptionBold(context, AppColors.description,),
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
          hintStyle: AppTextStyle().description(context, AppColors.description)),
    );
  }
}
