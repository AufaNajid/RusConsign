import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:rusconsign/Page/settingPage/setting_controller.dart';
import 'package:rusconsign/Page/settingPage/widgets/dropdown_lang.dart';
import 'package:rusconsign/utils/colors.dart';
import 'package:rusconsign/utils/size_data.dart';
import 'package:rusconsign/utils/text_style.dart';

class PreferenceSetting extends StatelessWidget {
  final bool isSwitched;
  final Function toggleSwitch;

  const PreferenceSetting(
      {super.key, required this.isSwitched, required this.toggleSwitch});

  @override
  Widget build(BuildContext context) {
    final SettingController settingController = Get.find();
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'modeGelap'.tr,
                style: AppTextStyle().description(context, AppColors.description),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {
                  settingController.toggleDarkModeSwitch();
                },
                icon: Icon(
                  settingController.isDarkModeSwitched.value
                      ? FeatherIcons.toggleRight
                      : FeatherIcons.toggleLeft,
                  size: SizeData.iconToggleSwitchSize,
                  color: settingController.isDarkModeSwitched.value
                      ? AppColors.hargaStat
                      : AppColors.borderIcon,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Column(
                children: [
                  Text(
                    'bahasa'.tr,
                    style: AppTextStyle().description(context, AppColors.description),
                  ),
                ],
              ),
              const Spacer(),
              const DropDownLang(),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'pemberitahuan'.tr,
                style: AppTextStyle().textInfo(context, AppColors.hargaStat),
              ),
            ],
          )
        ],
      ),
    );
  }
}
