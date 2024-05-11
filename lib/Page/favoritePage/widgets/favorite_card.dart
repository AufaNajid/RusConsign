import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:rusconsign/utils/app_responsive.dart';
import 'package:rusconsign/utils/colors.dart';
import 'package:rusconsign/utils/text_style.dart';

class FavoriteCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String profileImagePath;
  final String profileUsername;
  final int price;
  final double rating;
  final VoidCallback onDelete;

  const FavoriteCard({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.price,
    required this.rating,
    required this.profileImagePath,
    required this.profileUsername,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: AppColors.cardIconFill,
      margin: const EdgeInsets.symmetric(vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: GestureDetector(
        onTap: () {
          Get.toNamed("/detailpage");
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
                    imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 12),
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
                          const SizedBox(height: 5),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
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
                                'harga'.tr,
                                style: AppTextStyle()
                                    .textInfo(AppColors.description),
                              ),
                              const SizedBox(width: 2),
                              Text(
                                'Rp $price',
                                style: AppTextStyle()
                                    .textInfoBold(AppColors.hargaStat),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IconButton(
                          onPressed: () {
                            onDelete;
                          },
                          icon: const Icon(
                            FeatherIcons.trash2,
                            color: AppColors.button1,
                            size: 24,
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
    );
  }
}
