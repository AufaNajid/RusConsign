import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:rusconsign/authentication/controllers/auth_login_controller.dart';
import 'package:rusconsign/Page/settingPage/widgets/account_setting.dart';
import 'package:rusconsign/Page/settingPage/widgets/divider.dart';
import 'package:rusconsign/Page/settingPage/widgets/notification_setting.dart';
import 'package:rusconsign/Page/settingPage/widgets/preference_setting.dart';
import 'package:rusconsign/Page/settingPage/widgets/profile_setting.dart';
import 'package:rusconsign/utils/colors.dart';
import 'package:rusconsign/utils/commonWidget/common_appbar.dart';
import 'package:rusconsign/utils/extension.dart';
import 'package:rusconsign/utils/size_data.dart';
import 'package:rusconsign/utils/text_style.dart';

import '../../utils/app_responsive.dart';
import 'setting_controller.dart';

class SettingPage extends StatelessWidget {
  final settingController = Get.put(SettingController());
  final loginOption = Get.put(AuthLoginController());
  SettingPage({super.key});

  Future<void> refreshData() async {
    final SettingController controller = Get.find<SettingController>();
    await controller.fetchData();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CommonAppBar(
        title: 'pengaturan'.tr,
        route: () {
          Get.back();
        },
      ),
      body: RefreshIndicator(
        edgeOffset: 10,
        color: AppColors.hargaStat,
        backgroundColor: AppColors.cardIconFill,
        strokeWidth: RefreshProgressIndicator.defaultStrokeWidth,
        onRefresh: () => Future.delayed(
          const Duration(seconds: 2),
          refreshData,
        ),
        child: Obx(() {
          if (settingController.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.hargaStat,
              ),
            );
          } else {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        DividerProfile(),
                        ProfileSetting(),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        DividerComponent(
                            icon: FeatherIcons.bell, text: 'notifikasi'.tr),
                        NotificationSetting(
                          iSwitched:
                              settingController.isNotificationSwitched.value,
                          toggleSwitch:
                              settingController.toggleNotificationSwitch,
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        DividerComponent(
                            icon: FeatherIcons.aperture, text: 'preferensi'.tr),
                        PreferenceSetting(
                            isSwitched:
                                settingController.isDarkModeSwitched.value,
                            toggleSwitch: settingController.toggleDarkModeSwitch),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        DividerComponent(
                            icon: FeatherIcons.link, text: 'linkAkun'.tr),
                        const AccountSetting(),
                      ],
                    ),
                    SizedBox(
                      width: AppResponsive().screenWidth(context),
                      height: AppResponsive().screenWidth(context) * 0.1,
                      child: ElevatedButton.icon(
                        icon: const Icon(
                          FeatherIcons.logOut,
                          color: AppColors.activeIconType,
                          size: SizeData.iconSize,
                        ),
                        onPressed: () {
                          loginOption.logout();
                          Get.offAllNamed('/login');
                        },
                        style: ButtonStyle(
                          elevation: const MaterialStatePropertyAll(0),
                          padding:
                              const MaterialStatePropertyAll(EdgeInsets.zero),
                          shape: MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          backgroundColor:
                              const MaterialStatePropertyAll(AppColors.button1),
                        ),
                        label: Text(
                          'keluar'.tr,
                          style: AppTextStyle()
                              .header(context, AppColors.textButton1),
                        ),
                      ),
                    ),
                  ].withSpaceBetween(height: 20),
                ),
              ),
            );
          }
        }),
      ),
    );
  }
}
