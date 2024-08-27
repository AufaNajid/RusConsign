// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rusconsign/Page/giveRatingPage/controller/give_rating_controller.dart';
import 'package:rusconsign/Page/giveRatingPage/widgets/card_product.dart';
import 'package:rusconsign/Page/giveRatingPage/widgets/textfield_give_rating.dart';
import 'package:rusconsign/utils/colors.dart';
import 'package:rusconsign/utils/commonWidget/common_appbar.dart';
import 'package:rusconsign/utils/extension.dart';
import 'package:rusconsign/utils/text_style.dart';

class GiveRatingPage extends StatelessWidget {
  const GiveRatingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(GiveRatingController());
    return Scaffold(
      appBar: CommonAppBar(
        title: 'Berikan Penilaian'.tr,
        route: () {
          Get.back();
        },
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(
              child: CircularProgressIndicator(
                color: AppColors.hargaStat,
              ));
        } else if (controller.productDetail.value == null) {
          return const Center(
            child: Text('Product not found'),
          );
        } else {
          final product = controller.productDetail.value!;
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CardProductGiveRating(
                      imagePath: product.barang.imageBarang,
                      pemesan: "pemesan",
                      title: product.barang.namaBarang,
                      metodePembayaran: "metodePembayaran",
                      lokasiPertemuan: "lokasiPertemuan",
                      rating: product.barang.ratingBarang,
                      price: product.barang.harga,
                      quantity: product.barang.stock,
                      timeMeeting: product.barang.mitra.namaToko),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(5, (index) {
                      return IconButton(
                        icon: Icon(
                          Icons.star,
                          color: index < controller.selectedRating.value
                              ? Colors.yellow
                              : Colors.grey,
                        ),
                        onPressed: () {
                          if (controller.selectedRating.value == index + 1) {
                            controller.selectedRating.value = index;
                          } else {
                            controller.selectedRating.value = index + 1;
                          }
                          print('Selected Rating: ${controller.selectedRating.value}');
                        },
                      );
                    }),
                  ),
                  TextFieldGiveRating(
                      hintText: "Berikan Penilaian-mu! ",
                      controller: controller.penilaianController,
                      maxlines: 5),
                  Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        controller.sendComment(product.barang.id.toString());
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        padding: EdgeInsets.zero,
                        backgroundColor: AppColors.button2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: Text(
                        'Kirim Penilaian'.tr,
                        style:
                        AppTextStyle().subHeader(context, AppColors.background),
                      ),
                    ),
                  ),
                ].withSpaceBetween(height: 10),
              ),
            ),
          );
        }
      })
    );
  }
}
