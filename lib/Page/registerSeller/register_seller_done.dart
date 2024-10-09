import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:rusconsign/utils/app_responsive.dart';
import 'package:rusconsign/utils/colors.dart';
import 'package:rusconsign/utils/text_style.dart';

class RegisterSellerDone extends StatelessWidget {
  const RegisterSellerDone({super.key});

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
                    Get.toNamed("/menu");
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.button2,
                      shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.circular(2))),
                  child: Text(
                    "Kembali",
                    style: AppTextStyle().description(context, AppColors.background),
                  ),
                ),
              ),
            ],
          )),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset("assets/images/pana_done.svg"),
            SizedBox(
              height: AppResponsive().screenHeight(context) * 0.01,
            ),
            Text('registrasiSelesai'.tr,
                style: AppTextStyle().title(context, AppColors.titleLine)),
            SizedBox(
              height: AppResponsive().screenHeight(context) * 0.02,
            ),
            Text(
              'descRegistrasiSelesai'.tr,
              style: AppTextStyle().description(context, AppColors.description),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
