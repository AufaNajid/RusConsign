import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:rusconsign/page/settingPage/widgets/account_setting.dart';
import 'package:rusconsign/page/settingPage/widgets/divider.dart';
import 'package:rusconsign/page/settingPage/widgets/notification_setting.dart';
import 'package:rusconsign/page/settingPage/widgets/preference_setting.dart';
import 'package:rusconsign/page/settingPage/widgets/profile_setting.dart';
import 'package:rusconsign/utils/colors.dart';
import 'package:rusconsign/utils/text_style.dart';

import '../../utils/app_responsive.dart';
import 'setting_controller.dart';

class SettingPage extends StatelessWidget {
  final settingController = Get.put(SettingController());
  SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        surfaceTintColor: AppColors.background,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(FeatherIcons.chevronLeft,
                color: AppColors.borderIcon)),
        title: Text(
          "Pengaturan",
          style: AppTextStyle().title(AppColors.titleLine),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const DividerProfile(),
              const ProfileSetting(),
              const DividerComponent(
                  icon: FeatherIcons.bell, text: "Notifikasi"),
              NotificationSetting(
                iSwitched: settingController.isNotificationSwitched.value,
                toggleSwitch: settingController.toggleNotificationSwitch,
              ),
              const DividerComponent(
                  icon: FeatherIcons.aperture, text: "Preferensi"),
              PreferenceSetting(
                  isSwitched: settingController.isDarkModeSwitched.value,
                  toggleSwitch: settingController.toggleDarkModeSwitch),
              const DividerComponent(
                  icon: FeatherIcons.link, text: "Link Akun"),
              const AccountSetting(),
              SizedBox(
                width: AppResponsive().screenWidth(context),
                height: AppResponsive().screenWidth(context) * 0.1,
                child: ElevatedButton.icon(
                  icon: const Icon(FeatherIcons.logOut,
                      color: AppColors.textButton2),
                  onPressed: () {},
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4))),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(AppColors.button1),
                  ),
                  label: Text("Keluar",
                      style: AppTextStyle().header(AppColors.textButton1)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
