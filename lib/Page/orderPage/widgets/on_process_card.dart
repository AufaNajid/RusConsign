import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rusconsign/Page/orderPage/order_page_controller.dart';
import 'package:rusconsign/utils/app_responsive.dart';
import 'package:rusconsign/utils/colors.dart';
import 'package:rusconsign/utils/extension.dart';
import 'package:rusconsign/utils/money_format.dart';

import '../../../utils/text_style.dart';

class OnProcessCard extends StatelessWidget {
  final int idPesanan;
  final int idBarang;
  final String imagePath;
  final String title;
  final String profileImagePath;
  final String profileUsername;
  final double rating;
  final int totalProductPrice;
  final int quantity;
  final String timeMeeting;
  final String paymentMethod;
  final String meetingLocation;
  final VoidCallback onChatSeller;

  const OnProcessCard({
    Key? key,
    required this.imagePath,
    required this.idPesanan,
    required this.title,
    required this.profileImagePath,
    required this.profileUsername,
    required this.rating,
    required this.totalProductPrice,
    required this.paymentMethod,
    required this.meetingLocation,
    required this.onChatSeller,
    required this.quantity,
    required this.timeMeeting, required this.idBarang,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final OrderPageController orderController = Get.put(OrderPageController());
    const img = "https://rusconsign.com/api";
    const imageUrl = "https://rusconsign.com/api/storage/public";
    return SizedBox(
      width: double.infinity,
      child: Card(
        elevation: 0,
        color: AppColors.cardIconFill,
        margin: const EdgeInsets.symmetric(vertical: 6),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: GestureDetector(
          onTap: () {
            Get.toNamed("/detailpage", arguments: idBarang);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 12,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Card(
                    elevation: 0,
                    margin: const EdgeInsets.symmetric(vertical: 0),
                    color: AppColors.cardProdukTidakDipilih,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 12,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: AppResponsive().screenWidth(context) * 0.240,
                            height: 150,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                "$imageUrl${imagePath.replaceFirst("storage/", "")}",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  title,
                                  style: AppTextStyle().descriptionBold(
                                      context, AppColors.titleLine),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 25,
                                      width: 25,
                                      child: ClipOval(
                                        child: Image.network(
                                          "$img$profileImagePath",
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            profileUsername,
                                            style: AppTextStyle().textInfo(
                                                context, AppColors.description),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ].withSpaceBetween(width: 6),
                                ),
                                Row(
                                  children: [
                                    Stack(
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
                                    Text(
                                      '$rating',
                                      style: AppTextStyle().textInfoBold(
                                          context, AppColors.description),
                                    ),
                                  ].withSpaceBetween(width: 6),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      '${'total'.tr} :',
                                      style: AppTextStyle().textInfo(
                                          context, AppColors.description),
                                    ),
                                    Text(
                                      MoneyFormat.format(totalProductPrice),
                                      style: AppTextStyle().textInfoBold(
                                          context, AppColors.hargaStat),
                                    ),
                                  ].withSpaceBetween(width: 4),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      '${'Quantity'.tr} :',
                                      style: AppTextStyle().textInfo(
                                          context, AppColors.description),
                                    ),
                                    Text(
                                      quantity.toString(),
                                      style: AppTextStyle().textInfoBold(
                                          context, AppColors.hargaStat),
                                    ),
                                  ].withSpaceBetween(width: 4),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      '${'metodePembayaran'.tr} :',
                                      style: AppTextStyle().textInfo(
                                          context, AppColors.description),
                                    ),
                                    Text(
                                      paymentMethod,
                                      style: AppTextStyle().textInfoBold(
                                          context, AppColors.hargaStat),
                                    ),
                                  ].withSpaceBetween(width: 4),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${'lokasiPertemuan'.tr} :',
                                      style: AppTextStyle().textInfo(
                                          context, AppColors.description),
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            meetingLocation,
                                            style: AppTextStyle().textInfoBold(
                                                context, AppColors.hargaStat),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ].withSpaceBetween(width: 4),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${'Waktu Pertemuan'.tr} :',
                                      style: AppTextStyle().textInfo(
                                          context, AppColors.description),
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            timeMeeting,
                                            style: AppTextStyle().textInfoBold(
                                                context, AppColors.hargaStat),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ].withSpaceBetween(width: 4),
                                ),
                              ].withSpaceBetween(height: 6),
                            ),
                          ),
                        ].withSpaceBetween(width: 8),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: AppResponsive().screenWidth(context) * 0.080,
                  child: ElevatedButton(
                    onPressed: () {
                      onChatSeller;
                    },
                    style: ButtonStyle(
                      elevation: const MaterialStatePropertyAll(0),
                      padding: const MaterialStatePropertyAll(EdgeInsets.zero),
                      shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      backgroundColor:
                          MaterialStatePropertyAll(AppColors.button2),
                    ),
                    child: Text(
                      'chatPenjual'.tr,
                      style:
                          AppTextStyle().header(context, AppColors.textButton2),
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: AppResponsive().screenWidth(context) * 0.080,
                  child: ElevatedButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6)),
                              backgroundColor: AppColors.background,
                              title: Text(
                                'Konfirmasi Proses Pesanan?'.tr,
                                style: AppTextStyle()
                                    .title(context, AppColors.titleLine),
                              ),
                              content: Text(
                                  'Apakah Anda Yakin Ingin Mem-Proses Pesanan Ini?'
                                      .tr),
                              actions: <Widget>[
                                OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                      side: const BorderSide(
                                          color: AppColors.button1),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4))),
                                  child: Text(
                                    'batal'.tr,
                                    style: AppTextStyle().subHeader(
                                        context, AppColors.hargaStat),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                                TextButton(
                                  style: TextButton.styleFrom(
                                    foregroundColor: AppColors.solidWhite,
                                    backgroundColor: AppColors.button1,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                  ),
                                  child: Text('Ya, Proses'.tr),
                                  onPressed: () async {
                                    await orderController
                                        .updateComplete(idPesanan);
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          });
                    },
                    style: ButtonStyle(
                      elevation: const MaterialStatePropertyAll(0),
                      padding: const MaterialStatePropertyAll(EdgeInsets.zero),
                      shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      backgroundColor:
                          MaterialStatePropertyAll(AppColors.button2),
                    ),
                    child: Text(
                      'Pesanan Diterima'.tr,
                      style:
                          AppTextStyle().header(context, AppColors.textButton2),
                    ),
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
