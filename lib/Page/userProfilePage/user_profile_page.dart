import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:rusconsign/Page/userProfilePage/user_profile_controller.dart';
import 'package:rusconsign/Page/userProfilePage/widgets/button_follow.dart';
import 'package:rusconsign/Page/userProfilePage/widgets/button_icon_widget.dart';
import 'package:rusconsign/Page/userProfilePage/widgets/filter_button.dart';
import 'package:rusconsign/Page/userProfilePage/widgets/profile_info_card.dart';
import 'package:rusconsign/utils/app_responsive.dart';
import 'package:rusconsign/utils/commonWidget/common_appbar.dart';
import 'package:rusconsign/utils/extension.dart';
import '../../utils/colors.dart';
import '../../utils/text_style.dart';
import '../homePage/widgets/product_card.dart';

class UserProfilePage extends StatelessWidget {
  final controller = Get.put(UserProfilePageController());
  UserProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CommonAppBar(title: 'profilPengguna'.tr),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 90,
                          height: 90,
                          child: ClipOval(
                            child: Image.network(
                              'https://via.placeholder.com/90x90',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Text(
                          'Raihan Maulana',
                          style: AppTextStyle().title(AppColors.titleLine),
                        ),
                        Text(
                          'raihanmaulana084@gmail.com',
                          style:
                              AppTextStyle().description(AppColors.description),
                        ),
                      ].withSpaceBetween(height: 10),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ProfileInfoCard(
                          icon: FeatherIcons.userCheck,
                          title: 'pengikut'.tr,
                          data: '138',
                        ),
                        ProfileInfoCard(
                          icon: FeatherIcons.users,
                          title: 'jumlahJasa'.tr,
                          data: '2',
                        ),
                        ProfileInfoCard(
                          icon: FeatherIcons.box,
                          title: 'jumlahProduk'.tr,
                          data: '5',
                        ),
                        ProfileInfoCard(
                          icon: FeatherIcons.star,
                          title: 'penilaian'.tr,
                          data: '4.5'.toString(),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'afenuihidhiad andiad idanduand oawkdne vknma coijcjcinadin acnincanc inanic iadiand adiandoandiandiand adianndiandianidad iadniandinadina diandiandianda diandiandia',
                        style: AppTextStyle().textInfo(AppColors.description),
                        textAlign: TextAlign.center,
                        maxLines: 5,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ButtonIconWidget(
                          icon: FeatherIcons.messageCircle,
                          title: 'chatPenjual'.tr,
                        ),
                        const ButtonFollow(),
                      ].withSpaceBetween(height: 10),
                    ),
                  ].withSpaceBetween(height: 15),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
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
                                child: Icon(
                                  FeatherIcons.search,
                                  color: AppColors.borderIcon,
                                ),
                              )),
                        ),
                      ),
                    ],
                  ),
                  Obx(
                    () {
                      if (controller.selectedIndex == 1) {
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
                          itemBuilder: (BuildContext context, int index) {
                            return ProductCard(
                              imagePath: controller.productList[index].imageBarang,
                              title: controller.productList[index].namaBarang,
                              price: controller.productList[index].harga,
                              rating: controller.productList[index].ratingBarang.toDouble(),
                              productId: controller.productList[index].idBarang,
                            );
                          },
                        );
                      } else if (controller.selectedIndex == 2) {
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
                          itemBuilder: (BuildContext context, int index) {
                            return ProductCard(
                              imagePath: controller.productList[index].imageBarang,
                              title: controller.productList[index].namaBarang,
                              price: controller.productList[index].harga,
                              rating: controller.productList[index].ratingBarang.toDouble(),
                              productId: controller.productList[index].idBarang,
                            );
                          },
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
                          itemBuilder: (BuildContext context, int index) {
                            return ProductCard(
                              imagePath: controller.productList[index].imageBarang,
                              title: controller.productList[index].namaBarang,
                              price: controller.productList[index].harga,
                              rating: controller.productList[index].ratingBarang.toDouble(),
                              productId: controller.productList[index].idBarang,
                            );
                          },
                        );
                      }
                    },
                  ),
                ].withSpaceBetween(height: 8),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
