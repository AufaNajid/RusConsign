import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:rusconsign/Page/checkoutPage/checkout_page_controller.dart';
import 'package:rusconsign/utils/colors.dart';
import 'package:rusconsign/utils/text_style.dart';

class DropdownPayment extends StatelessWidget {
  const DropdownPayment({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CheckoutPageController());

    return Obx(
          () {
        return AnimatedSize(
          alignment: Alignment.topCenter,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          child: ExpansionTile(
            key: GlobalKey(),
            backgroundColor: AppColors.cardIconFill,
            collapsedBackgroundColor: AppColors.cardIconFill,
            iconColor: AppColors.nonActiveIcon,
            collapsedIconColor: AppColors.nonActiveIcon,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            collapsedShape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            title: Text(
              controller.selectedTitle.value,
              style: AppTextStyle().description(context, AppColors.description),
            ),
            leading: SvgPicture.asset(controller.selectedLeading.value),
            initiallyExpanded: controller.expanded.value,
            onExpansionChanged: (bool expanded) {
              controller.expanded.value = expanded;
            },
            children: controller.items.asMap().entries.map(
                  (entry) {
                int index = entry.key;
                var item = entry.value;
                return ListTile(
                  leading: SvgPicture.asset(item['leading']!),
                  title: Text(
                    item['title']!,
                    style: AppTextStyle().description(context, AppColors.titleLine),
                  ),
                  onTap: () {
                    controller.selectPaymentMethod(index);
                  },
                  selected: controller.selectedPaymentMethod.value == item['title'],
                );
              },
            ).toList(),
          ),
        );
      },
    );
  }
}
