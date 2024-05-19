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
                    style: AppTextStyle().description(AppColors.background),
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
              Text("Pembayaran Selesai",
                  style: AppTextStyle().title(AppColors.titleLine)),
              SizedBox(height: AppResponsive().screenHeight(context)*0.02,),
              Text(
                "Terima kasih sudah membeli produk. Produk anda akan di proses oleh penjual produk. Untuk informasi lebih lanjut, anda bisa menghubungi penjual dari produk tersebut.",
                style: AppTextStyle().description(AppColors.description),
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
