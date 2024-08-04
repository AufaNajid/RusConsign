// ignore_for_file: avoid_print, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:rusconsign/Page/detailPage/detail_page_controller.dart';
import 'package:rusconsign/Page/detailPage/widgets/comment_card.dart';
import 'package:rusconsign/utils/colors.dart';
import 'package:rusconsign/utils/commonWidget/common_appbar.dart';
import 'package:rusconsign/utils/extension.dart';
import 'package:rusconsign/utils/money_format.dart';
import 'package:rusconsign/utils/text_style.dart';
import '../../utils/app_responsive.dart';

class DetailPage extends GetView<DetailPageController> {
  DetailPage({Key? key, this.idProduct}) : super(key: key);
  int? idProduct;

  @override
  Widget build(BuildContext context) {
    const imageUrl = "https://rusconsign.com/api";
    return Scaffold(
      appBar: CommonAppBar(title: 'detailProduk'.tr, route: () { Get.back(); },),
      backgroundColor: AppColors.background,
      body: controller.obx(
        (state) => SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                "$imageUrl${state!.barang.imageBarang}",
                fit: BoxFit.cover,
                height: AppResponsive().screenHeight(context) * 0.35,
                width: double.infinity,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: AppResponsive().screenWidth(context) * 0.2,
                              height: 30,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(4),
                                child: Material(
                                  color: AppColors.button1,
                                  child: Center(
                                    child: Text(
                                      'produk'.tr,
                                      style: AppTextStyle().descriptionBold(
                                          AppColors.textButton1),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              '20 ${'terjual'.tr}',
                              style: AppTextStyle()
                                  .descriptionBold(AppColors.description),
                            )
                          ].withSpaceBetween(width: 10),
                        ),
                        const Spacer(),
                        SizedBox(
                          width: 40,
                          height: 40,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(6),
                            child: Material(
                              color: AppColors.cardIconFill,
                              child: Obx(
                                    () => GestureDetector(
                                  onTap: () {
                                    controller.toggleFavorite(state.barang.id);
                                  },
                                  child: Icon(
                                    controller.isFavorite.value
                                        ? Icons.favorite_rounded
                                        : Icons.favorite_border_rounded,
                                    color: controller.isFavorite.value
                                        ? AppColors.hargaStat
                                        : AppColors.borderIcon,
                                    size: 24,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          state.barang.namaBarang,
                          style: AppTextStyle().title(AppColors.titleLine),
                          textAlign: TextAlign.start,
                        ),
                        Text(
                          state.barang.deskripsi,
                          style:
                              AppTextStyle().description(AppColors.description),
                        ),
                      ].withSpaceBetween(height: 10),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          MoneyFormat.format(state.barang.harga),
                          style: AppTextStyle().title(AppColors.hargaStat),
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: AppColors.bintang,
                                  size: 22,
                                ),
                                Icon(
                                  Icons.star_border_rounded,
                                  color: AppColors.borderIcon,
                                  size: 24,
                                ),
                              ],
                            ),
                            Text(
                              state.barang.ratingBarang.toString(),
                              style: AppTextStyle()
                                  .subHeader(AppColors.description),
                            ),
                          ].withSpaceBetween(width: 5),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Divider(
                          color: AppColors.titleLine,
                          thickness: 1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 40,
                              height: 40,
                              child: Column(
                                children: [
                                  ClipOval(
                                    child: Image.network(
                                      'https://via.placeholder.com/40x40',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  state.barang.mitra.namaLengkap,
                                  style: AppTextStyle()
                                      .description(AppColors.titleLine),
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 30,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          Get.toNamed("/chatpage");
                                        },
                                        style: ButtonStyle(
                                          padding:
                                              const MaterialStatePropertyAll(
                                                  EdgeInsets.zero),
                                          elevation:
                                              const MaterialStatePropertyAll(0),
                                          shape: MaterialStatePropertyAll(
                                            RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                          ),
                                          backgroundColor:
                                              MaterialStatePropertyAll(
                                                  AppColors.button2),
                                        ),
                                        child: Text(
                                          'chatPenjual'.tr,
                                          style: AppTextStyle().textInfoBold(
                                              AppColors.textButton2),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 30,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          Get.toNamed('/userprofilepage', arguments: state.barang.mitra.id);
                                        },
                                        style: ButtonStyle(
                                          padding:
                                              const MaterialStatePropertyAll(
                                                  EdgeInsets.zero),
                                          elevation:
                                              const MaterialStatePropertyAll(0),
                                          shape: MaterialStatePropertyAll(
                                            RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                          ),
                                          backgroundColor:
                                              MaterialStatePropertyAll(
                                                  AppColors.button2),
                                        ),
                                        child: Text(
                                          'lihatToko'.tr,
                                          style: AppTextStyle().textInfoBold(
                                              AppColors.textButton2),
                                        ),
                                      ),
                                    ),
                                  ].withSpaceBetween(width: 5),
                                )
                              ],
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 75,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Jumlah Produk".tr,
                                              style: AppTextStyle().textInfo(
                                                  AppColors.titleLine),
                                            ),
                                            const Spacer(),
                                            Text(
                                              state.barang.mitra.jumlahProduct
                                                  .toString(),
                                              style: AppTextStyle()
                                                  .textInfoBold(
                                                      AppColors.hargaStat),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 75,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              'penilaian'.tr,
                                              style: AppTextStyle().textInfo(
                                                  AppColors.titleLine),
                                            ),
                                            const Spacer(),
                                            Text(
                                              state.barang.mitra.penilaian
                                                  .toString(),
                                              style: AppTextStyle()
                                                  .textInfoBold(
                                                      AppColors.hargaStat),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ].withSpaceBetween(height: 20),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 90,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              'jumlahJasa'.tr,
                                              style: AppTextStyle().textInfo(
                                                  AppColors.titleLine),
                                            ),
                                            const Spacer(),
                                            Text(
                                              state.barang.mitra.jumlahJasa
                                                  .toString(),
                                              style: AppTextStyle()
                                                  .textInfoBold(
                                                      AppColors.hargaStat),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 90,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              'pengikut'.tr,
                                              style: AppTextStyle().textInfo(
                                                  AppColors.titleLine),
                                            ),
                                            const Spacer(),
                                            Text(
                                              '287',
                                              style: AppTextStyle()
                                                  .textInfoBold(
                                                      AppColors.hargaStat),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ].withSpaceBetween(height: 20),
                                  ),
                                ],
                              ),
                            ),
                          ].withSpaceBetween(width: 8),
                        ),
                        Divider(
                          color: AppColors.titleLine,
                          thickness: 1,
                        ),
                      ].withSpaceBetween(height: 10),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'penilaianProduk'.tr,
                          style: AppTextStyle().subHeader(AppColors.titleLine),
                        ),
                        const Spacer(),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'ulasan'.tr,
                              style: AppTextStyle()
                                  .description(AppColors.description),
                            ),
                            RatingBar.builder(
                              ignoreGestures: true,
                              unratedColor: AppColors.nonActiveBar,
                              itemSize: 20,
                              maxRating: 5.0,
                              initialRating:
                                  state.barang.ratingBarang.toDouble(),
                              minRating: 0.0,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemBuilder: (context, _) => Stack(
                                alignment: Alignment.center,
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color: AppColors.bintang,
                                    size: 18,
                                  ),
                                  Icon(
                                    Icons.star_border_rounded,
                                    color: AppColors.borderIcon,
                                    size: 20,
                                  ),
                                ],
                              ),
                              onRatingUpdate: (rating) {},
                            ),
                          ].withSpaceBetween(height: 5),
                        )
                      ],
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return CommentCard(
                          imagePath: 'https://via.placeholder.com/40x40',
                          username: 'Muhammad Alfarezi',
                          rating: 4.0,
                          date: DateTime.now(),
                          desc:
                              'mndinadinaidn uwbndbwdnuiwd iwndiwdnw iwdbwd iwdnujwjdb iwdbuiwnduiw ijjdaosfmeai kakwmdiawdjaw dnadaw da wdiknawidaw diandiawdi awdawdada diamnd adnad adawndjawd diandi andjawd',
                          like: 142,
                          disLike: 12,
                          onliked: () {
                            (){};
                          },
                          ondisliked: () {},
                        );
                      },
                    ),
                  ].withSpaceBetween(height: 15),
                ),
              ),
            ].withSpaceBetween(height: 15),
          ),
        ),
      ),
      bottomNavigationBar: controller.obx(
        (state) => SizedBox(
          width: double.infinity,
          height: AppResponsive().screenHeight(context) * 0.08,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 50,
                  height: 50,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Material(
                      color: AppColors.cardIconFill,
                      child: Obx(
                        () => GestureDetector(
                          onTap: () {
                            (){};
                          },
                          child: Icon(
                            controller.isAddCart.value
                                ? BootstrapIcons.cart_check_fill
                                : BootstrapIcons.cart,
                            color: controller.isAddCart.value
                                ? AppColors.hargaStat
                                : AppColors.borderIcon,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                SizedBox(
                  width: AppResponsive().screenWidth(context) * 0.7,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.toNamed('/checkoutpage',
                          arguments: idProduct = state!.barang.id);
                      print("ID Produk adalah $idProduct");
                    },
                    style: ButtonStyle(
                        padding:
                            const MaterialStatePropertyAll(EdgeInsets.zero),
                        elevation: const MaterialStatePropertyAll(0),
                        shape: MaterialStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        backgroundColor:
                            MaterialStatePropertyAll(AppColors.button2)),
                    child: Text(
                      'beliSekarang'.tr,
                      style: AppTextStyle().subHeader(AppColors.textButton2),
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
