import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:rusconsign/page/settingPage/setting_controller.dart';
import 'package:rusconsign/utils/colors.dart';
import 'package:rusconsign/utils/text_style.dart';

class DropDownLang extends StatelessWidget {
  const DropDownLang({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SettingController settingController = Get.find();
    return Obx(() => Row(
          children: [
            Text(
              settingController.selectedLanguage.value,
              style: AppTextStyle().textInfoBold(AppColors.description),
            ),
            PopupMenuButton<String>(
              color: AppColors.cardIconFill,
              useRootNavigator: true,
              elevation: 0,
              icon: Icon(settingController.isOpenMenu.value
                  ? FeatherIcons.chevronUp
                  : FeatherIcons.chevronDown,
                  color: AppColors.borderIcon,
                  ),
              onSelected: (String? newValue) {
                settingController.changeLanguage(newValue!);
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                PopupMenuItem<String>(
                  value: 'Indonesia',
                  child: Text(
                    'Indonesia',
                    style: AppTextStyle().textInfoBold(AppColors.description),
                  ),
                ),
                PopupMenuItem<String>(
                  value: 'English',
                  child: Text(
                    'English',
                    style: AppTextStyle().textInfoBold(AppColors.description),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
