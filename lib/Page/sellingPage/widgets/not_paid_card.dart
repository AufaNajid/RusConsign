import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rusconsign/Page/sellingPage/selling_page_controller.dart';
import 'package:rusconsign/utils/app_responsive.dart';
import 'package:rusconsign/utils/colors.dart';
import 'package:rusconsign/utils/extension.dart';
import 'package:rusconsign/utils/money_format.dart';
import 'package:rusconsign/utils/text_style.dart';

class NotPaidCardSelling extends StatelessWidget {
  final String imagePath;
  final String title;
  final String metodePembayaran;
  final String lokasiPertemuan;
  final double rating;
  final int price;
  final int quantity;
  final String pemesan;
  final int idPesanan;

  const NotPaidCardSelling({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.pemesan,
    required this.metodePembayaran,
    required this.lokasiPertemuan,
    required this.rating,
    required this.price,
    required this.idPesanan,
    required this.quantity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SellingPageController controller = Get.put(SellingPageController());
    const imageUrl = "https://rusconsign.com/api/storage/public";
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cardIconFill,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
            Card(
              elevation: 0,
              margin: const EdgeInsets.symmetric(vertical: 0),
              color: AppColors.cardProdukTidakDipilih,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
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
                            style: AppTextStyle()
                                .descriptionBold(context, AppColors.titleLine),
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
                                rating.toString(),
                                style: AppTextStyle()
                                    .textInfoBold(context, AppColors.description),
                              ),
                            ].withSpaceBetween(width: 6),
                          ),
                          Row(
                            children: [
                              Text(
                                '${'total'.tr} :',
                                style: AppTextStyle()
                                    .textInfo(context, AppColors.description),
                              ),
                              Text(
                                MoneyFormat.format(price),
                                style: AppTextStyle()
                                    .textInfoBold(context, AppColors.hargaStat),
                              ),
                            ].withSpaceBetween(width: 4),
                          ),
                          Row(
                            children: [
                              Text(
                                '${'Quantity'.tr} :',
                                style: AppTextStyle()
                                    .textInfo(context, AppColors.description),
                              ),
                              Text(
                                quantity.toString(),
                                style: AppTextStyle()
                                    .textInfoBold(context, AppColors.hargaStat),
                              ),
                            ].withSpaceBetween(width: 4),
                          ),
                          Row(
                            children: [
                              Text(
                                'metodePembayaran'.tr,
                                style: AppTextStyle()
                                    .textInfo(context, AppColors.description),
                              ),
                              Text(
                                metodePembayaran,
                                style: AppTextStyle()
                                    .textInfoBold(context, AppColors.hargaStat),
                              ),
                            ].withSpaceBetween(width: 4),
                          ),
                          Row(
                            children: [
                              Text(
                                'Pesanan Oleh'.tr,
                                style: AppTextStyle()
                                    .textInfo(context, AppColors.description),
                              ),
                              Text(
                                pemesan,
                                style: AppTextStyle()
                                    .textInfoBold(context, AppColors.hargaStat),
                              ),
                            ].withSpaceBetween(width: 4),
                          ),
                          Row(
                            children: [
                              Text(
                                'lokasiPertemuan'.tr,
                                style: AppTextStyle()
                                    .textInfo(context, AppColors.description),
                              ),
                              Text(
                                lokasiPertemuan,
                                style: AppTextStyle()
                                    .textInfoBold(context, AppColors.hargaStat),
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
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.button2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    elevation: 0,
                  ),
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
                              style: AppTextStyle().title(context, AppColors.titleLine),
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
                                  style: AppTextStyle()
                                      .subHeader(context, AppColors.hargaStat),
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
                                  await controller.updateProgress(idPesanan);
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        });
                  },
                  child: Text(
                    'Proses Pesanan'.tr,
                    style: AppTextStyle().header(context, AppColors.textButton2),
                  )),
            )
          ].withSpaceBetween(height: 10),
        ),
      ),
    );
  }
}
