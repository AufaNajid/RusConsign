import 'package:flutter/material.dart';
import 'package:rusconsign/utils/app_responsive.dart';
import 'package:rusconsign/utils/colors.dart';

class DropdownPayment extends StatelessWidget {
  const DropdownPayment({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: AppResponsive().screenWidth(context)*0.9,
          height: AppResponsive().screenHeight(context)*0.1,
          color: AppColors.cardIconFill,
        ),
      ],
    );
  }
}