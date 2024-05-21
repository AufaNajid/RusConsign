import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
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
  final int quantity;
  final int subtotalValue;

  const ProductCardCart({
    required this.profileImagePath,
    required this.imagePath,
    required this.sellerUsername,
    required this.rating,
    required this.price,
    required this.quantity,
    required this.subtotalValue,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int subtotalValue = price * quantity;
    return SizedBox(
      width: double.infinity,
      child: Card(
        elevation: 0,
        margin: EdgeInsets.zero,
        color: AppColors.cardIconFill,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal:20),
          child: Column(
            children: [
              Card(
                  elevation: 0,
                  margin: EdgeInsets.zero,
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
                              "Gantungan Kunci (Key Chain) Boneka unik",
                              style: AppTextStyle()
                                  .descriptionBold(AppColors.titleLine),
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
                                style: AppTextStyle()
                                    .textInfo(AppColors.description),
                              ),
                            ].withSpaceBetween(width: 5)),
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
                              ],
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
                              ],
                            )
                          ].withSpaceBetween(height: 5),
                        ),
                      ].withSpaceBetween(width: 5),
                    ),
                  )),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'jumlah'.tr,
                        style: AppTextStyle().textInfo(AppColors.description),
                        textAlign: TextAlign.start,
                      ),
                      const Spacer(),
                      Text('Subtotal'.tr,
                          style:
                              AppTextStyle().textInfo(AppColors.description)),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: SizedBox(
                          width: 20,
                          height: 20,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(3),
                            child: Material(
                                color: AppColors.button2,
                                child: Center(
                                    child: Icon(
                                  FeatherIcons.minus,
                                  color: AppColors.textButton2,
                                  size: 15,
                                ))),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 30,
                        height: 20,
                        child: Material(
                          color: AppColors.cardProdukTidakDipilih,
                          shape: RoundedRectangleBorder(
                            side:
                                BorderSide(color: AppColors.button2, width: 1),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Center(
                            child: Text(quantity.toString(),
                                style: AppTextStyle()
                                    .textInfoBold(AppColors.description)),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: SizedBox(
                          width: 20,
                          height: 20,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(3),
                            child: Material(
                                color: AppColors.button2,
                                child: Center(
                                    child: Icon(
                                  FeatherIcons.plus,
                                  color: AppColors.textButton2,
                                  size: 15,
                                ))),
                          ),
                        ),
                      ),
                    ].withSpaceBetween(width: 5),
                  ),
                  const Spacer(),
                  Text(
                    'Rp $subtotalValue'.toString(),
                    style: AppTextStyle().header(AppColors.hargaStat),
                  ),
                ],
              )
            ].withSpaceBetween(height: 10),
          ),
        ),
      ),
    );
  }
}
