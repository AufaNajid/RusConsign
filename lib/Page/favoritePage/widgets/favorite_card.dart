import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:rusconsign/Page/detailPage/detail_page_controller.dart';
import 'package:rusconsign/Page/favoritePage/controller/like_controller.dart';
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

  const FavoriteCard({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.price,
    required this.rating,
    required this.idBarang,
    required this.profileImagePath,
    required this.profileUsername,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("id barang adalah $idBarang");
    final LikeController controller = Get.put(LikeController());
    // final DetailPageController detailController =
    //     Get.put(DetailPageController());
    const imageUrl = "https://rusconsign.com/api";
    return Card(
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
                    "$imageUrl$imagePath",
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
                                .descriptionBold(AppColors.titleLine),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 25,
                                width: 25,
                                child: ClipOval(
                                  child: Image.network(
                                    "$imageUrl$profileImagePath",
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
                                          .textInfo(AppColors.description),
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
                                    .textInfoBold(AppColors.description),
                              ),
                            ].withSpaceBetween(width: 6),
                          ),
                          Row(
                            children: [
                              Text(
                                'harga'.tr,
                                style: AppTextStyle()
                                    .textInfo(AppColors.description),
                              ),
                              Text(
                                MoneyFormat.format(price),
                                style: AppTextStyle()
                                    .textInfoBold(AppColors.hargaStat),
                              ),
                            ].withSpaceBetween(width: 4),
                          ),
                        ].withSpaceBetween(height: 8),
                      ),
                    ),
                    Obx(
                      () => GestureDetector(
                        onTap: () {
                          controller.toggleFavorite(idBarang);
                        },
                        child: Icon(
                          controller.isFavorite.value
                              ? Icons.favorite_rounded
                              : Icons.favorite_border_rounded,
                          color: controller.isFavorite.value
                              ? AppColors.hargaStat
                              : AppColors.borderIcon,
                          size: 24,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ].withSpaceBetween(width: 12),
          ),
        ),
      ),
    );
  }
}
