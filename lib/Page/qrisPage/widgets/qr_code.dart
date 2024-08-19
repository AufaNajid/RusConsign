import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:rusconsign/Page/qrisPage/qris_payment_controller.dart';
import 'package:screenshot/screenshot.dart';
import 'package:rusconsign/utils/app_responsive.dart';
import 'package:rusconsign/utils/colors.dart';
import 'package:rusconsign/utils/text_style.dart';



class QrCode extends StatelessWidget {
  QrCode({super.key});

  final QrCodeController _qrCodeController = QrCodeController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: AppColors.cardIconFill,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
        child: Column(
          children: [
            Container(
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: AppColors.cardProdukTidakDipilih,
              ),
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
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'pembayaranQRIS'.tr,
                            style: AppTextStyle().header(context, AppColors.titleLine),
                            textAlign: TextAlign.start,
                          ),
                          Text(
                            'shopeeOvoDana'.tr,
                            style: AppTextStyle()
                                .description(context, AppColors.description),
                            textAlign: TextAlign.start,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: AppResponsive().screenWidth(context) * 0.8,
              height: AppResponsive().screenHeight(context) * 0.35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Screenshot(
                controller: _qrCodeController.screenshotController,
                child: QrImageView(
                  data: "test link payment",
                  version: QrVersions.auto,
                  backgroundColor: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: AppResponsive().screenHeight(context) * 0.05,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.button1,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                onPressed: () async {
                  await _qrCodeController.captureAndSaveImage();
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(FeatherIcons.download,
                        color: AppColors.textButton1),
                    Padding(
                      padding: EdgeInsets.only(
                        left: AppResponsive().screenWidth(context) * 0.02,
                      ),
                    ),
                    Text(
                    'unduhKode'.tr,
                      style: AppTextStyle().description(context, AppColors.textButton1),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
