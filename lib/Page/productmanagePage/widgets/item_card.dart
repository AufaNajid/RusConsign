import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:rusconsign/Page/productmanagePage/widgets/button_item_card_delete.dart';
import 'package:rusconsign/Page/productmanagePage/widgets/button_item_card_edit.dart';
import 'package:rusconsign/utils/app_responsive.dart';
import 'package:rusconsign/utils/colors.dart';
import 'package:rusconsign/utils/extension.dart';
import 'package:rusconsign/utils/text_style.dart';

class ProductItemCard extends StatelessWidget {
  final int price;
  final String imagePath;
  final String nameProduct;
  final String description;
  final String statusBarang;
  final VoidCallback onPressed;
  final VoidCallback onEdit;

  const ProductItemCard({
    Key? key,
    required this.price,
    required this.imagePath,
    required this.nameProduct,
    required this.statusBarang,
    required this.description,
    required this.onPressed,
    required this.onEdit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const imageUrl = "https://rusconsign.com/api/storage/public";
    return SizedBox(
      child: Card(
        elevation: 0,
        color: AppColors.cardIconFill,
        margin: const EdgeInsets.all(0),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
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
                        "$imageUrl${imagePath.replaceFirst("storage/", "")}",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 100,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: AppColors.cardProdukTidakDipilih,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 10,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                nameProduct,
                                style: AppTextStyle()
                                    .subHeader(context, AppColors.titleLine),
                              ),
                              Row(
                                children: [
                                  Text(
                                    '${'Status Product '.tr} :',
                                    style: AppTextStyle()
                                        .textInfo(context, AppColors.description),
                                  ),
                                  Text(
                                    statusBarang,
                                    style: AppTextStyle()
                                        .subHeader(context, AppColors.titleLine),
                                  ),
                                ].withSpaceBetween(width: 4),
                              ),
                              SizedBox(
                                width:
                                    AppResponsive().screenWidth(context) * 0.6,
                                child: Text(
                                  description,
                                  style: AppTextStyle()
                                      .textInfo(context, AppColors.description),
                                  textAlign: TextAlign.start,
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    '${'total'.tr} :',
                                    style: AppTextStyle()
                                        .textInfo(context, AppColors.description),
                                  ),
                                  Text(
                                    'Rp $price',
                                    style: AppTextStyle()
                                        .textInfoBold(context, AppColors.hargaStat),
                                  ),
                                ].withSpaceBetween(width: 4),
                              ),
                            ].withSpaceBetween(height: 5),
                          ),
                        ),
                      ),
                    ),
                  ),
                ].withSpaceBetween(width: 5),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ButtonItemCardTrash(
                    icon: FeatherIcons.trash2,
                    text: 'hapus'.tr,
                    onPressed: onPressed,
                  ),
                  ButtonItemCardEdit(
                    icon: FeatherIcons.edit,
                    text: 'edit'.tr,
                    onPressed: onEdit,
                  ),
                ].withSpaceBetween(width: 10),
              )
            ].withSpaceBetween(width: 5, height: 5),
          ),
        ),
      ),
    );
  }
}
