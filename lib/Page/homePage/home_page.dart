import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:rusconsign/page/homePage/home_page_controller.dart';
import 'package:rusconsign/page/homePage/widgets/filter_button.dart';
import 'package:rusconsign/page/homePage/widgets/product_card.dart';
import 'package:rusconsign/utils/app_responsive.dart';
import 'package:rusconsign/utils/colors.dart';
import 'package:rusconsign/utils/extension.dart';
import 'package:rusconsign/utils/text_style.dart';

class HomePage extends StatelessWidget {
  final controller = Get.put(HomePageController());
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Image(
                      image: AssetImage('assets/images/logo.png'),
                      height: 28,
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed('/chatlist');
                      },
                      child: const Icon(
                        FeatherIcons.messageCircle,
                        color: AppColors.borderIcon,
                        size: 24,
                      ),
                    ),
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
                          style: AppTextStyle().header(AppColors.titleLine),
                        ),
                        Text(
                          'Username',
                          style: AppTextStyle().header(AppColors.titleLine),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: AppResponsive().screenWidth(context) * 0.75,
                          height: 50,
                          child: TextField(
                            cursorColor: AppColors.hargaStat,
                            style: AppTextStyle()
                                .descriptionBold(AppColors.description),
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              fillColor: AppColors.cardIconFill,
                              hintText: 'cari'.tr,
                              hintStyle: AppTextStyle()
                                  .description(AppColors.description),
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        const Spacer(),
                        SizedBox(
                          width: 50,
                          height: 50,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(6),
                            child: Material(
                                color: AppColors.cardIconFill,
                                child: GestureDetector(
                                  onTap: () {},
                                  child: const Icon(
                                    FeatherIcons.search,
                                    color: AppColors.borderIcon,
                                  ),
                                )),
                          ),
                        ),
                      ],
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
                        onTap: () {
                          Get.toNamed("/diskonpage");
                        },
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
                      height: AppResponsive().screenHeight(context) * 0.18,
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
                              style: AppTextStyle().subHeader(AppColors.titleLine),
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
                            if (controller.selectedIndex == 1) {
                              return GridView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: 10,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 8,
                                  mainAxisSpacing: 8,
                                  childAspectRatio: 0.8,
                                ),
                                itemBuilder: (BuildContext context, int index) {
                                  return ProductCard(
                                    imagePath:
                                        'https://via.placeholder.com/165x110',
                                    title: 'Judul Jasa $index',
                                    price: 12000,
                                    rating: (index % 5) + 1,
                                  );
                                },
                              );
                            } else if (controller.selectedIndex == 2) {
                              return GridView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: 10,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 8,
                                  mainAxisSpacing: 8,
                                  childAspectRatio: 0.8,
                                ),
                                itemBuilder: (BuildContext context, int index) {
                                  return ProductCard(
                                    imagePath:
                                        'https://via.placeholder.com/165x110',
                                    title: 'Judul Produk $index',
                                    price: 12000,
                                    rating: (index % 5) + 1,
                                  );
                                },
                              );
                            } else {
                              return GridView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: 10,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 8,
                                  mainAxisSpacing: 8,
                                  childAspectRatio: 0.8,
                                ),
                                itemBuilder: (BuildContext context, int index) {
                                  return ProductCard(
                                    imagePath:
                                        'https://via.placeholder.com/165x110',
                                    title:
                                        'Product awdmidjnmaiud dhuawnduawndad ahuwduawydhaydh uahdnuawnduawyd $index',
                                    price: 12000,
                                    rating: (index % 5) + 1,
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
    );
  }
}
