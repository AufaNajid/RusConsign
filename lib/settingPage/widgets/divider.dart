import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:rusconsign/utils/colors.dart';

import '../../utils/app_responsive.dart';
import '../../utils/text_style.dart';

class DividerProfile extends StatelessWidget {
  const DividerProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Icon(
              FeatherIcons.user,
              color: AppColors.nonActiveIcon,
            ),
            SizedBox(width: AppResponsive().screenWidth(context) * 0.04),
            Text("Profil",
                style: AppTextStyle().subHeader(AppColors.description)),
            const Spacer(),
            SizedBox(
              height: AppResponsive().screenWidth(context) * 0.070,
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4))),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(AppColors.button1),
                    fixedSize: MaterialStateProperty.all<Size>(Size(
                        AppResponsive().screenWidth(context) * 0.25,
                        AppResponsive().screenWidth(context) * 0.070))),
                child: Text("Simpan",
                    style: AppTextStyle().textInfoBold(AppColors.textButton1)),
              ),
            ),
          ],
        ),
        const Divider(thickness: 1, color: AppColors.titleLine),
        const SizedBox(height: 4)
      ],
    );
  }
}

class DividerComponent extends StatelessWidget {
  final IconData icon;
  final String text;
  const DividerComponent({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(
              icon,
              color: AppColors.nonActiveIcon,
            ),
            SizedBox(width: AppResponsive().screenWidth(context) * 0.04),
            Text(text, style: AppTextStyle().subHeader(AppColors.description)),
          ],
        ),
        const Divider(thickness: 1, color: AppColors.titleLine),
        const SizedBox(height: 4)
      ],
    );
  }
}
