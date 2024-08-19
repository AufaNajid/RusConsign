import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rusconsign/Page/cartPage/widgets/appbar_cart.dart';
import 'package:rusconsign/Page/cartPage/widgets/product_card.dart';
import 'package:rusconsign/utils/app_responsive.dart';
import 'package:rusconsign/utils/colors.dart';
import 'package:rusconsign/utils/extension.dart';
import 'package:rusconsign/utils/money_format.dart';
import 'package:rusconsign/utils/text_style.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCart(),
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              ListView.builder(
                itemCount: 10,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return const ProductCardCart(
                    profileImagePath: "https://via.placeholder.com/100x100",
                    sellerUsername: "Username Toko",
                    rating: 5.0,
                    price: 15000,
                    imagePath: 'https://via.placeholder.com/100x100',
                    quantity: 1,
                    subtotalValue: 15000,
                  );
                },
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: AppResponsive().screenWidth(context) * 0.15,
        width: double.infinity,
        child: Material(
          color: AppColors.cardIconFill,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '${'total'.tr} : ',
                      style: AppTextStyle()
                          .subHeader(context, AppColors.description),
                    ),
                    Text(
                      MoneyFormat.format(10000),
                      style: AppTextStyle()
                          .subHeader(context, AppColors.hargaStat),
                    )
                  ].withSpaceBetween(width: 5),
                ),
                const Spacer(),
                SizedBox(
                  width: AppResponsive().screenWidth(context) * 0.5,
                  height: AppResponsive().screenWidth(context) * 0.5,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.toNamed("/checkoutpage");
                    },
                    style: ButtonStyle(
                      elevation: const MaterialStatePropertyAll(0),
                      padding: const MaterialStatePropertyAll(EdgeInsets.zero),
                      shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      backgroundColor:
                          const MaterialStatePropertyAll(AppColors.button1),
                    ),
                    child: Text(
                      'checkout'.tr,
                      style: AppTextStyle()
                          .subHeader(context, AppColors.textButton1),
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
