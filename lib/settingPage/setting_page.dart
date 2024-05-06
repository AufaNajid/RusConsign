import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:rusconsign/settingPage/widgets/divider.dart';
import 'package:rusconsign/settingPage/widgets/profile_setting.dart';
import 'package:rusconsign/utils/colors.dart';
import 'package:rusconsign/utils/text_style.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

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
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            DividerProfile(),
            ProfileSetting(),
            // const DividerComponent(icon: FeatherIcons.bell, text: "Notifikasi"),
            // const DividerComponent(
            //     icon: FeatherIcons.aperture, text: "Preferensi"),
            // const DividerComponent(icon: FeatherIcons.link, text: "Link Akun"),
          ],
        ),
      ),
    );
  }
}
