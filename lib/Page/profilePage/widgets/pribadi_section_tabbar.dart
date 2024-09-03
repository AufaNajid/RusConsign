import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:rusconsign/Page/profilePage/widgets/custom_button_profile.dart';
import 'package:rusconsign/Page/settingPage/setting_controller.dart';
import 'package:rusconsign/utils/colors.dart';

class PribadiSection extends StatelessWidget {
  const PribadiSection({super.key});

  @override
  Widget build(BuildContext context) {
    final SettingController dataProfile = Get.put(SettingController());
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: SizedBox(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColors.cardIconFill,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: ButtonProfile(
                icon: FeatherIcons.archive,
                text: 'pembelianPJ'.tr,
                toPage: () {
                  Get.toNamed("/orderpage");
                },
              ),
            ),
            Container(
              decoration: BoxDecoration(color: AppColors.cardIconFill),
              child: ButtonProfile(
                icon: FeatherIcons.bell,
                text: 'notifikasi'.tr,
                toPage: () {
                  Get.toNamed("/notificationpage");
                },
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                color: AppColors.cardIconFill,
              ),
              child: ButtonProfile(
                icon: FeatherIcons.settings,
                text: 'pengaturan'.tr,
                toPage: () {
                  dataProfile.fetchData();
                  Get.toNamed("/settingpage");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
