import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rusconsign/utils/app_responsive.dart';
import 'package:rusconsign/utils/colors.dart';
import 'package:rusconsign/utils/money_format.dart';
import 'package:rusconsign/utils/text_style.dart';

class ProductCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final int price;
  final double rating;
  final int productId;

  const ProductCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.price,
    required this.rating,
    required this.productId,
  });

  @override
  Widget build(BuildContext context) {
    const imageUrl = "https://rusconsign.com/api/storage/public";
    return Card(
      elevation: 0,
      color: AppColors.cardIconFill,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: () {
          Get.toNamed("/detailpage", arguments: productId);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: AppResponsive().screenWidth(context) * 0.25,
                width: AppResponsive().screenWidth(context),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: Image.network(
                    "$imageUrl${imagePath.replaceFirst("storage/", "")}",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyle().description(context, AppColors.description),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    MoneyFormat.format(price),
                    style: AppTextStyle().subHeader(context, AppColors.hargaStat),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
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
                      const SizedBox(width: 6),
                      Text(
                        '$rating',
                        style: AppTextStyle().subHeader(context, AppColors.description),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
