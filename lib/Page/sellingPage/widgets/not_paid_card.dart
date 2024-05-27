import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:rusconsign/utils/colors.dart';
import 'package:rusconsign/utils/extension.dart';
import 'package:rusconsign/utils/text_style.dart';

class NotPaidCardSelling extends StatelessWidget {
  final String imagePath;
  final String title;
  final String metodePembayaran;
  final String lokasiPertemuan;
  final double rating;
  final int price;
  final int quantity;

  const NotPaidCardSelling({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.metodePembayaran,
    required this.lokasiPertemuan,
    required this.rating,
    required this.price,
    required this.quantity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
        color: AppColors.cardIconFill,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
            Card(
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
                                    width: 100,
                                    height: 100,
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
                                              'Rp $price',
                                              style: AppTextStyle()
                                                  .textInfoBold(AppColors.hargaStat),
                                            ),
                                          ].withSpaceBetween(width: 4),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'metodePembayaran'.tr,
                                              style: AppTextStyle()
                                                  .textInfo(AppColors.description),
                                            ),
                                            Text(
                                              metodePembayaran,
                                              style: AppTextStyle()
                                                  .textInfoBold(AppColors.hargaStat),
                                            ),
                                          ].withSpaceBetween(width: 4),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'lokasiPertemuan'.tr,
                                              style: AppTextStyle()
                                                  .textInfo(AppColors.description),
                                            ),
                                            Text(
                                              lokasiPertemuan,
                                              style: AppTextStyle()
                                                  .textInfoBold(AppColors.hargaStat),
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
        
            Container(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.button2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  elevation: 0,
                  
                ),
                onPressed: () {
              
              }, child: Text('pesananDibatalkan'.tr
              ,style: AppTextStyle().header(AppColors.textButton2),
              )),
            )
          ].withSpaceBetween(height: 10),
        ),
      ),
    );
  }
}