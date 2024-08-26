import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rusconsign/utils/app_responsive.dart';
import 'package:rusconsign/utils/colors.dart';
import 'package:rusconsign/utils/extension.dart';
import 'package:rusconsign/utils/money_format.dart';
import 'package:rusconsign/utils/text_style.dart';

class FavoriteCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String profileImagePath;
  final String profileUsername;
  final int price;
  final int idBarang;
  final double rating;
  final bool isFavorite;
  final VoidCallback onFavoriteToggle;

  const FavoriteCard({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.price,
    required this.rating,
    required this.idBarang,
    required this.profileImagePath,
    required this.profileUsername,
    required this.isFavorite,
    required this.onFavoriteToggle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const imageUrl = "https://rusconsign.com/api/storage/public";
    return SizedBox(
      child: Card(
        elevation: 0,
        color: AppColors.cardIconFill,
        margin: const EdgeInsets.symmetric(vertical: 6),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: GestureDetector(
          onTap: () {
            Get.toNamed("/detailpage", arguments: idBarang);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: AppResponsive().screenWidth(context) * 0.25,
                  width: AppResponsive().screenWidth(context) * 0.25,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: Image.network(
                      "$imageUrl${imagePath.replaceFirst("storage/", "")}",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: AppTextStyle()
                                  .descriptionBold(context, AppColors.titleLine),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 25,
                                  width: 25,
                                  child: ClipOval(
                                    child: Image.network(
                                      // "$imageUrl${profileImagePath.replaceFirst("storage/", "")}",
                                      profileImagePath,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        profileUsername,
                                        style: AppTextStyle()
                                            .textInfo(context, AppColors.description),
                                      ),
                                    ],
                                  ),
                                ),
                                const Spacer(),
                              ].withSpaceBetween(width: 8),
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
                                      .textInfoBold(context, AppColors.description),
                                ),
                              ].withSpaceBetween(width: 6),
                            ),
                            Row(
                              children: [
                                Text(
                                  'harga'.tr,
                                  style: AppTextStyle()
                                      .textInfo(context, AppColors.description),
                                ),
                                Text(
                                  MoneyFormat.format(price),
                                  style: AppTextStyle()
                                      .textInfoBold(context, AppColors.hargaStat),
                                ),
                              ].withSpaceBetween(width: 4),
                            ),
                          ].withSpaceBetween(height: 8),
                        ),
                      ),
                      GestureDetector(
                        onTap: onFavoriteToggle,
                        child: Icon(
                          isFavorite
                              ? Icons.favorite_rounded
                              : Icons.favorite_border_rounded,
                          color: isFavorite
                              ? AppColors.hargaStat
                              : AppColors.borderIcon,
                          size: 24,
                        ),
                      ),
                    ],
                  ),
                ),
              ].withSpaceBetween(width: 12),
            ),
          ),
        ),
      ),
    );
  }
}
