import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:rusconsign/settingPage/setting_controller.dart';

import '../../utils/app_responsive.dart';
import '../../utils/colors.dart';
import '../../utils/text_style.dart';

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
              child: Text("Foto Profil",
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
                const SizedBox(height: 15),
                Row(
                  children: [
                    SizedBox(
                      height: AppResponsive().screenWidth(context) * 0.070,
                      width: AppResponsive().screenWidth(context) * 0.250,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4))),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                AppColors.button2),
                            fixedSize: MaterialStateProperty.all<Size>(Size(
                                AppResponsive().screenWidth(context) * 0.24,
                                AppResponsive().screenWidth(context) * 0.070))),
                        child: Text("Lihat Foto",
                            style: AppTextStyle()
                                .textInfoBold(AppColors.textButton2)),
                      ),
                    ),
                    const SizedBox(width: 10),
                    SizedBox(
                      height: AppResponsive().screenWidth(context) * 0.070,
                      width: AppResponsive().screenWidth(context) * 0.250,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4))),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                AppColors.button2),
                            fixedSize: MaterialStateProperty.all<Size>(Size(
                                AppResponsive().screenWidth(context) * 0.24,
                                AppResponsive().screenWidth(context) * 0.070))),
                        child: Text("Ganti Foto",
                            style: AppTextStyle()
                                .textInfoBold(AppColors.textButton2)),
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
        const SizedBox(height: 10),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: AppResponsive().screenWidth(context) * 0.15,
              child: Text("Nama",
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
        const SizedBox(height: 10),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: AppResponsive().screenWidth(context) * 0.15,
              child: Text("Deskripsi",
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
        const SizedBox(height: 10),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: AppResponsive().screenWidth(context) * 0.15,
              child: Text("Ganti Password",
                  style: AppTextStyle().textInfoBold(AppColors.description)),
            ),
            SizedBox(width: AppResponsive().screenWidth(context) * 0.05),
            Obx(
              () => Expanded(
                child: TextFormField(
                  style: AppTextStyle().textInfo(AppColors.description),
                  cursorColor: AppColors.hargaStat,
                  textAlign: TextAlign.left,
                  obscureText: settingController.isShow.value,
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
        const SizedBox(height: 20),
      ],
    );
  }
}
