import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rusconsign/Page/checkoutPage/checkout_page_controller.dart';
import 'package:rusconsign/Page/checkoutPage/widgets/dropdown_payment.dart';
import 'package:rusconsign/Page/checkoutPage/widgets/item_checkout.dart';
import 'package:rusconsign/Page/checkoutPage/widgets/location.dart';
import 'package:rusconsign/Page/checkoutPage/widgets/payment_detail.dart';
import 'package:rusconsign/utils/colors.dart';
import 'package:rusconsign/utils/commonWidget/common_appbar.dart';
import 'package:rusconsign/utils/extension.dart';
import 'package:rusconsign/utils/text_style.dart';

class ChekcoutPage extends StatelessWidget {
  const ChekcoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CheckoutPageController());
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
          ));
        } else if (controller.productDetail.value == null) {
          return const Center(
            child: Text('Product not found'),
          );
        } else {
          final product = controller.productDetail.value!;
          final mitra = product.mitra;
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
                      ItemCheckout(
                        imagePath: product.imageBarang,
                        title: product.namaBarang,
                        profileImagePath: 'https://via.placeholder.com/40x40',
                        profileName: mitra.namaLengkap,
                        rating: product.ratingBarang.toDouble(),
                        price: product.harga,
                        quantity: 1,
                      ),
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
                          locationHeader: controller.titleLokasi.toString(),
                          locationDetail: controller.descLokasi.toString()),
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
                        style: AppTextStyle().header(context, AppColors.titleLine),
                        textAlign: TextAlign.start,
                      ),
                      PaymentDetail(
                        subPrice: product.harga,
                        adminPrice: 1000,
                      ),
                    ].withSpaceBetween(height: 10),
                  )
                ].withSpaceBetween(height: 30),
              ),
            ),
          );
        }
      }),
      bottomNavigationBar: BottomAppBar(
        elevation: 5,
        shadowColor: AppColors.cardIconFill,
        surfaceTintColor: AppColors.background,
        color: AppColors.background,
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
                        controller.productDetail.value!.id.toString(), "1");
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
                  style: AppTextStyle().subHeader(context, AppColors.background),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
