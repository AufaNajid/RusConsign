import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:rusconsign/Page/cartPage/controller/cart_controller.dart';
import 'package:rusconsign/Page/cartPage/widgets/appbar_cart.dart';
import 'package:rusconsign/Page/cartPage/widgets/product_card.dart';
import 'package:rusconsign/utils/app_responsive.dart';
import 'package:rusconsign/utils/colors.dart';
import 'package:rusconsign/utils/extension.dart';
import 'package:rusconsign/utils/money_format.dart';
import 'package:rusconsign/utils/text_style.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  Future<void> refreshData() async {
    final CartController controller = Get.find<CartController>();
    await controller.fetchCart();
  }

  @override
  Widget build(BuildContext context) {
    final CartController controller = Get.put(CartController());
    return Scaffold(
      appBar: const AppBarCart(),
      backgroundColor: AppColors.background,
      body: RefreshIndicator(
        edgeOffset: 10,
        color: AppColors.hargaStat,
        backgroundColor: AppColors.cardIconFill,
        strokeWidth: RefreshProgressIndicator.defaultStrokeWidth,
        onRefresh: () => Future.delayed(
          const Duration(seconds: 1),
          refreshData,
        ),
        child: Obx(
          () {
            if (controller.isLoading.value) {
              return SizedBox(
                width: double.infinity,
                height: AppResponsive().screenHeight(context),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: CircularProgressIndicator(
                        color: AppColors.hargaStat,
                      ),
                    ),
                  ],
                ),
              );
            } else if (controller.cartItems.isEmpty) {
              return SizedBox(
                width: double.infinity,
                height: AppResponsive().screenHeight(context),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      "assets/images/fluent--box-search-24-regular.svg",
                      width: AppResponsive().screenWidth(context) * 0.1,
                      height: AppResponsive().screenHeight(context) * 0.1,
                    ),
                    Text(
                      'belumAdaBarang'.tr,
                      style: AppTextStyle()
                          .subHeader(context, AppColors.description),
                    )
                  ].withSpaceBetween(height: 12),
                ),
              );
            } else {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ListView.builder(
                  itemCount: controller.cartItems.length,
                  itemBuilder: (BuildContext context, int index) {
                    final cartData = controller.cartItems[index];
                    final barang = cartData.barang;
                    final mitra = barang.mitra;
                    return ProductCardCart(
                      profileImagePath: "https://avatar.iran.liara.run/public",
                      namaBarang: barang.namaBarang,
                      imagePath: barang.imageBarang,
                      sellerUsername: mitra.namaLengkap,
                      rating: barang.ratingBarang.toDouble(),
                      price: barang.harga,
                      quantity: cartData.quantity,
                      index: index,
                    );
                  },
                ),
              );
            }
          },
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
