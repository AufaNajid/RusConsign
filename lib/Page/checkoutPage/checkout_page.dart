import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rusconsign/Page/checkoutPage/widgets/appbar.dart';
import 'package:rusconsign/Page/checkoutPage/widgets/item_checkout.dart';
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
        children: [
          Text("Pembelian",
            style: AppTextStyle().header(AppColors.titleLine),
          ),
          ItemChekcout()
        ],
      ),
    );
  }
}