import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rusconsign/utils/extension.dart';
import '../../../utils/app_responsive.dart';
import '../../../utils/colors.dart';
import '../../../utils/text_style.dart';
import '../user_profile_controller.dart';

class CustomInfo extends StatelessWidget {
  final IconData icon;
  final String info;
  final String infoNumber;

  const CustomInfo({
    required this.icon,
    required this.info,
    required this.infoNumber,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          width: 55,
          height: 55,
          decoration: const ShapeDecoration(
            color: Color(0xFFF5F5F5),
            shape: OvalBorder(),
          ),
          child: Icon(icon),
        ),
        Text(info,
            textAlign: TextAlign.center,
            style: AppTextStyle().textInfoBold(AppColors.description)),
        Text(infoNumber,
            textAlign: TextAlign.center,
            style: AppTextStyle().descriptionBold(AppColors.hargaStat))
      ].withSpaceBetween(height: 8),
    );
  }
}

class MyButtonProfile extends StatelessWidget {
  const MyButtonProfile({
    Key? key,
    this.prefixIcon,
    this.suffixIcon,
    this.text = "",
    this.textAlign = TextAlign.start,
    this.backgroundColor = const Color(0xff292929),
    this.foregroundColor = const Color(0xffffffff),
    this.isExpand = true,
    required this.onClick,
    this.label = "",
    this.labelWidth,
  }) : super(key: key);

  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final String text;
  final TextAlign textAlign;
  final Color backgroundColor;
  final Color foregroundColor;
  final bool isExpand;
  final VoidCallback onClick;
  final String label;
  final double? labelWidth;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: labelWidth,
          child: Text(
            label,
            style: const TextStyle(color: AppColors.description),
          ),
        ),
        Expanded(
          child: SizedBox(
            height: 40,
            child: TextButton(
              onPressed: onClick,
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                backgroundColor: backgroundColor,
                foregroundColor: foregroundColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(prefixIcon),
                  Text(
                    text,
                    textAlign: textAlign,
                    style: const TextStyle(fontSize: 14),
                  ),
                  Icon(suffixIcon),
                ].withSpaceBetween(width: 8),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class FilterButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final int index;

  const FilterButton({
    Key? key,
    required this.text,
    required this.icon,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserProfilePageController filterButtonController = Get.find();

    return Obx(() => ElevatedButton.icon(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
          return filterButtonController.selectedIndex == index
              ? AppColors.button1
              : AppColors.cardIconFill;
        }),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        fixedSize: MaterialStateProperty.all<Size>(
          Size(AppResponsive().screenWidth(context) * 0.290,
              AppResponsive().screenWidth(context) * 0.04),
        ),
      ),
      icon: Icon(
        icon,
        color: filterButtonController.selectedIndex == index
            ? AppColors.activeIconType
            : AppColors.nonActiveIcon,
      ),
      label: Text(
        text,
        style: TextStyle(
          color: filterButtonController.selectedIndex == index
              ? AppColors.textButton1
              : AppColors.description,
          fontSize: 12,
        ),
      ),
      onPressed: () {
        if (filterButtonController.selectedIndex != index) {
          filterButtonController.setSelectedFilter(index);
        }
      },
    ));
  }
}
