import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:rusconsign/Page/profilePage/widgets/custom_button_profile.dart';
import 'package:rusconsign/utils/app_responsive.dart';
import 'package:rusconsign/utils/colors.dart';
import 'package:rusconsign/utils/text_style.dart';


class PenjualanSectionFalse extends StatelessWidget {
  const PenjualanSectionFalse({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
            height: AppResponsive().screenHeight(context) * 0.25,
            child: SvgPicture.asset("assets/images/orang_mencet_hp.svg")),
        Text(
          'descResgisterPenjual'.tr,
          style: AppTextStyle().description(AppColors.description),
        ),
        SizedBox(
          height: AppResponsive().screenHeight(context) * 0.02,
        ),
        ElevatedButton(
          onPressed: () {
            Get.toNamed("/registerseller");
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.button1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Text(
            'registerPenjualSekarang'.tr,
            style: AppTextStyle().description(AppColors.textButton1),
          ),
        ),
      ],
    );
  }
}

class PenjualSectionTrue extends StatelessWidget {
  const PenjualSectionTrue({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          Column(
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
                  icon: FeatherIcons.plusSquare,
                  text: 'buatBaru'.tr,
                  toPage: "/additemform",
                ),
              ),
              Container(
                decoration: BoxDecoration(color: AppColors.cardIconFill),
                child: ButtonProfile(
                  icon: FeatherIcons.package,
                  text: 'pemesananPJ'.tr,
                  toPage: "/sellingpage",
                ),
              ),
              Container(
                decoration: BoxDecoration(color: AppColors.cardIconFill),
                child: ButtonProfile(
                  icon: FeatherIcons.edit,
                  text: 'kelolaPJ'.tr,
                  toPage: "/productmanagepage",
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
                  icon: FeatherIcons.messageCircle,
                  text: 'chat'.tr,
                  toPage: "/chatlist",
                ),
              ),
            ],
          ),
          //  Row(
          //   children: [
          //     FilterButtonSeller(text: 'semua'.tr, icon: FeatherIcons.alignJustify, index: 0),
          //     FilterButtonSeller(text: 'jasa'.tr, icon: FeatherIcons.users, index: 1),
          //     FilterButtonSeller(text: 'barang'.tr, icon: FeatherIcons.box, index: 2),
          //   ],
          // )
        ],
      ),
    );
  }
}

