import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:rusconsign/page/settingPage/setting_controller.dart';
import 'package:rusconsign/utils/colors.dart';
import 'package:rusconsign/utils/text_style.dart';

class NotificationSetting extends StatelessWidget {
  final bool iSwitched;
  final Function toggleSwitch;
  const NotificationSetting({
    super.key,
    required this.iSwitched,
    required this.toggleSwitch,
  });

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
                'tampilkanNotifikasi'.tr,
                style: AppTextStyle().description(AppColors.description),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {
                  settingController.toggleNotificationSwitch();
                },
                icon: Icon(
                  settingController.isNotificationSwitched.value
                      ? FeatherIcons.toggleRight
                      : FeatherIcons.toggleLeft,
                  size: 30,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
