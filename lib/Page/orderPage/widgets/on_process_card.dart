import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rusconsign/utils/app_responsive.dart';
import 'package:rusconsign/utils/colors.dart';
import 'package:rusconsign/utils/extension.dart';

import '../../../utils/text_style.dart';

class OnProcessCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String profileImagePath;
  final String profileUsername;
  final double rating;
  final int totalProductPrice;
  final String paymentMethod;
  final String meetingLocation;
  final VoidCallback onChatSeller;

  const OnProcessCard({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.profileImagePath,
    required this.profileUsername,
    required this.rating,
    required this.totalProductPrice,
    required this.paymentMethod,
    required this.meetingLocation,
    required this.onChatSeller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        elevation: 0,
        color: AppColors.cardIconFill,
        margin: const EdgeInsets.symmetric(vertical: 6),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: GestureDetector(
          onTap: () {
            Get.toNamed("/detailpage");
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 12,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Card(
                    elevation: 0,
                    margin: const EdgeInsets.symmetric(vertical: 0),
                    color: AppColors.cardProdukTidakDipilih,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 12,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: AppResponsive().screenWidth(context) * 0.240,
                            height: 150,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                imagePath,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  title,
                                  style: AppTextStyle()
                                      .descriptionBold(AppColors.titleLine),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 25,
                                      width: 25,
                                      child: ClipOval(
                                        child: Image.network(
                                          profileImagePath,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            profileUsername,
                                            style: AppTextStyle().textInfo(
                                                AppColors.description),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ].withSpaceBetween(width: 6),
                                ),
                                Row(
                                  children: [
                                    Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        const Icon(
                                          Icons.star,
                                          color: AppColors.bintang,
                                          size: 18,
                                        ),
                                        Icon(
                                          Icons.star_border_rounded,
                                          color: AppColors.borderIcon,
                                          size: 20,
                                        ),
                                      ],
                                    ),
                                    Text(
                                      '$rating',
                                      style: AppTextStyle()
                                          .textInfoBold(AppColors.description),
                                    ),
                                  ].withSpaceBetween(width: 6),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      '${'total'.tr} :',
                                      style: AppTextStyle()
                                          .textInfo(AppColors.description),
                                    ),
                                    Text(
                                      'Rp $totalProductPrice',
                                      style: AppTextStyle()
                                          .textInfoBold(AppColors.hargaStat),
                                    ),
                                  ].withSpaceBetween(width: 4),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      '${'metodePembayaran'.tr} :',
                                      style: AppTextStyle()
                                          .textInfo(AppColors.description),
                                    ),
                                    Text(
                                      paymentMethod,
                                      style: AppTextStyle()
                                          .textInfoBold(AppColors.hargaStat),
                                    ),
                                  ].withSpaceBetween(width: 4),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${'lokasiPertemuan'.tr} :',
                                      style: AppTextStyle()
                                          .textInfo(AppColors.description),
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            meetingLocation,
                                            style: AppTextStyle().textInfoBold(
                                                AppColors.hargaStat),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ].withSpaceBetween(width: 4),
                                ),
                              ].withSpaceBetween(height: 6),
                            ),
                          ),
                        ].withSpaceBetween(width: 8),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: AppResponsive().screenWidth(context) * 0.080,
                  child: ElevatedButton(
                    onPressed: () {
                      onChatSeller;
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
                          MaterialStatePropertyAll(AppColors.button2),
                    ),
                    child: Text(
                      'chatPenjual'.tr,
                      style: AppTextStyle().header(AppColors.textButton2),
                    ),
                  ),
                ),
              ].withSpaceBetween(height: 10),
            ),
          ),
        ),
      ),
    );
  }
}
