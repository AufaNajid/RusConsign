// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rusconsign/Page/addItemPage/add_item_form_controller.dart';
import 'package:rusconsign/utils/app_responsive.dart';
import 'package:rusconsign/utils/colors.dart';
import 'package:rusconsign/utils/text_style.dart';
class CategoryButton extends StatelessWidget {
  final int index;
  final String text;

  const CategoryButton({
    Key? key,
    required this.text,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AddItemFormController categoryButtonController = Get.find();

    return Obx(() => ElevatedButton(
          style: ButtonStyle(
            elevation: const MaterialStatePropertyAll(0),
            padding: const MaterialStatePropertyAll(EdgeInsets.zero),
            backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
              return categoryButtonController.selectedIndex == index
                  ? AppColors.button1
                  : AppColors.cardIconFill;
            }),
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
            ),
            fixedSize: MaterialStatePropertyAll(
              Size(AppResponsive().screenWidth(context) * 0.2,
                  AppResponsive().screenWidth(context) * 0.04),
            ),
          ),
          onPressed: () {
            if (categoryButtonController.selectedIndex != index) {
              categoryButtonController.setSelectedFilter(index);
            }
          },
          child: Text(text.tr,
              style: AppTextStyle().description(context, categoryButtonController.selectedIndex == index
                  ? AppColors.textButton1
                  : AppColors.description)),
        ));
  }
}
