import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:rusconsign/Page/settingPage/setting_controller.dart';
import 'package:rusconsign/authentication/controllers/auth_login_controller.dart';
import 'package:rusconsign/utils/colors.dart';

import '../../../utils/app_responsive.dart';
import '../../../utils/text_style.dart';

class DividerProfile extends StatelessWidget {
  final settingController = Get.put(SettingController());
  final dataAuth = Get.put(AuthLoginController());
  DividerProfile({super.key});
  

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(
              FeatherIcons.user,
              color: AppColors.nonActiveIcon,
            ),
            SizedBox(width: AppResponsive().screenWidth(context) * 0.04),
            Text('profil'.tr,
                style: AppTextStyle().subHeader(AppColors.description)),
            const Spacer(),
            SizedBox(
              height: AppResponsive().screenWidth(context) * 0.070,
              child: ElevatedButton(
                onPressed: () {
                  if (settingController.namaProfileController.text !=
                      settingController.originalNamaProfile.value || 
                      settingController.bioDescController.text !=
                      settingController.originalBioDesc.value ||
                      settingController.namaTokoController.text !=
                      settingController.originalNamaToko.value ||
                      settingController.imageUrl.value !=
                      settingController.originalImageUrl.value) {
                    settingController.updateData();
                }else{
                   Get.snackbar(
                      duration: const Duration(seconds: 2),
                      borderRadius: 10,
                      margin: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 20,
                      ),
                      'gagalUbah'.tr,
                      'gagalUbahDesc'.tr,
                      backgroundColor: AppColors.error,
                      colorText: Colors.white,
                    );
                }
                },
                style: ButtonStyle(
                  elevation: const MaterialStatePropertyAll(0),
                  padding: const MaterialStatePropertyAll(EdgeInsets.zero),
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  backgroundColor:
                      const MaterialStatePropertyAll(AppColors.button1),
                  fixedSize: MaterialStatePropertyAll(
                    Size(
                      AppResponsive().screenWidth(context) * 0.24,
                      AppResponsive().screenWidth(context) * 0.070,
                    ),
                  ),
                ),
                child: Text('simpan'.tr,
                    style: AppTextStyle().textInfoBold(AppColors.textButton1)),
              ),
            ),
          ],
        ),
        Divider(
          thickness: 1,
          color: AppColors.titleLine,
        ),
      ],
    );
  }
}

class DividerComponent extends StatelessWidget {
  final IconData icon;
  final String text;
  const DividerComponent({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(
              icon,
              color: AppColors.nonActiveIcon,
            ),
            SizedBox(width: AppResponsive().screenWidth(context) * 0.04),
            Text(text, style: AppTextStyle().subHeader(AppColors.description)),
          ],
        ),
        Divider(
          thickness: 1,
          color: AppColors.titleLine,
        ),
      ],
    );
  }
}
