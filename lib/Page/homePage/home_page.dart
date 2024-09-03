import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:rusconsign/Page/homePage/widgets/filter_button.dart';
import 'package:rusconsign/Page/homePage/widgets/product_card.dart';
import 'package:rusconsign/Page/homePage/home_page_controller.dart';
import 'package:rusconsign/authentication/controllers/auth_login_controller.dart';
import 'package:rusconsign/utils/app_responsive.dart';
import 'package:rusconsign/utils/colors.dart';
import 'package:rusconsign/utils/extension.dart';
import 'package:rusconsign/utils/size_data.dart';
import 'package:rusconsign/utils/text_style.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  Future<void> refreshData() async {
    final HomePageController controller = Get.find<HomePageController>();
    await controller.fetchProduct(controller.selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    final HomePageController controller = Get.put(HomePageController());
    final AuthLoginController controllerName = Get.put(AuthLoginController());

    return Scaffold(
      backgroundColor: AppColors.background,
      body: RefreshIndicator(
        edgeOffset: 10,
        color: AppColors.hargaStat,
        backgroundColor: AppColors.cardIconFill,
        strokeWidth: RefreshProgressIndicator.defaultStrokeWidth,
        onRefresh: () => Future.delayed(
          const Duration(seconds: 2),
          refreshData,
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image(
                        image: AssetImage('assets/images/logo.png'),
                        height: 28,
                      ),
                      Spacer(),
                      // GestureDetector(
                      //   onTap: () {
                      //     Get.toNamed('/chatlist');
                      //   },
                      //   child: Icon(
                      //     FeatherIcons.messageCircle,
                      //     color: AppColors.borderIcon,
                      //     size: SizeData.iconSize,
                      //   ),
                      // ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Text(
                            'halo'.tr,
                            style: AppTextStyle()
                                .header(context, AppColors.titleLine),
                          ),
                          Obx(
                            () => Text(
                              controllerName.dataUsername.value,
                              style: AppTextStyle()
                                  .header(context, AppColors.titleLine),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: TextField(
                              controller: controller.namaBarangController,
                              cursorColor: AppColors.hargaStat,
                              style: AppTextStyle().descriptionBold(
                                  context, AppColors.description),
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                  vertical:
                                      (AppResponsive().screenWidth(context) *
                                              0.1) /
                                          2,
                                  horizontal: 10,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6),
                                  borderSide: BorderSide.none,
                                ),
                                filled: true,
                                fillColor: AppColors.cardIconFill,
                                hintText: 'cari'.tr,
                                hintStyle: AppTextStyle().description(
                                    context, AppColors.description),
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          SizedBox(
                            width: AppResponsive().screenWidth(context) * 0.13,
                            height: AppResponsive().screenWidth(context) * 0.13,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(6),
                              child: Material(
                                color: AppColors.cardIconFill,
                                child: GestureDetector(
                                  onTap: () async {
                                    if (controller
                                        .namaBarangController.text.isNotEmpty) {
                                      String namaBarang =
                                          controller.namaBarangController.text;
                                      await controller
                                          .searchProduct(namaBarang);
                                    } else {
                                      controller.fetchProduct(
                                          controller.currentIndex.value);
                                    }
                                  },
                                  child: Icon(
                                    FeatherIcons.search,
                                    color: AppColors.borderIcon,
                                    size: SizeData.iconSize,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ].withSpaceBetween(width: 10),
                      ),
                    ].withSpaceBetween(height: 16),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CarouselSlider(
                      items: [
                        'assets/images/item_carousel_1.png',
                        'assets/images/item_carousel_2.png',
                      ].map((item) {
                        return GestureDetector(
                          onTap: () {},
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              item,
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      }).toList(),
                      options: CarouselOptions(
                        height: AppResponsive().screenWidth(context) * 0.35,
                        enlargeFactor: 0.25,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 3),
                        enlargeCenterPage: true,
                        onPageChanged: (index, reason) {
                          controller.updateCurrentIndexIndicator(index);
                        },
                      ),
                    ),
                    Obx(
                      () => Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          2,
                          (index) => Container(
                            width: 8,
                            height: 8,
                            margin: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 4.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: (controller.currentIndex.value == index)
                                  ? AppColors.activeIcon
                                  : AppColors.activeIconType,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'halamanP&J'.tr,
                                style: AppTextStyle()
                                    .subHeader(context, AppColors.titleLine),
                              ),
                              Row(
                                children: [
                                  FilterButton(
                                    text: 'semua'.tr,
                                    icon: FeatherIcons.alignJustify,
                                    index: 0,
                                  ),
                                  const Spacer(),
                                  FilterButton(
                                    text: 'jasa'.tr,
                                    icon: FeatherIcons.users,
                                    index: 1,
                                  ),
                                  const Spacer(),
                                  FilterButton(
                                    text: 'produk'.tr,
                                    icon: FeatherIcons.box,
                                    index: 2,
                                  )
                                ],
                              ),
                            ].withSpaceBetween(height: 10),
                          ),
                          Obx(
                            () {
                              if (controller.isLoading.value) {
                                return Column(
                                  children: [
                                    SizedBox(
                                      height: AppResponsive()
                                              .screenHeight(context) *
                                          0.4,
                                      child: const Center(
                                        child: CircularProgressIndicator(
                                          color: AppColors.hargaStat,
                                        ),
                                      ),
                                    )
                                  ],
                                );
                              } else if (controller.productList.isEmpty) {
                                return Column(
                                  children: [
                                    SizedBox(
                                      height: AppResponsive()
                                              .screenHeight(context) *
                                          0.4,
                                      child: Center(
                                        child: Text(
                                          'belumAdaData'.tr,
                                          style: AppTextStyle().subHeader(
                                              context, AppColors.hargaStat),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              } else {
                                return GridView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: controller.productList.length,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 8,
                                    mainAxisSpacing: 8,
                                    childAspectRatio: 0.8,
                                  ),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    final product =
                                        controller.productList[index];
                                    return ProductCard(
                                      imagePath: product.imageBarang,
                                      title: product.namaBarang,
                                      price: product.harga,
                                      rating: product.ratingBarang.toDouble(),
                                      productId: product.id,
                                    );
                                  },
                                );
                              }
                            },
                          ),
                        ].withSpaceBetween(height: 10),
                      ),
                    ].withSpaceBetween(height: 10),
                  ),
                ),
              ].withSpaceBetween(height: 10),
            ),
          ),
        ),
      ),
    );
  }
}
