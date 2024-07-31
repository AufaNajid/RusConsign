import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:rusconsign/Page/orderPage/widgets/finish_card.dart';
import 'package:rusconsign/Page/orderPage/widgets/on_process_card.dart';
import 'package:rusconsign/Page/orderPage/order_page_controller.dart';
import 'package:rusconsign/utils/colors.dart';
import 'package:rusconsign/utils/text_style.dart';

import '../../utils/app_responsive.dart';
import 'widgets/filter_order_button.dart';
import 'widgets/not_paid_card.dart';

class OrderPage extends StatelessWidget {
  final OrderPageController orderController = Get.put(OrderPageController());

  OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            FeatherIcons.chevronLeft,
            color: AppColors.borderIcon,
          ),
        ),
        title: Text(
          'pesananSaya'.tr,
          style: AppTextStyle().title(AppColors.titleLine),
        ),
        centerTitle: true,
        backgroundColor: AppColors.background,
        surfaceTintColor: AppColors.background,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                FeatherIcons.messageCircle,
                color: AppColors.borderIcon,
              ))
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: Row(
              children: [
                FilterOrderButton(
                  text: 'belumBayar'.tr,
                  icon: FeatherIcons.creditCard,
                  index: 0,
                ),
                const Spacer(),
                FilterOrderButton(
                  text: 'proses'.tr,
                  icon: FeatherIcons.clock,
                  index: 1,
                ),
                const Spacer(),
                FilterOrderButton(
                  text: 'selesai'.tr,
                  icon: FeatherIcons.check,
                  index: 2,
                )
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 4),
                  Obx(
                        () {
                      if (orderController.isLoading.value) {
                        return Column(
                          children: [
                            SizedBox(
                              height: AppResponsive()
                                  .screenHeight(context) *
                                  0.4,
                              child: const Center(
                                child: CircularProgressIndicator(
                                  color: AppColors.hargaStat,
                                ),
                              ),
                            )
                          ],
                        );
                      } else if (orderController.productList.isEmpty) {
                        return Column(
                          children: [
                            SizedBox(
                              height: AppResponsive()
                                  .screenHeight(context) *
                                  0.4,
                              child: Center(
                                child: Text(
                                  'belumAdaData'.tr,
                                  style: AppTextStyle()
                                      .subHeader(AppColors.hargaStat),
                                ),
                              ),
                            ),
                          ],
                        );
                      }

                      if (orderController.selectedIndex == 0) {
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: orderController.productList.length,
                          itemBuilder: (context, index) {
                            final cod = orderController.productList[index];
                            return NotPaidCard(
                              imagePath: cod.barang.imageBarang,
                              title: cod.barang.namaBarang,
                              profileImagePath: cod.lokasi.mitra.imageProfile,
                              profileUsername: cod.lokasi.mitra.namaToko,
                              rating: cod.barang.ratingBarang.toDouble(),
                              totalProductPrice: cod.barang.harga,
                              paymentMethod: cod.statusPembayaran,
                              meetingLocation: cod.lokasi.namaLokasi,
                              onCancelProduct: () {},
                            );
                          },
                        );
                      } else if (orderController.selectedIndex == 1) {
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: orderController.productList.length,
                          itemBuilder: (context, index) {
                            final cod = orderController.productList[index];
                            return OnProcessCard(
                              imagePath: cod.barang.imageBarang,
                              title: cod.barang.namaBarang,
                              profileImagePath: cod.lokasi.mitra.imageProfile,
                              profileUsername: cod.lokasi.mitra.namaToko,
                              rating: cod.barang.ratingBarang.toDouble(),
                              totalProductPrice: cod.barang.harga,
                              paymentMethod: cod.statusPembayaran,
                              meetingLocation: cod.lokasi.namaLokasi,
                              onChatSeller: () {},
                            );
                          },
                        );
                      } else if (orderController.selectedIndex == 2) {
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: orderController.productList.length,
                          itemBuilder: (context, index) {
                            final cod = orderController.productList[index];
                            return FinishCard(
                              imagePath: cod.barang.imageBarang,
                              title: cod.barang.namaBarang,
                              profileImagePath: cod.lokasi.mitra.imageProfile,
                              profileUsername: cod.lokasi.mitra.namaToko,
                              rating: cod.barang.ratingBarang.toDouble(),
                              totalProductPrice: cod.barang.harga,
                              paymentMethod: cod.statusPembayaran,
                              meetingLocation: cod.lokasi.namaLokasi,
                              onGiveRating: () {},
                            );
                          },
                        );
                      }
                      return const SizedBox();
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
