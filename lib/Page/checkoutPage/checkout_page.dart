import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rusconsign/Page/checkoutPage/widgets/appbar.dart';
import 'package:rusconsign/Page/checkoutPage/widgets/dropdown_payment.dart';
import 'package:rusconsign/Page/checkoutPage/widgets/item_checkout.dart';
import 'package:rusconsign/Page/checkoutPage/widgets/location.dart';
import 'package:rusconsign/Page/checkoutPage/widgets/payment_detail.dart';
import 'package:rusconsign/utils/colors.dart';
import 'package:rusconsign/utils/text_style.dart';

class ChekcoutPage extends StatelessWidget {
  const ChekcoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            bottomNavigationBar: BottomAppBar(
        elevation: 20,
        shadowColor: Colors.black,
        surfaceTintColor:AppColors.background ,
        color: AppColors.background,
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  Get.toNamed("/qrispayment");
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.button2,
                  shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                child: Text(
                  "Buat Pesanan",
                  style: AppTextStyle().description(AppColors.background),
                ),
              ),
            ),
          ],
        ),
      ),
      appBar: const AppBarCheckout(title: "Checkout"),
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Pembelian",
                style: AppTextStyle().header(AppColors.titleLine),
              ),
              const SizedBox(height: 10,),
              const ItemChekcout(
                rating: "5.0",
                price: "15.000",
                jumlahBarang: "1",
                subTotal: "15.000",
                profileImagePath: "https://via.placeholder.com/165x110",
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Lokasi Pertemuan",
                style: AppTextStyle().header(AppColors.titleLine),
                textAlign: TextAlign.start,
              ),
              const SizedBox(height: 10,),
              const LocationChekout(
                locationHeader: "SMK Raden Umar Said Kudus",
                locationDetail:
                    "Jalan Sukun Raya No.09, Besito Kulon, Besito, Kec. Gebog, Kabupaten Kudus, Jawa Tengah 59333",
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Pembayaran",
                style: AppTextStyle().header(AppColors.titleLine),
                textAlign: TextAlign.start,
              ),
               DropdownPayment(),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Rincian Pembayaran",
                style: AppTextStyle().header(AppColors.titleLine),
                textAlign: TextAlign.start,
              ),
              const SizedBox(height: 10,),
              const PaymentDetail(subPrice: "15000", adminPrice: "1000", totalPrice: "totalPrice")
            ],
          ),
        ),
      ),
    );
  }
}
