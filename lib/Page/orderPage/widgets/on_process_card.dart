import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rusconsign/utils/app_responsive.dart';
import 'package:rusconsign/utils/colors.dart';

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
                          const SizedBox(width: 8),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  title,
                                  style: AppTextStyle()
                                      .descriptionBold(AppColors.titleLine),
                                ),
                                const SizedBox(height: 5),
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
                                    const SizedBox(width: 5),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            profileUsername,
                                            style: AppTextStyle()
                                                .textInfo(AppColors.description),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 5),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      color: AppColors.bintang,
                                      size: 20,
                                    ),
                                    const SizedBox(width: 6),
                                    Text(
                                      '$rating',
                                      style: AppTextStyle()
                                          .textInfoBold(AppColors.description),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 5),
                                Row(
                                  children: [
                                    Text(
                                      'Total: ',
                                      style: AppTextStyle()
                                          .textInfo(AppColors.description),
                                    ),
                                    const SizedBox(width: 2),
                                    Text(
                                      'Rp $totalProductPrice',
                                      style: AppTextStyle()
                                          .textInfoBold(AppColors.hargaStat),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 5),
                                Row(
                                  children: [
                                    Text(
                                      'Metode Pembayaran: ',
                                      style: AppTextStyle()
                                          .textInfo(AppColors.description),
                                    ),
                                    const SizedBox(width: 2),
                                    Text(
                                      paymentMethod,
                                      style: AppTextStyle()
                                          .textInfoBold(AppColors.hargaStat),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 5),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Lokasi Pertemuan: ',
                                      style: AppTextStyle()
                                          .textInfo(AppColors.description),
                                    ),
                                    const SizedBox(width: 2),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            meetingLocation,
                                            style: AppTextStyle()
                                                .textInfoBold(AppColors.hargaStat),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: AppResponsive().screenWidth(context),
                  height: AppResponsive().screenWidth(context) * 0.080,
                  child: ElevatedButton(
                    onPressed: () {
                      onChatSeller;
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4))),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(AppColors.button2),
                    ),
                    child: Text("Chat Dengan Penjual",
                        style: AppTextStyle().header(AppColors.textButton2)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
