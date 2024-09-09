// ignore_for_file: unrelated_type_equality_checks, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rusconsign/Page/checkoutCartPage/checkout_cart_page_controller.dart';
import 'package:rusconsign/Page/checkoutCartPage/widgets/dropdown_payment.dart';
import 'package:rusconsign/Page/checkoutCartPage/widgets/item_checkout.dart';
import 'package:rusconsign/Page/checkoutCartPage/widgets/location.dart';
import 'package:rusconsign/Page/checkoutCartPage/widgets/payment_detail.dart';
import 'package:rusconsign/utils/app_responsive.dart';
import 'package:rusconsign/utils/colors.dart';
import 'package:rusconsign/utils/commonWidget/common_appbar.dart';
import 'package:rusconsign/utils/extension.dart';
import 'package:rusconsign/utils/text_style.dart';

class CheckoutCartPage extends StatelessWidget {
  const CheckoutCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CheckoutCartPageController());
    return Scaffold(
      appBar: CommonAppBar(
        title: 'checkout'.tr,
        route: () {
          Get.back();
        },
      ),
      backgroundColor: AppColors.background,
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(
              color: AppColors.hargaStat,
            ),
          );
        } else {
          final lokasi = controller.detailLokasi.value!;
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'pembelian'.tr,
                        style:
                            AppTextStyle().header(context, AppColors.titleLine),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.productList.length,
                        itemBuilder: (BuildContext context, int index) {
                          final product = controller.productList[index];
                          const imgProfile = "https://rusconsign.com";
                          return ItemCheckout(
                            imagePath: product.imageBarang,
                            title: product.namaBarang,
                            profileImagePath: product.mitra.profileImage == null
                                ? 'https://ui-avatars.com/api/?name=${product.mitra.namaToko.toString()}&background=db6767&color=fafafa'
                                : '$imgProfile${product.mitra.profileImage.toString().replaceFirst("/storage/profiles/", "/api/storage/public/profiles/")}',
                            profileName: product.mitra.namaLengkap,
                            rating: product.ratingBarang.toDouble(),
                            price: product.harga,
                            quantity: product.quantity,
                          );
                        },
                      )
                    ].withSpaceBetween(height: 10),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'lokasiPertemuan'.tr,
                        style:
                            AppTextStyle().header(context, AppColors.titleLine),
                        textAlign: TextAlign.start,
                      ),
                      LocationChekout(
                        locationHeader: lokasi.namaLokasi,
                        locationDetail: lokasi.descLokasi,
                      ),
                    ].withSpaceBetween(height: 10),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'pembayaran'.tr,
                        style:
                            AppTextStyle().header(context, AppColors.titleLine),
                        textAlign: TextAlign.start,
                      ),
                      const DropdownPayment(),
                    ].withSpaceBetween(height: 10),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'rincianPembayaran'.tr,
                        style:
                            AppTextStyle().header(context, AppColors.titleLine),
                        textAlign: TextAlign.start,
                      ),
                      PaymentDetail(
                        subPrice: controller.productList
                            .map((element) =>
                                element.harga.toInt() *
                                element.quantity.toInt())
                            .reduce((a, b) => a + b),
                        adminPrice: 1000,
                      ),
                    ].withSpaceBetween(height: 10),
                  )
                ].withSpaceBetween(height: 12),
              ),
            ),
          );
        }
      }),
      bottomNavigationBar: SizedBox(
        height: AppResponsive().screenWidth(context) * 0.18,
        child: BottomAppBar(
          elevation: 5,
          shadowColor: AppColors.cardIconFill,
          surfaceTintColor: AppColors.background,
          color: AppColors.background,
          child: SizedBox(
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () async {
                      if (controller.selectedPaymentMethod ==
                          'Cash On Delivery (COD)') {
                        await controller.addPesanan(
                            controller.productDetail.value!.id.toString(),
                            controller.productDetail.value!.mitra.id.toString());
                        if (controller.successfulPesanProduct.value == true) {
                          Get.offNamed("/paymentdone");
                        }
                      } else {
                        await controller.paymentTesting(
                          controller.productDetail.value!.id.toString(),
                          // controller.productCheckoutData["quantityProduct"]
                          //     .toString(),
                        );
                      }
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
                      'buatPesanan'.tr,
                      style:
                          AppTextStyle().subHeader(context, AppColors.background),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
