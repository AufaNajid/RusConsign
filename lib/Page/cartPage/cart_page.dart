import 'package:flutter/material.dart';
import 'package:rusconsign/Page/cartPage/widgets/appbar_cart.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarCart(),
    );
  }
}