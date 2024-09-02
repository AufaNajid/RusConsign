import 'package:flutter/material.dart';
import 'package:rusconsign/utils/app_responsive.dart';
import 'package:rusconsign/utils/colors.dart';
import 'package:rusconsign/utils/size_data.dart';
import 'package:rusconsign/utils/text_style.dart';
import 'package:url_launcher/url_launcher.dart';

class ButtonIconWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final String noWhatsapp;

  const ButtonIconWidget({
    super.key,
    required this.icon,
    required this.title, required this.noWhatsapp,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: AppResponsive().screenWidth(context) * 0.09,
      child: ElevatedButton.icon(
        icon: Icon(
          icon,
          color: AppColors.activeIconType,
          size: SizeData.iconSize,
        ),
        onPressed: () async {
          var url = Uri.parse("https://wa.me/$noWhatsapp");
          await launchUrl(url);
          },
        style: ButtonStyle(
          elevation: const MaterialStatePropertyAll(0),
          padding: const MaterialStatePropertyAll(EdgeInsets.zero),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          backgroundColor: const MaterialStatePropertyAll(AppColors.button1),
        ),
        label: Text(
          title,
          style: AppTextStyle().subHeader(context, AppColors.textButton1),
        ),
      ),
    );
  }
}
