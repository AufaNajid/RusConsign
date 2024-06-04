// ignore_for_file: use_build_context_synchronously

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
import 'package:rusconsign/utils/text_style.dart';

class ProductManagePage extends StatelessWidget {
  final controller = Get.put(ProductManageController());
  ProductManagePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: 'kelolaPJ'.tr),
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SearchItemProductManage(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FilterProductButton(
                          text: 'semua'.tr,
                          icon: FeatherIcons.alignJustify,
                          index: 0),
                      FilterProductButton(
                        text: 'jasa'.tr,
                        icon: FeatherIcons.users,
                        index: 1,
                      ),
                      FilterProductButton(
                        text: 'produk'.tr,
                        icon: FeatherIcons.box,
                        index: 2,
                      ),
                    ].withSpaceBetween(width: 10),
                  ),
                ].withSpaceBetween(height: 5),
              ),
              Obx(
                () {
                  if (controller.selectedIndex == 1) {
                    return ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller.productList.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(height: 12);
                      },
                      itemBuilder: (BuildContext context, int index) {
                        return ProductItemCard(
                          price: controller.productList[index].harga,
                          imagePath: controller.productList[index].imageBarang,
                          nameProduct: controller.productList[index].namaBarang,
                          description: controller.productList[index].deskripsi,
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6)
                                  ),
                                  backgroundColor: AppColors.background,
                                  title: Text(
                                    'konfirmasiHapus'.tr,
                                    style: AppTextStyle()
                                        .title(AppColors.titleLine),
                                  ),
                                  content: Text('hapusItemToko'.tr),
                                  actions: <Widget>[
                                    OutlinedButton(
                                      style: OutlinedButton.styleFrom(
                                          side: const BorderSide(
                                              color: AppColors.button1),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4))),
                                      child: Text(
                                        'batal'.tr,
                                        style: AppTextStyle()
                                            .subHeader(AppColors.hargaStat),
                                      ),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                    TextButton(
                                      style: TextButton.styleFrom(
                                        foregroundColor: AppColors.solidWhite,
                                        backgroundColor: AppColors.button1,
                                                            shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4)
                    ) // Warna teks tombol
                                      ),
                                      child: Text('yaHapus'.tr),
                                      onPressed: () async {
                                        await controller.deleteBarang(controller
                                            .productList[index].idBarang);
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        );
                      },
                    );
                  } else if (controller.selectedIndex == 2) {
                    return ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller.productList.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(height: 12);
                      },
                      itemBuilder: (BuildContext context, int index) {
                        return ProductItemCard(
                          price: controller.productList[index].harga,
                          imagePath: controller.productList[index].imageBarang,
                          nameProduct: controller.productList[index].namaBarang,
                          description: controller.productList[index].deskripsi,
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6)
                                  ),
                                  backgroundColor: AppColors.background,
                                  title: Text(
                                    'konfirmasiHapus'.tr,
                                    style: AppTextStyle()
                                        .title(AppColors.titleLine),
                                  ),
                                  content: Text('hapusItemToko'.tr),
                                  actions: <Widget>[
                                    OutlinedButton(
                                      style: OutlinedButton.styleFrom(
                                          side: const BorderSide(
                                              color: AppColors.button1),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4))),
                                      child: Text(
                                        'batal'.tr,
                                        style: AppTextStyle()
                                            .subHeader(AppColors.hargaStat),
                                      ),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                    TextButton(
                                      style: TextButton.styleFrom(
                                        foregroundColor: AppColors.solidWhite,
                                        backgroundColor: AppColors.button1,
                                                            shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4)
                    ) // Warna teks tombol
                                      ),
                                      child: Text('yaHapus'.tr),
                                      onPressed: () async {
                                        await controller.deleteBarang(controller
                                            .productList[index].idBarang);
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        );
                      },
                    );
                  } else {
                    return ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller.productList.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(height: 12);
                      },
                      itemBuilder: (BuildContext context, int index) {
                        return ProductItemCard(
                          price: controller.productList[index].harga,
                          imagePath: controller.productList[index].imageBarang,
                          nameProduct: controller.productList[index].namaBarang,
                          description: controller.productList[index].deskripsi,
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6)
                                  ),
                                  backgroundColor: AppColors.background,
                                  title: Text(
                                    'konfirmasiHapus'.tr,
                                    style: AppTextStyle()
                                        .title(AppColors.titleLine),
                                  ),
                                  content: Text('hapusItemToko'.tr),
                                  actions: <Widget>[
                                    OutlinedButton(
                                      style: OutlinedButton.styleFrom(
                                          side: const BorderSide(
                                              color: AppColors.button1),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4))),
                                      child: Text(
                                        'batal'.tr,
                                        style: AppTextStyle()
                                            .subHeader(AppColors.hargaStat),
                                      ),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                    TextButton(
                                      style: TextButton.styleFrom(
                                        foregroundColor: AppColors.solidWhite,
                                        backgroundColor: AppColors.button1,
                                                            shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4)
                    ) // Warna teks tombol
                                      ),
                                      child: Text('yaHapus'.tr),
                                      onPressed: () async {
                                        await controller.deleteBarang(controller
                                            .productList[index].idBarang);
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        );
                      },
                    );
                  }
                },
              ),
            ].withSpaceBetween(height: 10),
          ),
        ),
      ),
    );
  }
}
