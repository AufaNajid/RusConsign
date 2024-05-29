import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:rusconsign/Page/userProfilePage/user_profile_controller.dart';
import 'package:rusconsign/utils/app_responsive.dart';
import 'package:rusconsign/utils/colors.dart';
import 'package:rusconsign/utils/text_style.dart';

class ButtonFollow extends StatelessWidget {
  const ButtonFollow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final UserProfilePageController controller = Get.find();
    return Obx(
      () => SizedBox(
        width: double.infinity,
        height: AppResponsive().screenWidth(context) * 0.09,
        child: ElevatedButton.icon(
          icon: Icon(
            controller.following.value
                ? FeatherIcons.userCheck
                : FeatherIcons.userPlus,
            color: controller.following.value
                ? AppColors.activeIcon
                : AppColors.activeIconType,
          ),
          onPressed: () {
            controller.onFollow();
          },
          style: ButtonStyle(
            elevation: const MaterialStatePropertyAll(0),
            padding: const MaterialStatePropertyAll(EdgeInsets.zero),
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(
                side: BorderSide(
                  style: BorderStyle.solid,
                  width: controller.following.value ? 2 : 0,
                  color: AppColors.button1,
                ),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            backgroundColor: MaterialStatePropertyAll(
              controller.following.value
                  ? AppColors.cardIconFill
                  : AppColors.button1,
            ),
          ),
          label: Text(
            controller.following.value ? 'mengikuti'.tr : 'ikuti'.tr,
            style: AppTextStyle().subHeader(controller.following.value
                ? AppColors.button1
                : AppColors.textButton1),
          ),
        ),
      ),
    );
  }
}
