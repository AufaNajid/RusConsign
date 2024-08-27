


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rusconsign/utils/app_responsive.dart';
import 'package:rusconsign/utils/colors.dart';
import 'package:rusconsign/utils/extension.dart';
import 'package:rusconsign/utils/money_format.dart';
import 'package:rusconsign/utils/text_style.dart';

class CardProductGiveRating extends StatelessWidget {
  final String imagePath;
  final String title;
  final String pemesan;
  final String metodePembayaran;
  final String lokasiPertemuan;
  final dynamic rating;
  final String timeMeeting;
  final int price;
  final int quantity;

  const CardProductGiveRating({
    Key? key,
    required this.imagePath,
    required this.pemesan,
    required this.title,
    required this.metodePembayaran,
    required this.lokasiPertemuan,
    required this.rating,
    required this.price,
    required this.quantity,
    required this.timeMeeting
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const imageUrl = "https://rusconsign.com/api/storage/public";
    return Card(
      elevation: 0,
      margin: const EdgeInsets.symmetric(vertical: 0),
      color: AppColors.cardProdukTidakDipilih,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: AppResponsive().screenWidth(context) * 0.240,
              height: 120,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  "$imageUrl${imagePath.replaceFirst("storage/", "")}",
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
                    style: AppTextStyle().descriptionBold(context, AppColors.titleLine),
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
                        rating.toString(),
                        style:
                        AppTextStyle().textInfoBold(context, AppColors.description),
                      ),
                    ].withSpaceBetween(width: 6),
                  ),
                  Row(
                    children: [
                      Text(
                        '${'Harga'.tr} :',
                        style: AppTextStyle().textInfo(context, AppColors.description),
                      ),
                      Text(
                        MoneyFormat.format(price),
                        style: AppTextStyle().textInfoBold(context,AppColors.hargaStat),
                      ),
                    ].withSpaceBetween(width: 4),
                  ),
                  Row(
                    children: [
                      Text(
                        '${'Stock'.tr} :',
                        style: AppTextStyle().textInfo(context,AppColors.description),
                      ),
                      Text(
                        quantity.toString(),
                        style: AppTextStyle().textInfoBold(context,AppColors.hargaStat),
                      ),
                    ].withSpaceBetween(width: 4),
                  ),
                  Row(
                    children: [
                      Text(
                        'Nama Toko:'.tr,
                        style: AppTextStyle().textInfo(context,AppColors.description),
                      ),
                      Expanded(
                        child: Text(
                          timeMeeting,
                          style: AppTextStyle().textInfoBold(context,AppColors.hargaStat),
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
    );
  }
}
