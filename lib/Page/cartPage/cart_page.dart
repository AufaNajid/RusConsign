import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:rusconsign/Page/cartPage/controller/cart_controller.dart';
import 'package:rusconsign/Page/cartPage/widgets/appbar_cart.dart';
import 'package:rusconsign/Page/cartPage/widgets/product_card.dart';
import 'package:rusconsign/utils/app_responsive.dart';
import 'package:rusconsign/utils/colors.dart';
import 'package:rusconsign/utils/extension.dart';
import 'package:rusconsign/utils/money_format.dart';
import 'package:rusconsign/utils/size_data.dart';
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
                    const imgProfile = "https://rusconsign.com";

                    return ProductCardCart(
                      profileImagePath: mitra.profileImage == null
                          ? "https://ui-avatars.com/api/?name=${mitra.namaToko.toString()}&background=db6767&color=fafafa"
                          : '$imgProfile${mitra.profileImage.toString().replaceFirst("/storage/profiles/", "/api/storage/public/profiles/")}',
                      namaBarang: barang.namaBarang,
                      imagePath: barang.imageBarang,
                      sellerUsername: mitra.namaToko.toString(),
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
      bottomNavigationBar: Obx(
        () => controller.cartItems.isEmpty
            ? const SizedBox()
            : SizedBox(
                height: AppResponsive().screenWidth(context) * 0.15,
                width: double.infinity,
                child: Material(
                  color: AppColors.cardIconFill,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width:
                                  AppResponsive().screenWidth(context) * 0.065,
                              height:
                                  AppResponsive().screenWidth(context) * 0.065,
                              child: IconButton(
                                onPressed: controller.setSelectedAll,
                                icon: Icon(
                                  FeatherIcons.check,
                                  size: SizeData.iconCheckCart,
                                  color: controller.isSelectedAll.value
                                      ? AppColors.activeIconType
                                      : AppColors.cardIconFill,
                                ),
                                style: ButtonStyle(
                                  padding: const MaterialStatePropertyAll(
                                    EdgeInsets.zero,
                                  ),
                                  backgroundColor: MaterialStatePropertyAll(
                                    controller.isSelectedAll.value
                                        ? AppColors.activeIcon
                                        : AppColors.cardIconFill,
                                  ),
                                  side: MaterialStatePropertyAll(
                                    BorderSide(
                                      color: AppColors.borderIcon,
                                      style: BorderStyle.solid,
                                      width: 1,
                                    ),
                                  ),
                                  shape: MaterialStatePropertyAll(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              'semua'.tr,
                              style: AppTextStyle()
                                  .subHeader(context, AppColors.description),
                            ),
                          ].withSpaceBetween(width: 6),
                        ),
                        Row(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  '${'total'.tr} : ',
                                  style: AppTextStyle().subHeader(
                                      context, AppColors.description),
                                ),
                                Text(
                                  controller.selectedItems.isEmpty
                                      ? '-'
                                      : MoneyFormat.format(
                                          controller.getTotalPrice(),
                                        ),
                                  style: AppTextStyle()
                                      .subHeader(context, AppColors.hargaStat),
                                ),
                              ],
                            ),
                            SizedBox(
                              width:
                                  AppResponsive().screenWidth(context) * 0.38,
                              child: ElevatedButton(
                                onPressed: controller.selectedItems.isEmpty
                                    ? null
                                    : () {
                                        controller.goToCheckout();
                                      },
                                style: ButtonStyle(
                                  elevation: const MaterialStatePropertyAll(0),
                                  padding: const MaterialStatePropertyAll(
                                    EdgeInsets.zero,
                                  ),
                                  shape: MaterialStatePropertyAll(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                  ),
                                  backgroundColor: MaterialStatePropertyAll(
                                    controller.selectedItems.isEmpty
                                        ? AppColors.nonActiveBar
                                        : AppColors.button1,
                                  ),
                                ),
                                child: Text(
                                  'checkout'.tr,
                                  style: AppTextStyle().subHeader(
                                    context,
                                    controller.selectedItems.isEmpty
                                        ? AppColors.nonActiveCheckout
                                        : AppColors.textButton1,
                                  ),
                                ),
                              ),
                            ),
                          ].withSpaceBetween(width: 8),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
