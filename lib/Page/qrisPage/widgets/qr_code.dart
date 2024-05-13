import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:rusconsign/utils/app_responsive.dart';
import 'package:rusconsign/utils/colors.dart';
import 'package:rusconsign/utils/text_style.dart';

class QrCode extends StatelessWidget {
  const QrCode({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: AppColors.cardIconFill),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40,
        vertical: 10
        ),
        child: Column(
          children: [
            Container(
              height: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: AppColors.cardProdukTidakDipilih),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: AppResponsive().screenHeight(context) * 0.2,
                      width: AppResponsive().screenWidth(context) * 0.2,
                      child: SvgPicture.asset("assets/images/qris.svg"),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Pembayaran QRIS",
                            style: AppTextStyle().header(AppColors.titleLine),
                            textAlign: TextAlign.start,
                          ),
                          Text(
                            "ShopeePay, OVO, DANA, Gopay, LinkAja, dan Transfer bank via QRIS",
                            style:
                                AppTextStyle().description(AppColors.description),
                            textAlign: TextAlign.start,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 10,),
            Container(
              width: AppResponsive().screenWidth(context) * 0.8,
              height: AppResponsive().screenHeight(context) * 0.35,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: AppColors.activeIcon,
                  image: DecorationImage(
                      image: AssetImage("assets/images/qr_code_png.png"),
                      fit: BoxFit.cover)),
            ),
            SizedBox(height: 10,),
            SizedBox(
              height: AppResponsive().screenHeight(context) * 0.05,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.button1,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        5), // Sesuaikan dengan keinginan Anda
                  ),
                ),
                onPressed: () {
                  // Aksi ketika tombol ditekan
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(FeatherIcons.download, color: AppColors.textButton1),
                    Padding(
                      padding: EdgeInsets.only(
                        left: AppResponsive().screenWidth(context) * 0.02,
                      ),
                    ),
                    Text(
                      "Unduh Kode QR",
                      style: AppTextStyle().description(AppColors.textButton1),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
