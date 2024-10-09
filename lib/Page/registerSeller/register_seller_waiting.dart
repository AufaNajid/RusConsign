import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:rusconsign/utils/app_responsive.dart';
import 'package:rusconsign/utils/colors.dart';
import 'package:rusconsign/utils/extension.dart';
import 'package:rusconsign/utils/text_style.dart';

class RegisterSellerWaiting extends StatelessWidget {
  const RegisterSellerWaiting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      bottomNavigationBar: BottomAppBar(
          surfaceTintColor: Colors.transparent,
          color: Colors.transparent,
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Get.back();
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.button2,
                      shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.circular(2))),
                  child: Text(
                    'kembali'.tr,
                    style: AppTextStyle()
                        .description(context, AppColors.background),
                  ),
                ),
              ),
            ],
          )),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset("assets/images/amico_waiting.svg"),
            Text(
              'menungguPersetujuan'.tr,
              style: AppTextStyle().title(context, AppColors.titleLine),
            ),
            SizedBox(
              width: AppResponsive().screenWidth(context) * 0.8,
              child: Text(
                'descPersetujuan'.tr,
                style:
                    AppTextStyle().description(context, AppColors.description),
                textAlign: TextAlign.center,
              ),
            )
          ].withSpaceBetween(height: 16),
        ),
      ),
    );
  }
}
