import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:rusconsign/utils/app_responsive.dart';
import 'package:rusconsign/utils/colors.dart';
import 'package:rusconsign/utils/text_style.dart';

class ButtonProfile extends StatelessWidget {
  final IconData icon;
  final String text;
  final String toPage;

  const ButtonProfile({
    Key? key,
    required this.icon,
    required this.text,
    required this.toPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppResponsive().screenHeight(context) * 0.05,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            elevation: 0,
            shape: const BeveledRectangleBorder()),
        onPressed: () {
          Get.toNamed(toPage);
        },
        child: Row(
          children: [
            Icon(icon, color: AppColors.description),
            const Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
            Expanded(
              child: Text(
                text,
                style: AppTextStyle().description(context, AppColors.description),
              ),
            ),
            Icon(
              FeatherIcons.chevronRight,
              color: AppColors.description,
            )
          ],
        ),
      ),
    );
  }
}