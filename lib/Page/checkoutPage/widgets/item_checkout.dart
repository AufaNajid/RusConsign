import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rusconsign/utils/colors.dart';
import 'package:rusconsign/utils/extension.dart';
import 'package:rusconsign/utils/text_style.dart';

class ItemChekcout extends StatelessWidget {
  final String imagePath;
  final String title;
  final String profileImagePath;
  final String profileName;
  final double rating;
  final int price;
  final int quantity;

  const ItemChekcout({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.profileImagePath,
    required this.profileName,
    required this.rating,
    required this.price,
    required this.quantity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int subtotalValue = price * quantity;
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
              vertical: 15,
              horizontal: 20,
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
                                            profileName,
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
                              ].withSpaceBetween(height: 6),
                            ),
                          ),
                        ].withSpaceBetween(width: 8),
                      ),
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'jumlah'.tr,
                          style: AppTextStyle().textInfo(AppColors.description),
                        ),
                        const Spacer(),
                        Text(
                          'subtotal'.tr,
                          style: AppTextStyle().textInfo(AppColors.description),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 30,
                          height: 20,
                          child: Material(
                            color: AppColors.cardProdukTidakDipilih,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  color: AppColors.button2, width: 1),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Center(
                              child: Text(quantity.toString(),
                                  style: AppTextStyle()
                                      .textInfoBold(AppColors.description)),
                            ),
                          ),
                        ),
                        const Spacer(),
                        Text(
                          'Rp $subtotalValue'.toString(),
                          style: AppTextStyle().header(AppColors.hargaStat),
                        ),
                      ],
                    ),
                  ].withSpaceBetween(height: 5),
                ),
              ].withSpaceBetween(height: 20),
            ),
          ),
        ),
      ),
    );
  }
}
