// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:rusconsign/Page/productmanagePage/product_manage_controller.dart';
import 'package:rusconsign/Page/productmanagePage/widgets/filter_product_button.dart';
import 'package:rusconsign/Page/productmanagePage/widgets/item_card.dart';
import 'package:rusconsign/utils/app_responsive.dart';
import 'package:rusconsign/utils/colors.dart';
import 'package:rusconsign/utils/commonWidget/common_appbar.dart';
import 'package:rusconsign/utils/extension.dart';
import 'package:rusconsign/utils/text_style.dart';

class ProductManagePage extends StatelessWidget {
  final controller = Get.put(ProductManageController());
  ProductManagePage({Key? key}) : super(key: key);

  Future<void> refreshData() async {
    final ProductManageController controller =
        Get.find<ProductManageController>();
    await controller.fetchProductMitra(controller.selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: 'kelolaPJ'.tr,
        route: () {
          Get.back();
        },
      ),
      backgroundColor: AppColors.background,
      body: RefreshIndicator(
        edgeOffset: 15,
        color: AppColors.hargaStat,
        backgroundColor: AppColors.cardIconFill,
        strokeWidth: RefreshProgressIndicator.defaultStrokeWidth,
        onRefresh: () => Future.delayed(
          const Duration(seconds: 2),
          refreshData,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          primary: true,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Column(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                    if (controller.isLoading.value) {
                      return Column(
                        children: [
                          SizedBox(
                            height: AppResponsive().screenHeight(context) * 0.8,
                            child: const Center(
                              child: CircularProgressIndicator(
                                color: AppColors.hargaStat,
                              ),
                            ),
                          )
                        ],
                      );
                    } else if (controller.productList.isEmpty) {
                      return SizedBox(
                        width: double.infinity,
                        height: AppResponsive().screenHeight(context) * 0.8,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              "assets/images/fluent--box-search-24-regular.svg",
                              // ignore: deprecated_member_use
                              color: AppColors.hargaStat,
                              width: AppResponsive().screenWidth(context) * 0.1,
                              height:
                                  AppResponsive().screenHeight(context) * 0.1,
                            ),
                            Text(
                              'belumAdaData'.tr,
                              style: AppTextStyle()
                                  .subHeader(context, AppColors.description),
                            )
                          ].withSpaceBetween(height: 12),
                        ),
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
                            imagePath:
                                controller.productList[index].imageBarang,
                            nameProduct:
                                controller.productList[index].namaBarang,
                            description:
                                controller.productList[index].deskripsi,
                            statusBarang: controller.productList[index].status,
                            onPressed: () {
                              if (controller.productList[index].status ==
                                  "publish") {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(6),
                                        ),
                                        backgroundColor: AppColors.background,
                                        title: Text(
                                          'Item Telah Di Publish!'.tr,
                                          style: AppTextStyle().title(
                                              context, AppColors.titleLine),
                                        ),
                                        content: Text(
                                            'Item ini telah di publish, anda tidak bisa menghapusnya!'
                                                .tr),
                                        actions: <Widget>[
                                          TextButton(
                                            style: TextButton.styleFrom(
                                              foregroundColor:
                                                  AppColors.solidWhite,
                                              backgroundColor:
                                                  AppColors.button1,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                              ),
                                            ),
                                            child: Text('Tutup'.tr),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                        ],
                                      );
                                    });
                              } else {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      backgroundColor: AppColors.background,
                                      title: Text(
                                        'konfirmasiHapus'.tr,
                                        style: AppTextStyle().title(
                                            context, AppColors.titleLine),
                                      ),
                                      content: Text('hapusItemToko'.tr),
                                      actions: <Widget>[
                                        OutlinedButton(
                                          style: OutlinedButton.styleFrom(
                                              side: const BorderSide(
                                                  color: AppColors.button1),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          4))),
                                          child: Text(
                                            'batal'.tr,
                                            style: AppTextStyle().subHeader(
                                                context, AppColors.hargaStat),
                                          ),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                        TextButton(
                                          style: TextButton.styleFrom(
                                            foregroundColor:
                                                AppColors.solidWhite,
                                            backgroundColor: AppColors.button1,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                          ),
                                          child: Text('yaHapus'.tr),
                                          onPressed: () async {
                                            await controller.deleteBarang(
                                                controller.productList[index]
                                                    .idBarang);
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              }
                            },
                            onEdit: () {
                              Get.offNamed("/editdataproduct",
                                  arguments:
                                      controller.productList[index].idBarang);
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
      ),
    );
  }
}
