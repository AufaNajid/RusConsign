import 'package:flutter/material.dart';
import 'package:rusconsign/utils/app_responsive.dart';
import 'package:rusconsign/utils/colors.dart';
import 'package:rusconsign/utils/extension.dart';
import 'package:rusconsign/utils/text_style.dart';

class ProductDiscount extends StatelessWidget {
  final String title;
  final String imagepath;
  final String imagepathprofile;
  final String titleprofile;
  final double rating;
  final String harga;
  final String diskonprice;
  final double diskon;
  const ProductDiscount(
      {Key? key,
      required this.title,
      required this.imagepath,
      required this.titleprofile,
      required this.rating,
      required this.harga,
      required this.diskonprice,
      required this.imagepathprofile,
      required this.diskon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
          color: AppColors.cardIconFill,
          borderRadius: BorderRadius.circular(5)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: AppResponsive().screenHeight(context) * 0.125,
            width: AppResponsive().screenWidth(context) * 0.25,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.network(
                imagepath,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: AppTextStyle().textInfoBold(AppColors.titleLine)),
                Row(
                  children: [
                    ClipOval(
                      child: Image.network(
                        imagepathprofile,
                        width: 25,
                        height: 25,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text(titleprofile,
                        style: AppTextStyle().textInfo(AppColors.description)),
                  ].withSpaceBetween(width: 5),
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      size: 20,
                      color: AppColors.bintang,
                    ),
                    Text("$rating",
                        style:
                            AppTextStyle().textInfoBold(AppColors.description)),
                  ],
                ),
                Row(
                  children: [
                    Text(harga,
                        style: AppTextStyle().textInfo(AppColors.description)),
                    Text("Rp $diskonprice",
                        style:
                            AppTextStyle().textInfoBold(AppColors.hargaStat)),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: const Color(0xFFFFCFCF)),
                      child: Text("$diskon%",
                          style:
                              AppTextStyle().textInfoBold(AppColors.hargaStat)),
                    )
                  ].withSpaceBetween(width: 5),
                )
              ].withSpaceBetween(height: 5),
            ),
          )
        ].withSpaceBetween(width: 10),
      ),
    );
  }
}
