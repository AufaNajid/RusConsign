import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rusconsign/Page/checkoutPage/widgets/appbar.dart';
import 'package:rusconsign/Page/checkoutPage/widgets/dropdown_payment.dart';
import 'package:rusconsign/Page/checkoutPage/widgets/item_checkout.dart';
import 'package:rusconsign/Page/checkoutPage/widgets/location.dart';
import 'package:rusconsign/Page/checkoutPage/widgets/payment_detail.dart';
import 'package:rusconsign/utils/colors.dart';
import 'package:rusconsign/utils/extension.dart';
import 'package:rusconsign/utils/text_style.dart';

class ChekcoutPage extends StatelessWidget {
  const ChekcoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCheckout(title: 'checkout'.tr),
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
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
                    style: AppTextStyle().header(AppColors.titleLine),
                  ),
                  const ItemChekcout(
                    imagePath: 'https://via.placeholder.com/100x100',
                    title: 'dadadwndandadjad',
                    profileImagePath: 'https://via.placeholder.com/40x40',
                    profileName: 'bagas Prasetyo',
                    rating: 5.0,
                    price: 15000,
                    quantity: 2,
                  ),
                ].withSpaceBetween(height: 10),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'lokasiPertemuan'.tr,
                    style: AppTextStyle().header(AppColors.titleLine),
                    textAlign: TextAlign.start,
                  ),
                  const LocationChekout(
                    locationHeader: "SMK Raden Umar Said Kudus",
                    locationDetail:
                        "Jalan Sukun Raya No.09, Besito Kulon, Besito, Kec. Gebog, Kabupaten Kudus, Jawa Tengah 59333",
                  ),
                ].withSpaceBetween(height: 10),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'pembayaran'.tr,
                    style: AppTextStyle().header(AppColors.titleLine),
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
                    style: AppTextStyle().header(AppColors.titleLine),
                    textAlign: TextAlign.start,
                  ),
                  const PaymentDetail(
                      subPrice: 15000,
                      adminPrice: 1000,),
                ].withSpaceBetween(height: 10),
              )
            ].withSpaceBetween(height: 30),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 5,
        shadowColor: AppColors.cardIconFill,
        surfaceTintColor: AppColors.background,
        color: AppColors.background,
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  Get.toNamed("/qrispayment");
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
                  "Buat Pesanan",
                  style: AppTextStyle().subHeader(AppColors.background),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
