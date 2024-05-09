import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rusconsign/Page/checkoutPage/widgets/appbar.dart';
import 'package:rusconsign/Page/checkoutPage/widgets/dropdown_payment.dart';
import 'package:rusconsign/Page/checkoutPage/widgets/item_checkout.dart';
import 'package:rusconsign/Page/checkoutPage/widgets/location.dart';
import 'package:rusconsign/utils/colors.dart';
import 'package:rusconsign/utils/text_style.dart';

class ChekcoutPage extends StatelessWidget {
  const ChekcoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCheckout(title: "Checkout"),
      backgroundColor: AppColors.background,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Pembelian",
            style: AppTextStyle().header(AppColors.titleLine),
          ),
          ItemChekcout(
            rating: "5.0",
            price: "15.000",
            jumlahBarang: "1",
            subTotal: "15.000",
            profileImagePath: "https://via.placeholder.com/165x110",
          ),
          SizedBox(height: 10,),
          Text("Lokasi Pertemuan",
          style: AppTextStyle().header(AppColors.titleLine),
          textAlign: TextAlign.start,
          ),
          LocationChekout(
            locationHeader: "SMK Raden Umar Said Kudus",
            locationDetail: "Jalan Sukun Raya No.09, Besito Kulon, Besito, Kec. Gebog, Kabupaten Kudus, Jawa Tengah 59333",
          ),
          SizedBox(height: 10,),
          Text("Pembayaran",
          style: AppTextStyle().header(AppColors.titleLine),
          textAlign: TextAlign.start,
          ),
          DropdownPayment()
        ],
      ),
    );
  }
}