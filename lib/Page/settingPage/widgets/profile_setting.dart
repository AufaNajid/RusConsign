import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:rusconsign/Page/settingPage/setting_controller.dart';
import 'package:rusconsign/utils/extension.dart';

import '../../../utils/app_responsive.dart';
import '../../../utils/colors.dart';
import '../../../utils/text_style.dart';

class ProfileSetting extends StatelessWidget {
  const ProfileSetting({super.key});

  @override
  Widget build(BuildContext context) {
    final SettingController settingController = Get.find();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: AppResponsive().screenWidth(context) * 0.15,
              child: Text('fotoProfil'.tr,
                  style: AppTextStyle().textInfoBold(AppColors.description)),
            ),
            SizedBox(width: AppResponsive().screenWidth(context) * 0.05),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 100,
                  height: 100,
                  child: ClipOval(
                    child: Image.network(
                      "https://via.placeholder.com/90x90",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Row(
                  children: [
                    SizedBox(
                      height: AppResponsive().screenWidth(context) * 0.070,
                      width: 95,
                      child: ElevatedButton(
                        onPressed: () {},
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
                              MaterialStatePropertyAll(AppColors.button2),
                        ),
                        child: Text(
                          'lihatFoto'.tr,
                          style: AppTextStyle()
                              .textInfoBold(AppColors.textButton2),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: AppResponsive().screenWidth(context) * 0.070,
                      width: 95,
                      child: ElevatedButton(
                        onPressed: () {},
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
                              MaterialStatePropertyAll(AppColors.button2),
                        ),
                        child: Text(
                          'gantiFoto'.tr,
                          style: AppTextStyle()
                              .textInfoBold(AppColors.textButton2),
                        ),
                      ),
                    ),
                  ].withSpaceBetween(width: 10),
                )
              ].withSpaceBetween(height: 15),
            )
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: AppResponsive().screenWidth(context) * 0.15,
              child: Text('nama'.tr,
                  style: AppTextStyle().textInfoBold(AppColors.description)),
            ),
            SizedBox(width: AppResponsive().screenWidth(context) * 0.05),
            Expanded(
              child: TextField(
                style: AppTextStyle().textInfo(AppColors.description),
                cursorColor: AppColors.hargaStat,
                textAlign: TextAlign.left,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: AppColors.cardIconFill,
                ),
              ),
            )
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: AppResponsive().screenWidth(context) * 0.15,
              child: Text('namaToko'.tr,
                  style: AppTextStyle().textInfoBold(AppColors.description)),
            ),
            SizedBox(width: AppResponsive().screenWidth(context) * 0.05),
            Expanded(
              child: TextField(
                style: AppTextStyle().textInfo(AppColors.description),
                cursorColor: AppColors.hargaStat,
                textAlign: TextAlign.left,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: AppColors.cardIconFill,
                ),
              ),
            )
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: AppResponsive().screenWidth(context) * 0.15,
              child: Text('deskripsi'.tr,
                  style: AppTextStyle().textInfoBold(AppColors.description)),
            ),
            SizedBox(width: AppResponsive().screenWidth(context) * 0.05),
            Expanded(
              child: TextField(
                style: AppTextStyle().textInfo(AppColors.description),
                cursorColor: AppColors.hargaStat,
                textAlign: TextAlign.left,
                maxLines: 6,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: AppColors.cardIconFill,
                ),
              ),
            )
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: AppResponsive().screenWidth(context) * 0.15,
              child: Text('gantiPW'.tr,
                  style: AppTextStyle().textInfoBold(AppColors.description)),
            ),
            SizedBox(width: AppResponsive().screenWidth(context) * 0.05),
            Obx(
              () => Expanded(
                child: TextField(
                  style: AppTextStyle().textInfo(AppColors.description),
                  cursorColor: AppColors.hargaStat,
                  textAlign: TextAlign.left,
                  obscureText: !settingController.isShow.value,
                  decoration: InputDecoration(
                    suffixIcon: GestureDetector(
                      onTap: () {
                        settingController.showPassword();
                      },
                      child: Icon(
                        settingController.isShow.value
                            ? FeatherIcons.eye
                            : FeatherIcons.eyeOff,
                        color: settingController.isShow.value
                            ? AppColors.activeIcon
                            : AppColors.nonActiveIcon,
                      ),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: AppColors.cardIconFill,
                  ),
                ),
              ),
            )
          ],
        ),
      ].withSpaceBetween(height: 10),
    );
  }
}
