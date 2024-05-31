import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rusconsign/Page/orderPage/order_page_controller.dart';
import 'package:rusconsign/utils/app_responsive.dart';
import 'package:rusconsign/utils/colors.dart';

class FilterOrderButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final int index;

  const FilterOrderButton({
    Key? key,
    required this.text,
    required this.icon,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final OrderPageController filterOrderController = Get.find();
    return Obx(
      () => SizedBox(
        width: AppResponsive().screenWidth(context) * 0.29,
        child: ElevatedButton.icon(
          style: ButtonStyle(
            elevation: MaterialStateProperty.all(0),
            padding: const MaterialStatePropertyAll(EdgeInsets.zero),
            backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
              return filterOrderController.selectedIndex == index
                  ? AppColors.button1
                  : AppColors.cardIconFill;
            }),
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
            ),
          ),
          icon: Icon(
            icon,
            color: filterOrderController.selectedIndex == index
                ? AppColors.activeIconType
                : AppColors.nonActiveIcon,
            size: 16,
          ),
          label: Text(
            text,
            style: TextStyle(
              color: filterOrderController.selectedIndex == index
                  ? AppColors.textButton1
                  : AppColors.description,
              fontSize: 10,
            ),
          ),
          onPressed: () {
            if (filterOrderController.selectedIndex != index) {
              filterOrderController.setSelectedFilter(index);
            }
          },
        ),
      ),
    );
  }
}
