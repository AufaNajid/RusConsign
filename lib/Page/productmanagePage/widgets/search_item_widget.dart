import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:rusconsign/utils/app_responsive.dart';
import 'package:rusconsign/utils/colors.dart';
import 'package:rusconsign/utils/text_style.dart';

class SearchItemProductManage extends StatelessWidget {
  const SearchItemProductManage({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      SizedBox(
        width: AppResponsive().screenWidth(context) * 0.83,
        height: 50,
        child: TextField(
          cursorColor: AppColors.hargaStat,
          style: AppTextStyle().descriptionBold(AppColors.description),
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: AppColors.cardIconFill,
            hintText: 'cari'.tr,
            hintStyle: AppTextStyle().description(AppColors.description),
          ),
          textAlign: TextAlign.left,
        ),
      ),
      const Spacer(),
      SizedBox(
        width: 50,
        height: 50,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: Material(
              color: AppColors.cardIconFill,
              child: GestureDetector(
                onTap: () {},
                child: Icon(
                  FeatherIcons.search,
                  color: AppColors.borderIcon,
                ),
              )),
        ),
      ),
    ]);
  }
}
