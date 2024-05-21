import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rusconsign/utils/colors.dart';
import 'package:rusconsign/utils/extension.dart';
import 'package:rusconsign/utils/text_style.dart';

class ProductCardCart extends StatelessWidget {
  final String profileImagePath;
  final String imagePath;
  final String sellerUsername;
  final double rating;
  final int price;

  const ProductCardCart({
    required this.profileImagePath,
    required this.imagePath,
    required this.sellerUsername,
    required this.rating,
    required this.price,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Card(
            color: AppColors.cardProdukTidakDipilih,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Row(
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Gatungan Kunci (Key Chain) Boneka unik",
                      style: AppTextStyle().descriptionBold(AppColors.titleLine),
                    ),
                    Row(
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
                      Text(
                        sellerUsername,
                        style: AppTextStyle().textInfo(AppColors.description),
                      ),
                    ].withSpaceBetween(width: 5)),
                    Row(
                      children: [
                        const Stack(
                          alignment: Alignment.center,
                          children: [
                            Icon(
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
                          style: AppTextStyle().textInfoBold(AppColors.description),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          '${'total'.tr} :',
                          style: AppTextStyle().textInfo(AppColors.description),
                        ),
                        Text(
                          'Rp $price',
                          style: AppTextStyle().textInfoBold(AppColors.hargaStat),
                        ),
                      ],
                    )
                  ].withSpaceBetween(height: 5),
                ),
                      ].withSpaceBetween(width: 5),
                    ),
              )),
        Text(
          'jumlah'.tr,
          style: AppTextStyle().textInfo(AppColors.description),
          textAlign: TextAlign.start,
        ),
        
        
        ],
      ),
    );
  }
}
