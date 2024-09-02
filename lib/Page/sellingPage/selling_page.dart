import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rusconsign/Page/sellingPage/selling_page_controller.dart';
import 'package:rusconsign/Page/sellingPage/widgets/cancel_selling_card.dart';
import 'package:rusconsign/Page/sellingPage/widgets/not_paid_card.dart';
import 'package:rusconsign/Page/sellingPage/widgets/process_card.dart';
import 'package:rusconsign/Page/sellingPage/widgets/selling_appbar.dart';
import 'package:rusconsign/Page/sellingPage/widgets/selling_filter_button.dart';
import 'package:rusconsign/utils/app_responsive.dart';
import 'package:rusconsign/utils/colors.dart';
import 'package:rusconsign/utils/extension.dart';
import 'package:rusconsign/utils/text_style.dart';

class SellingPage extends StatelessWidget {
  final SellingPageController controller = Get.put(SellingPageController());
  SellingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime futureDate = DateTime.now().add(const Duration(days: 2));

    String dayName = DateFormat('EEEE').format(futureDate);
    return Scaffold(
        appBar: SellingAppbar(title: 'penjualanSaya'.tr),
        backgroundColor: AppColors.background,
        body: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  children: [
                    SellingFilterButton(
                        text: 'belumBayar'.tr,
                        icon: FeatherIcons.creditCard,
                        index: 0),
                    SellingFilterButton(
                        text: 'proses'.tr, icon: FeatherIcons.clock, index: 1),
                    SellingFilterButton(
                        text: 'selesai'.tr, icon: FeatherIcons.check, index: 2),
                    SellingFilterButton(
                        text: 'batal'.tr, icon: FeatherIcons.x, index: 3),
                    // SellingFilterButton(
                    //     text: 'ulasan'.tr, icon: FeatherIcons.star, index: 4),
                  ].withSpaceBetween(width: 10),
                ),
              ),
            ),
            Expanded(
                child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 4,
                    ),
                    Obx(() {
                      if (controller.isLoading.value) {
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
                      } else if (controller.pesananList.isEmpty) {
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
                                width:
                                    AppResponsive().screenWidth(context) * 0.1,
                                height:
                                    AppResponsive().screenHeight(context) * 0.1,
                              ),
                              Text(
                                'belumAdaPesanan'.tr,
                                style: AppTextStyle()
                                    .subHeader(context, AppColors.description),
                              )
                            ],
                          ),
                        );
                      }

                      if (controller.selectedIndex == 0) {
                        return ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          shrinkWrap: true,
                          itemCount: controller.pesananList.length,
                          separatorBuilder: (BuildContext context, int index) {
                            return const SizedBox(height: 10);
                          },
                          itemBuilder: (context, index) {
                            final pesanan = controller.pesananList[index];
                            return NotPaidCardSelling(
                              idPesanan: pesanan.id,
                              quantity: pesanan.quantity,
                              imagePath: pesanan.barang.imageBarang,
                              title: pesanan.barang.namaBarang,
                              metodePembayaran: pesanan.statusPembayaran,
                              lokasiPertemuan: pesanan.lokasi.namaLokasi,
                              rating: pesanan.barang.ratingBarang.toDouble(),
                              price: pesanan.barang.harga,
                              pemesan: pesanan.user.name,
                            );
                          },
                        );
                      } else if (controller.selectedIndex == 1) {
                        return ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          shrinkWrap: true,
                          itemCount: controller.pesananList.length,
                          separatorBuilder: (BuildContext context, int index) {
                            return const SizedBox(height: 10);
                          },
                          itemBuilder: (BuildContext context, int index) {
                            final cod = controller.pesananList[index];
                            return ProcessCardSelling(
                              quantity: cod.quantity,
                              imagePath: cod.barang.imageBarang,
                              title: cod.barang.namaBarang,
                              metodePembayaran: cod.statusPembayaran,
                              lokasiPertemuan: cod.lokasi.namaLokasi,
                              rating: cod.barang.ratingBarang.toDouble(),
                              price: cod.barang.harga,
                              pemesan: cod.user.name,
                              timeMeeting: dayName,
                            );
                          },
                        );
                      } else if (controller.selectedIndex == 2) {
                        return ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          shrinkWrap: true,
                          itemCount: controller.pesananList.length,
                          separatorBuilder: (BuildContext context, int index) {
                            return const SizedBox(height: 10);
                          },
                          itemBuilder: (BuildContext context, int index) {
                            final cod = controller.pesananList[index];
                            return ProcessCardSelling(
                              imagePath: cod.barang.imageBarang,
                              title: cod.barang.namaBarang,
                              metodePembayaran: cod.statusPembayaran,
                              lokasiPertemuan: cod.lokasi.namaLokasi,
                              rating: cod.barang.ratingBarang.toDouble(),
                              price: cod.barang.harga,
                              pemesan: cod.user.name,
                              quantity: cod.quantity,
                              timeMeeting: dayName,
                            );
                          },
                        );
                      } else if (controller.selectedIndex == 3) {
                        return ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          shrinkWrap: true,
                          itemCount: controller.pesananList.length,
                          separatorBuilder: (BuildContext context, int index) {
                            return const SizedBox(height: 10);
                          },
                          itemBuilder: (BuildContext context, int index) {
                            final cod = controller.pesananList[index];
                            return SellingCancelCard(
                              imagePath: cod.barang.imageBarang,
                              title: cod.barang.namaBarang,
                              profileImagePath: cod.mitra.imageProfile,
                              profileUsername: cod.mitra.namaLengkap,
                              rating: cod.barang.ratingBarang.toDouble(),
                              totalProductPrice: cod.barang.harga,
                              quantity: cod.quantity,
                              paymentMethod: cod.statusPembayaran,
                              meetingLocation: cod.lokasi.namaLokasi,
                              onGiveRating: () {}, pembeli: cod.user.name,
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
                                width:
                                    AppResponsive().screenWidth(context) * 0.1,
                                height:
                                    AppResponsive().screenHeight(context) * 0.1,
                              ),
                              Text(
                                'belumAdaPesanan'.tr,
                                style: AppTextStyle()
                                    .subHeader(context, AppColors.description),
                              )
                            ],
                          ),
                        );
                      }
                    })
                  ],
                ),
              ),
            ))
          ],
        ));
  }
}
