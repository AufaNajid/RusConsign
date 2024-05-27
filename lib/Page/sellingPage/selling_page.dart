import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:rusconsign/Page/sellingPage/selling_page_controller.dart';
import 'package:rusconsign/Page/sellingPage/widgets/not_paid_card.dart';
import 'package:rusconsign/Page/sellingPage/widgets/selling_appbar.dart';
import 'package:rusconsign/Page/sellingPage/widgets/selling_filter_button.dart';
import 'package:rusconsign/utils/colors.dart';
import 'package:rusconsign/utils/extension.dart';

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
                          text: 'proses'.tr, icon: FeatherIcons.clock, index: 1),
                      SellingFilterButton(
                          text: 'selesai'.tr, icon: FeatherIcons.check, index: 2),
                      SellingFilterButton(
                          text: 'ulasan'.tr, icon: FeatherIcons.star, index: 3),
                      SellingFilterButton(
                          text: 'batal'.tr, icon: FeatherIcons.x, index: 4),
                    ].withSpaceBetween(width: 10),
                  ),
                ),
            //     NotPaidCardSelling(
            //   imagePath: 'https://via.placeholder.com/100x100',
            //   title: 'dadadwndandadjad',
            //   profileImagePath: 'https://via.placeholder.com/40x40',
            //   profileName: 'bagas Prasetyo',
            //   rating: 5.0,
            //   price: 15000,
            //   quantity: 2,
            // ),
                
               Obx(() {
              if (controller.selectedIndex == 0) {
                return ListView.separated(
                padding: EdgeInsets.symmetric(vertical: 10),
                shrinkWrap: true,
                itemCount: 10,
                 separatorBuilder: (BuildContext context, int index) {
                return SizedBox(height: 10); // Atur jarak sesuai kebutuhan Anda
              },
                 itemBuilder: (BuildContext context, int index) {
                  return             NotPaidCardSelling(
              imagePath: 'https://via.placeholder.com/100x100',
              title: 'dadadwndandadjad',
              metodePembayaran: "COD",
              lokasiPertemuan: "Basina Food",
              rating: 5.0,
              price: 15000,
              quantity: 2,
            );
              });
              } else {
                return Center(
                  child: Text('Halaman belum diimplementasikan'),
                );
              }
            }),
            
              ],
            ),
          ),
        ));
  }
}
