import 'package:flutter/material.dart';
import 'package:rusconsign/utils/colors.dart';
import 'package:rusconsign/utils/text_style.dart';

class AccountSetting extends StatelessWidget {
  const AccountSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
      },
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "exampleemail123@gmail.com",
                style: AppTextStyle().description(context, AppColors.description),
              ),
              const Spacer(),
              const ClipOval(
                child: SizedBox(
                  height: 30,
                  width: 30,
                  child: Image(
                    image: AssetImage("assets/images/google_logo.png"),
                    height: 14,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
