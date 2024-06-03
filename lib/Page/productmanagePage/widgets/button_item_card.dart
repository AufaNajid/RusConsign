import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rusconsign/utils/app_responsive.dart';
import 'package:rusconsign/utils/colors.dart';
import 'package:rusconsign/utils/text_style.dart';

class ButtonItemCardEdit extends StatelessWidget {
  final IconData icon;
  final String text;
  const ButtonItemCardEdit({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton.icon(
            style: ButtonStyle(
              elevation: const MaterialStatePropertyAll(0),
              padding: const MaterialStatePropertyAll(EdgeInsets.zero),
              backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
                return AppColors.button1;
              }),
              shape: MaterialStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              fixedSize: MaterialStatePropertyAll(
                Size(AppResponsive().screenWidth(context) * 0.450,
                    AppResponsive().screenWidth(context) * 0.04),
              ),
            ),
            icon: Icon(
              icon,
              color: AppColors.activeIconType
            ),
            label: Text(
              text,
              style: AppTextStyle().subHeader(AppColors.textButton1)
              ),
            onPressed: () {
              Get.toNamed("/editdataproduct");
            },
            ),
    );
  }
}

class ButtonItemCardTrash extends StatelessWidget {
  final IconData icon;
  final String text;
  const ButtonItemCardTrash({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton.icon(
            style: ButtonStyle(
              elevation: const MaterialStatePropertyAll(0),
              padding: const MaterialStatePropertyAll(EdgeInsets.zero),
              backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
                return AppColors.button1;
              }),
              shape: MaterialStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              fixedSize: MaterialStatePropertyAll(
                Size(AppResponsive().screenWidth(context) * 0.450,
                    AppResponsive().screenWidth(context) * 0.04),
              ),
            ),
            icon: Icon(
              icon,
              color: AppColors.activeIconType
            ),
            label: Text(
              text,
              style: AppTextStyle().subHeader(AppColors.textButton1)
              ),
            onPressed: () {
              Get.toNamed("");
            },
            ),
    );
  }
}
