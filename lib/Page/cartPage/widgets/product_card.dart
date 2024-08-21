import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:rusconsign/utils/colors.dart';
import 'package:rusconsign/utils/extension.dart';
import 'package:rusconsign/utils/money_format.dart';
import 'package:rusconsign/utils/size_data.dart';
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
        margin: const EdgeInsets.symmetric(vertical: 5),
        color: AppColors.cardIconFill,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          child: Column(
            children: [
              Card(
                elevation: 0,
                margin: EdgeInsets.zero,
                color: AppColors.cardProdukTidakDipilih,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Row(
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                Text(
                                  "Gantungan Kunci (Key Chain) Boneka unik",
                                  style: AppTextStyle().descriptionBold(
                                      context, AppColors.titleLine),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
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
                                      .textInfo(context, AppColors.description),
                                ),
                              ].withSpaceBetween(width: 5),
                            ),
                            Row(
                              children: [
                                Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      color: AppColors.bintang,
                                      size: SizeData.iconStarInsideSize,
                                    ),
                                    Icon(
                                      Icons.star_border_rounded,
                                      color: AppColors.borderIcon,
                                      size: SizeData.iconSize,
                                    ),
                                  ],
                                ),
                                Text(
                                  rating.toString(),
                                  style: AppTextStyle().textInfoBold(
                                      context, AppColors.description),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  '${'total'.tr} : ',
                                  style: AppTextStyle()
                                      .textInfo(context, AppColors.description),
                                ),
                                Text(
                                  MoneyFormat.format(price),
                                  style: AppTextStyle().textInfoBold(
                                      context, AppColors.hargaStat),
                                ),
                              ],
                            )
                          ].withSpaceBetween(height: 5),
                        ),
                      ),
                    ].withSpaceBetween(width: 8),
                  ),
                ),
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'jumlah'.tr,
                        style: AppTextStyle()
                            .textInfo(context, AppColors.description),
                        textAlign: TextAlign.start,
                      ),
                      const Spacer(),
                      Text('Subtotal'.tr,
                          style: AppTextStyle()
                              .textInfo(context, AppColors.description)),
                    ],
                  ),
                  Row(
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: SizedBox(
                              width: 25,
                              height: 25,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(3),
                                child: Material(
                                    color: AppColors.button2,
                                    child: Center(
                                        child: Icon(
                                      FeatherIcons.minus,
                                      color: AppColors.textButton2,
                                      size: SizeData.iconCartQuantitySize,
                                    ))),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 40,
                            height: 25,
                            child: Material(
                              color: AppColors.cardProdukTidakDipilih,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    color: AppColors.button2, width: 1),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Center(
                                child: Text(
                                  quantity.toString(),
                                  style: AppTextStyle().descriptionBold(
                                      context, AppColors.description),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: SizedBox(
                              width: 25,
                              height: 25,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(3),
                                child: Material(
                                  color: AppColors.button2,
                                  child: Center(
                                    child: Icon(
                                      FeatherIcons.plus,
                                      color: AppColors.textButton2,
                                      size: SizeData.iconCartQuantitySize,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ].withSpaceBetween(width: 6),
                      ),
                      const Spacer(),
                      Text(
                        MoneyFormat.format(subtotalValue),
                        style:
                            AppTextStyle().title(context, AppColors.hargaStat),
                      ),
                    ],
                  ),
                ].withSpaceBetween(height: 10),
              )
            ].withSpaceBetween(height: 20),
          ),
        ),
      ),
    );
  }
}
