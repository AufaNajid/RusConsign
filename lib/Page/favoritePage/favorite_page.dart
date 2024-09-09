import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rusconsign/Page/favoritePage/controller/like_controller.dart';
import 'package:rusconsign/Page/favoritePage/widgets/favorite_card.dart';
import 'package:rusconsign/utils/colors.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rusconsign/utils/app_responsive.dart';
import 'package:rusconsign/utils/extension.dart';
import 'package:rusconsign/utils/text_style.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  Future<void> refreshData() async {
    final LikeController controller = Get.find<LikeController>();
    await controller.fetchFavorite();
  }

  @override
  Widget build(BuildContext context) {
    final LikeController controller = Get.put(LikeController());
    return RefreshIndicator(
      edgeOffset: 10,
      color: AppColors.hargaStat,
      backgroundColor: AppColors.cardIconFill,
      strokeWidth: RefreshProgressIndicator.defaultStrokeWidth,
      onRefresh: () => Future.delayed(const Duration(seconds: 2), refreshData),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColors.background,
          surfaceTintColor: AppColors.background,
          title: Text(
            'favorit'.tr,
            style: AppTextStyle().title(context, AppColors.titleLine),
          ),
        ),
        backgroundColor: AppColors.background,
        body: Obx(() {
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
          } else if (controller.favoriteList.isEmpty) {
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
                itemCount: controller.favoriteList.length,
                itemBuilder: (BuildContext context, int index) {
                  final like = controller.favoriteList[index];
                  final barang = like.barang;
                  final mitra = barang.mitra;
                  const imgProfile = "https://rusconsign.com";
                  return FavoriteCard(
                    imagePath: barang.imageBarang,
                    idBarang: barang.id,
                    title: barang.namaBarang,
                    price: barang.harga,
                    rating: barang.ratingBarang.toDouble(),
                    profileImagePath: mitra.profileImage == null
                        ? "https://ui-avatars.com/api/?name=${mitra.namaLengkap}&background=db6767&color=fafafa"
                        : '$imgProfile${mitra.profileImage.toString().replaceFirst("/storage/profiles/", "/api/storage/public/profiles/")}',
                    profileUsername: mitra.namaLengkap,
                    isFavorite: controller.isItemFavorite(barang.id),
                    onFavoriteToggle: () {
                      controller.toggleFavorite(barang.id);
                    },
                  );
                },
              ),
            );
          }
        }),
      ),
    );
  }
}
