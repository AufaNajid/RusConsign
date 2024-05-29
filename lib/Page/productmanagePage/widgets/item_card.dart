import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:rusconsign/Page/productmanagePage/widgets/button_item_card.dart';
import 'package:rusconsign/utils/app_responsive.dart';
import 'package:rusconsign/utils/colors.dart';
import 'package:rusconsign/utils/extension.dart';
import 'package:rusconsign/utils/text_style.dart';

class ProductItemCard extends StatelessWidget {
  final int price;
  final String imagePath;
  final String nameProduct;

  const ProductItemCard({
    Key? key,
    required this.price,
    required this.imagePath,
    required this.nameProduct,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.cardIconFill
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
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
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: AppColors.cardProdukTidakDipilih),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            nameProduct,
                            style: AppTextStyle().subHeader(AppColors.titleLine),
                          ),
                          SizedBox(
                            width: AppResponsive().screenWidth(context) * 0.6,
                            child: Text(
                              'Ampar ampar sigma, Sigma ku fanum tax Gyatt sebiji Dihurung skibidi Mangga rizzler mangga rizzler Mewing kai cenat Ligma dimakan sussy Apinya gooning mogging',
                              style: AppTextStyle().textInfo(AppColors.description),
                              textAlign: TextAlign.start,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
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
                            ].withSpaceBetween(width: 4),
                          ),
                        ].withSpaceBetween(height: 5),
                      ),
                    ),
                  ),
                ),
              ].withSpaceBetween(width: 5),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ButtonItemCard(icon: FeatherIcons.trash2, text: 'hapus'.tr, page: "",),
                ButtonItemCard(icon: FeatherIcons.edit, text: 'edit'.tr, page: "",),
              ].withSpaceBetween(width:3),
            )
        
          ].withSpaceBetween(width: 5,height: 5),
        ),
      ),
    );
  }
}
