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

  const FavoriteCard({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.price,
    required this.rating,
    required this.profileImagePath,
    required this.profileUsername,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.cardIconFill,
      margin: const EdgeInsets.symmetric(vertical: 6),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12)
      ),
      child: GestureDetector(
        onTap: () {
          Get.toNamed("/detailpage");
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 25,
                          child: Text(
                            title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyle().descriptionBold(AppColors.titleLine),
                          ),
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            FeatherIcons.trash2,
                            color: AppColors.button1,
                            size: 24,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
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
                        const SizedBox(width: 5),
                        Text(
                          profileUsername,
                          style: AppTextStyle().textInfo(AppColors.description),
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
                          style: AppTextStyle().textInfoBold(AppColors.description),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        Text(
                          'Harga: ',
                          style: AppTextStyle().textInfo(AppColors.description),
                        ),
                        const SizedBox(width: 2),
                        Text(
                          'Rp $price',
                          style: AppTextStyle().textInfoBold(AppColors.hargaStat),
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
