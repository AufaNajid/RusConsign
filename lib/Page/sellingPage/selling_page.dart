import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:rusconsign/Page/sellingPage/selling_page_controller.dart';
import 'package:rusconsign/Page/sellingPage/widgets/not_paid_card.dart';
import 'package:rusconsign/Page/sellingPage/widgets/process_card.dart';
import 'package:rusconsign/Page/sellingPage/widgets/review_card.dart';
import 'package:rusconsign/Page/sellingPage/widgets/selling_appbar.dart';
import 'package:rusconsign/Page/sellingPage/widgets/selling_filter_button.dart';
import 'package:rusconsign/utils/app_responsive.dart';
import 'package:rusconsign/utils/colors.dart';
import 'package:rusconsign/utils/extension.dart';
import 'package:rusconsign/utils/text_style.dart';

class SellingPage extends StatelessWidget {
  final controller = Get.put(SellingPageController());
  SellingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: SellingAppbar(title: 'penjualanSaya'.tr),
        backgroundColor: AppColors.background,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      SellingFilterButton(
                          text: 'belumBayar'.tr,
                          icon: FeatherIcons.creditCard,
                          index: 0),
                      SellingFilterButton(
                          text: 'proses'.tr,
                          icon: FeatherIcons.clock,
                          index: 1),
                      SellingFilterButton(
                          text: 'selesai'.tr,
                          icon: FeatherIcons.check,
                          index: 2),
                      SellingFilterButton(
                          text: 'ulasan'.tr, icon: FeatherIcons.star, index: 3),
                      SellingFilterButton(
                          text: 'batal'.tr, icon: FeatherIcons.x, index: 4),
                    ].withSpaceBetween(width: 10),
                  ),
                ),
                Obx(() {
                  if (controller.selectedIndex == 0) {
                    return ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      shrinkWrap: true,
                      itemCount: 10,
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(height: 10);
                      },
                      itemBuilder: (BuildContext context, int index) {
                        return const NotPaidCardSelling(
                          imagePath: 'https://via.placeholder.com/100x100',
                          title: 'belom bayar',
                          metodePembayaran: "COD",
                          lokasiPertemuan: "Basina Food",
                          rating: 5.0,
                          price: 15000,
                        );
                      },
                    );
                  } else if (controller.selectedIndex == 1) {
                    return ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      shrinkWrap: true,
                      itemCount: 10,
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(height: 10);
                      },
                      itemBuilder: (BuildContext context, int index) {
                        return const ProcessCardSelling(
                          imagePath: 'https://via.placeholder.com/100x100',
                          title: 'proses',
                          metodePembayaran: "COD",
                          lokasiPertemuan: "Basina Food",
                          rating: 5.0,
                          price: 15000,
                        );
                      },
                    );
                  } else if (controller.selectedIndex == 2) {
                    return ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      shrinkWrap: true,
                      itemCount: 10,
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(height: 10);
                      },
                      itemBuilder: (BuildContext context, int index) {
                        return const ProcessCardSelling(
                          imagePath: 'https://via.placeholder.com/100x100',
                          title: 'udah bayar',
                          metodePembayaran: "COD",
                          lokasiPertemuan: "Basina Food",
                          rating: 5.0,
                          price: 15000,
                        );
                      },
                    );
                  } else if (controller.selectedIndex == 3) {
                    return ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      shrinkWrap: true,
                      itemCount: 10,
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(height: 10);
                      },
                      itemBuilder: (BuildContext context, int index) {
                        return ReviewCardSelling(
                          imagePath: 'https://via.placeholder.com/100x100',
                          username: "Agus Spakbor",
                          rating: 4.5,
                          date: DateTime.now(),
                          desc:
                              "Ampar ampar sigma, Sigma ku fanum tax Gyatt sebiji Dihurung skibidi Mangga rizzler mangga rizzler Mewing kai cenat Ligma dimakan sussy Apinya gooning mogging",
                          like: 156,
                          disLike: 12,
                        );
                      },
                    );
                  } else {
                    return SizedBox(
                      width: double.infinity,
                      height: AppResponsive().screenHeight(context) * 0.8,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            "assets/images/fluent--box-search-24-regular.svg",
                            // ignore: deprecated_member_use
                            color: AppColors.hargaStat,
                            width: AppResponsive().screenWidth(context) * 0.1,
                            height: AppResponsive().screenHeight(context) * 0.1,
                          ),
                          Text(
                            'belumAdaPesanan'.tr,
                            style:
                                AppTextStyle().subHeader(AppColors.description),
                          )
                        ],
                      ),
                    );
                  }
                })
              ],
            ),
          ),
        ));
  }
}
