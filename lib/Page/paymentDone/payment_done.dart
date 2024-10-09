import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:rusconsign/utils/app_responsive.dart';
import 'package:rusconsign/utils/colors.dart';
import 'package:rusconsign/utils/text_style.dart';

class PaymentDone extends StatelessWidget {
  const PaymentDone({super.key});

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
                    Get.offAllNamed("/menu");
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.button2,
                      shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.circular(2))),
                  child: Text(
                    'kembali'.tr,
                    style: AppTextStyle().description(context, AppColors.textButton2),
                  ),
                ),
              ),
            ],
          )),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset("assets/images/paymentdone.svg"),
              SizedBox(height: AppResponsive().screenHeight(context)*0.01,),
              Text('pembayaranSelesai'.tr,
                  style: AppTextStyle().title(context, AppColors.titleLine)),
              SizedBox(height: AppResponsive().screenHeight(context)*0.02,),
              Text(
                'infoPembayaranSelesai'.tr,
                style: AppTextStyle().description(context, AppColors.description),
                textAlign: TextAlign.center,
                maxLines: 3,
              )
            ],
          ),
        ),
      ),
    );
  }
}
