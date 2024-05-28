import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:rusconsign/Page/productmanagePage/product_manage_controller.dart';
import 'package:rusconsign/Page/productmanagePage/widgets/filter_product_button.dart';
import 'package:rusconsign/Page/productmanagePage/widgets/item_card.dart';
import 'package:rusconsign/Page/productmanagePage/widgets/search_item_widget.dart';
import 'package:rusconsign/utils/colors.dart';
import 'package:rusconsign/utils/commonWidget/common_appbar.dart';
import 'package:rusconsign/utils/extension.dart';

class ProductManagePage extends StatelessWidget {
  final controller = Get.put(ProductManageController());
  ProductManagePage({Key? key}) : super(key: key);
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: CommonAppBar(title: 'kelolaPJ'.tr),
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          const SearchItemProductManage(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FilterProductButton(text: 'semua'.tr, icon: FeatherIcons.alignJustify, index: 0),
              FilterProductButton(text: 'jasa'.tr, icon: FeatherIcons.users, index: 1),
              FilterProductButton(text: 'produk'.tr, icon: FeatherIcons.box, index: 2)
            ].withSpaceBetween(width: 10),
          ),
          ProductItemCard(price: 15000, imagePath: 'https://via.placeholder.com/100x100',)
        ],
      ),
    );
  }
}