import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rusconsign/Page/productmanagePage/product_manage_controller.dart';
import 'package:rusconsign/utils/app_responsive.dart';
import 'package:rusconsign/utils/colors.dart';

class FilterProductButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final int index;

  const FilterProductButton({
    Key? key,
    required this.text,
    required this.icon,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProductManageController filterButtonController = Get.find();

    return Expanded(
      child: Obx(() => ElevatedButton.icon(
            style: ButtonStyle(
              elevation: const MaterialStatePropertyAll(0),
              padding: const MaterialStatePropertyAll(EdgeInsets.zero),
              backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
                return filterButtonController.selectedIndex == index
                    ? AppColors.button1
                    : AppColors.cardIconFill;
              }),
              shape: MaterialStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              fixedSize: MaterialStatePropertyAll(
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
          )),
    );
  }
}
