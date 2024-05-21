import 'package:flutter/material.dart';
import 'package:rusconsign/Page/cartPage/widgets/appbar_cart.dart';
import 'package:rusconsign/Page/cartPage/widgets/product_card.dart';
import 'package:rusconsign/utils/colors.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarCart(),
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
          child: Column(
        children: [
          ProductCardCart(
            profileImagePath: "https://via.placeholder.com/100x100",
            sellerUsername: "Ujang Kampas Rem",
            rating: 5.0,
            price: 15000,
            imagePath: 'https://via.placeholder.com/100x100',
          ),
        ],
      )),
    );
  }
}
