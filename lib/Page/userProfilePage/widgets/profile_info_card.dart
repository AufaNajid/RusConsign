import 'package:flutter/material.dart';
import 'package:rusconsign/utils/colors.dart';
import 'package:rusconsign/utils/size_data.dart';
import 'package:rusconsign/utils/text_style.dart';

class ProfileInfoCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String data;
  const ProfileInfoCard({
    super.key,
    required this.icon,
    required this.title,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Card(
        color: AppColors.background,
        surfaceTintColor: AppColors.background,
        elevation: 0,
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 60,
              width: 60,
              child: ClipOval(
                child: Material(
                  color: AppColors.cardIconFill,
                  child: Icon(
                    icon,
                    color: AppColors.nonActiveIcon,
                    size: SizeData.iconSize,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              title,
              style: AppTextStyle().textInfoBold(context, AppColors.description),
            ),
            const SizedBox(height: 10),
            Text(
              data,
              style: AppTextStyle().descriptionBold(context, AppColors.hargaStat),
            )
          ],
        ),
      ),
    );
  }
}
