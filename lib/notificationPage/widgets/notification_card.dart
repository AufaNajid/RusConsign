import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rusconsign/utils/app_responsive.dart';
import 'package:rusconsign/utils/colors.dart';
import 'package:rusconsign/utils/text_style.dart';

class NotificationCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String desc;
  final DateTime date;

  const NotificationCard({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.desc,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.cardIconFill,
      margin: const EdgeInsets.symmetric(vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: GestureDetector(
        onTap: () {
          Get.toNamed("/detailpage");
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: AppResponsive().screenWidth(context) * 0.2,
                width: AppResponsive().screenWidth(context) * 0.2,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: Image.network(
                    imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: AppTextStyle().header(AppColors.titleLine),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      date.toString().substring(0, 16),
                      style: AppTextStyle().textInfoBold(AppColors.hargaStat),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      desc,
                      style: AppTextStyle().textInfo(AppColors.description),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
