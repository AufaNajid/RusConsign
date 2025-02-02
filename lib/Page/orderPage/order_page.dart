import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rusconsign/Page/orderPage/widgets/cancel_card.dart';
import 'package:rusconsign/Page/orderPage/widgets/finish_card.dart';
import 'package:rusconsign/Page/orderPage/widgets/on_process_card.dart';
import 'package:rusconsign/Page/orderPage/order_page_controller.dart';
import 'package:rusconsign/Page/orderPage/widgets/on_process_payment_card.dart';
import 'package:rusconsign/utils/colors.dart';
import 'package:rusconsign/utils/extension.dart';
import 'package:rusconsign/utils/size_data.dart';
import 'package:rusconsign/utils/text_style.dart';
import 'package:rusconsign/utils/app_responsive.dart';
import 'widgets/filter_order_button.dart';
import 'widgets/not_paid_card.dart';

class OrderPage extends StatelessWidget {
  final OrderPageController orderController = Get.put(OrderPageController());

  OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    const imgProfile = "https://rusconsign.com";

    DateTime futureDate = DateTime.now().add(const Duration(days: 2));

    String dayName = DateFormat('EEEE').format(futureDate);
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            FeatherIcons.chevronLeft,
            color: AppColors.borderIcon,
            size: SizeData.iconSize,
          ),
        ),
        title: Text(
          'pesananSaya'.tr,
          style: AppTextStyle().title(context, AppColors.titleLine),
        ),
        centerTitle: true,
        backgroundColor: AppColors.background,
        surfaceTintColor: AppColors.background,
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                children: [
                  FilterOrderButton(
                    text: 'belumBayar'.tr,
                    icon: FeatherIcons.creditCard,
                    index: 0,
                  ),
                  FilterOrderButton(
                    text: 'proses'.tr,
                    icon: FeatherIcons.clock,
                    index: 1,
                  ),
                  FilterOrderButton(
                    text: 'selesai'.tr,
                    icon: FeatherIcons.check,
                    index: 2,
                  ),
                  FilterOrderButton(
                    text: 'dibatalkan'.tr,
                    icon: FeatherIcons.x,
                    index: 3,
                  ),
                ].withSpaceBetween(width: 10),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 4),
                    Obx(
                      () {
                        if (orderController.isLoading.value) {
                          return Column(
                            children: [
                              SizedBox(
                                height:
                                    AppResponsive().screenHeight(context) * 0.8,
                                child: const Center(
                                  child: CircularProgressIndicator(
                                    color: AppColors.hargaStat,
                                  ),
                                ),
                              )
                            ],
                          );
                        } else if (orderController.productList.isEmpty &&
                            orderController.pesananPaymentList.isEmpty) {
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
                                  width: AppResponsive().screenWidth(context) *
                                      0.1,
                                  height:
                                      AppResponsive().screenHeight(context) *
                                          0.1,
                                ),
                                Text(
                                  'belumAdaPesanan'.tr,
                                  style: AppTextStyle().subHeader(
                                      context, AppColors.description),
                                )
                              ].withSpaceBetween(height: 12),
                            ),
                          );
                        }
                        if (orderController.selectedIndex == 0) {
                          return ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: orderController.productList.length,
                            itemBuilder: (context, index) {
                              final cod = orderController.productList[index];
                              return NotPaidCard(
                                idPesanan: cod.id,
                                imagePath: cod.barang.imageBarang,
                                title: cod.barang.namaBarang,
                                profileImagePath: cod.mitra.profileImage == null
                                    ? 'https://ui-avatars.com/api/?name=${cod.mitra.namaToko}&background=db6767&color=fafafa'
                                    : "$imgProfile${cod.mitra.profileImage.toString().replaceFirst("/storage/profiles/", "/api/storage/public/profiles/")}",
                                profileUsername: cod.mitra.namaToko,
                                rating: cod.barang.ratingBarang.toDouble(),
                                totalProductPrice: int.parse(cod.grandTotal),
                                quantity: cod.quantity,
                                paymentMethod: cod.statusPembayaran,
                                meetingLocation: cod.lokasi.namaLokasi,
                                onCancelProduct: () {},
                                idBarang: cod.barang.id,
                              );
                            },
                          );
                        } else if (orderController.selectedIndex == 1) {
                          return Column(
                            children: [
                              ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: orderController.productList.length,
                                itemBuilder: (context, index) {
                                  final cod =
                                      orderController.productList[index];
                                  return OnProcessCard(
                                    idPesanan: cod.id,
                                    imagePath: cod.barang.imageBarang,
                                    title: cod.barang.namaBarang,
                                    profileImagePath: cod.mitra.profileImage ==
                                            null
                                        ? 'https://ui-avatars.com/api/?name=${cod.mitra.namaToko}&background=db6767&color=fafafa'
                                        : "$imgProfile${cod.mitra.profileImage.toString().replaceFirst("/storage/profiles/", "/api/storage/public/profiles/")}",
                                    profileUsername: cod.mitra.namaToko,
                                    rating: cod.barang.ratingBarang.toDouble(),
                                    totalProductPrice:
                                        int.parse(cod.grandTotal),
                                    quantity: cod.quantity,
                                    timeMeeting: dayName,
                                    paymentMethod: cod.statusPembayaran,
                                    meetingLocation: cod.lokasi.namaLokasi,
                                    onChatSeller: () {},
                                    idBarang: cod.barang.id,
                                    noWa: cod.mitra.noWhatsapp,
                                  );
                                },
                              ),
                              ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount:
                                    orderController.pesananPaymentList.length,
                                itemBuilder: (context, index) {
                                  final data =
                                      orderController.pesananPaymentList[index];
                                  return OnProcessPaymentCard(
                                    idPesanan: data.id,
                                    imagePath: data.barang.imageBarang,
                                    title: data.barang.namaBarang,
                                    profileImagePath: data
                                                .barang.mitra.profileImage ==
                                            null
                                        ? 'https://ui-avatars.com/api/?name=${data.barang.mitra.namaToko}&background=db6767&color=fafafa'
                                        : "$imgProfile${data.barang.mitra.profileImage.toString().replaceFirst("/storage/profiles/", "/api/storage/public/profiles/")}",
                                    profileUsername: data.barang.mitra.namaToko,
                                    rating: data.barang.ratingBarang.toDouble(),
                                    totalProductPrice:
                                        int.parse(data.grandTotal),
                                    quantity: data.quantity,
                                    timeMeeting: dayName,
                                    paymentMethod: data.status,
                                    meetingLocation: "Gazebo",
                                    onChatSeller: () {},
                                    idBarang: data.barang.id,
                                    noWa: data.barang.mitra.noWhatsapp,
                                    external: data.externalId,
                                  );
                                },
                              )
                            ],
                          );
                        } else if (orderController.selectedIndex == 2) {
                          return Column(
                            children: [
                              ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: orderController.productList.length,
                                itemBuilder: (context, index) {
                                  final cod =
                                      orderController.productList[index];
                                  return FinishCard(
                                    idBarang: cod.barang.id,
                                    imagePath: cod.barang.imageBarang,
                                    title: cod.barang.namaBarang,
                                    profileImagePath: cod.mitra.profileImage ==
                                            null
                                        ? 'https://ui-avatars.com/api/?name=${cod.mitra.namaToko}&background=db6767&color=fafafa'
                                        : "$imgProfile${cod.mitra.profileImage.toString().replaceFirst("/storage/profiles/", "/api/storage/public/profiles/")}",
                                    profileUsername: cod.mitra.namaLengkap,
                                    rating: cod.barang.ratingBarang.toDouble(),
                                    totalProductPrice:
                                        int.parse(cod.grandTotal),
                                    quantity: cod.quantity,
                                    paymentStatus: cod.statusPembayaran,
                                    meetingLocation: cod.lokasi.namaLokasi,
                                    paymentMethod: "COD",
                                  );
                                },
                              ),
                              ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount:
                                    orderController.pesananPaymentList.length,
                                itemBuilder: (context, index) {
                                  final data =
                                      orderController.pesananPaymentList[index];
                                  return FinishCard(
                                    idBarang: data.barang.id,
                                    imagePath: data.barang.imageBarang,
                                    title: data.barang.namaBarang,
                                    profileImagePath: data
                                                .barang.mitra.profileImage ==
                                            null
                                        ? 'https://ui-avatars.com/api/?name=${data.barang.mitra.namaToko}&background=db6767&color=fafafa'
                                        : "$imgProfile${data.barang.mitra.profileImage.toString().replaceFirst("/storage/profiles/", "/api/storage/public/profiles/")}",
                                    profileUsername: data.barang.mitra.namaToko,
                                    rating: data.barang.ratingBarang.toDouble(),
                                    totalProductPrice:
                                        int.parse(data.grandTotal),
                                    quantity: data.quantity,
                                    paymentStatus: data.status,
                                    meetingLocation: "depan rusmart",
                                    paymentMethod: "E-Money",
                                  );
                                },
                              ),
                            ],
                          );
                        } else if (orderController.selectedIndex == 3) {
                          return ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: orderController.productList.length,
                            itemBuilder: (context, index) {
                              final cod = orderController.productList[index];
                              return OrderCancelCard(
                                imagePath: cod.barang.imageBarang,
                                title: cod.barang.namaBarang,
                                profileImagePath: cod.mitra.profileImage == null
                                    ? 'https://ui-avatars.com/api/?name=${cod.mitra.namaToko}&background=db6767&color=fafafa'
                                    : "$imgProfile${cod.mitra.profileImage.toString().replaceFirst("/storage/profiles/", "/api/storage/public/profiles/")}",
                                profileUsername: cod.mitra.namaLengkap,
                                rating: cod.barang.ratingBarang.toDouble(),
                                totalProductPrice: int.parse(cod.grandTotal),
                                quantity: cod.quantity,
                                paymentMethod: cod.statusPembayaran,
                                meetingLocation: cod.lokasi.namaLokasi,
                                onGiveRating: () {},
                                idBarang: cod.barang.id,
                              );
                            },
                          );
                        }
                        return const SizedBox();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
