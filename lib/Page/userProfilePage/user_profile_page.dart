import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:rusconsign/Page/userProfilePage/user_profile_controller.dart';
import 'package:rusconsign/Page/userProfilePage/widgets/button_icon_widget.dart';
import 'package:rusconsign/Page/userProfilePage/widgets/filter_button.dart';
import 'package:rusconsign/Page/userProfilePage/widgets/profile_info_card.dart';
import 'package:rusconsign/Page/userProfilePage/widgets/user_product_card.dart';
import 'package:rusconsign/utils/app_responsive.dart';
import 'package:rusconsign/utils/commonWidget/common_appbar.dart';
import 'package:rusconsign/utils/extension.dart';
import '../../utils/colors.dart';
import '../../utils/text_style.dart';

class UserProfilePage extends StatelessWidget {
  final controller = Get.put(UserProfilePageController());
  UserProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const imgProfile = "https://rusconsign.com";

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CommonAppBar(
        title: 'profilPengguna'.tr,
        route: () {
          Get.back();
        },
      ),
      body: Obx(() {
        final mitra = controller.detailMitra.value;
        if (mitra == null) {
          return const Center(
            child: Text("Data Kosong!"),
          );
        }
        return SingleChildScrollView(
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
                                mitra.profileImage == null
                                    ? 'https://ui-avatars.com/api/?name=${mitra.namaToko.toString()}&background=db6767&color=fafafa'
                                    : '$imgProfile${mitra.profileImage.toString().replaceFirst("/storage/profiles/", "/api/storage/public/profiles/")}',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Text(
                            mitra.namaToko,
                            style: AppTextStyle()
                                .title(context, AppColors.titleLine),
                          ),
                          Text(
                            mitra.email,
                            style: AppTextStyle()
                                .description(context, AppColors.description),
                          ),
                        ].withSpaceBetween(height: 10),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // ProfileInfoCard(
                          //   icon: FeatherIcons.userCheck,
                          //   title: 'pengikut'.tr,
                          //   data: mitra.pengikut.toString(),
                          // ),
                          ProfileInfoCard(
                            icon: FeatherIcons.users,
                            title: 'jumlahJasa'.tr,
                            data: mitra.jumlahjasa.toString(),
                          ),
                          ProfileInfoCard(
                            icon: FeatherIcons.box,
                            title: 'jumlahProduk'.tr,
                            data: mitra.jumlahproduct.toString(),
                          ),
                          ProfileInfoCard(
                            icon: FeatherIcons.star,
                            title: 'penilaian'.tr,
                            data: mitra.penilaian.toString(),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          mitra.nama,
                          style: AppTextStyle().descriptionBold(
                            context,
                            AppColors.description,
                          ),
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
                            title: 'Hubungi Penjual'.tr,
                            noWhatsapp: mitra.noWhatsapp,
                          ),
                          // const ButtonFollow(),
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
                        if (controller.productList.isEmpty) {
                          return SizedBox(
                            height:
                                AppResponsive().screenHeight(context) * 0.1,
                            child: Center(
                              child: Text(
                                'belumAdaData'.tr,
                                style: AppTextStyle().subHeader(
                                    context, AppColors.hargaStat),
                              ),
                            ),
                          );
                        } else if (controller.isLoading.value) {
                          return Column(
                            children: [
                              SizedBox(
                                height:
                                    AppResponsive().screenHeight(context) * 0.4,
                                child: const Center(
                                  child: CircularProgressIndicator(
                                    color: AppColors.hargaStat,
                                  ),
                                ),
                              )
                            ],
                          );
                        } else {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: GridView.builder(
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
                                return UserProductCard(
                                  imagePath:
                                      controller.productList[index].imageBarang,
                                  title: controller.productList[index].namaBarang,
                                  price: controller.productList[index].harga,
                                  rating: controller
                                      .productList[index].ratingBarang
                                      .toDouble(),
                                  productId:
                                      controller.productList[index].idBarang,
                                  status: controller.productList[index].status,
                                );
                              },
                            ),
                          );
                        }
                      },
                    ),
                  ].withSpaceBetween(height: 8),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
