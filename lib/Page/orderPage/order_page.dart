import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:rusconsign/page/orderPage/order_page_controller.dart';
import 'package:rusconsign/utils/colors.dart';
import 'package:rusconsign/utils/text_style.dart';

import 'widgets/filter_order_button.dart';
import 'widgets/not_paid_card.dart';

class OrderPage extends StatelessWidget {
  final orderController = Get.put(OrderPageController());
  OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            FeatherIcons.chevronLeft,
            color: AppColors.borderIcon,
          ),
        ),
        title: Text(
          "Pesanan Saya",
          style: AppTextStyle().title(AppColors.titleLine),
        ),
        centerTitle: true,
        backgroundColor: AppColors.background,
        surfaceTintColor: AppColors.background,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                FeatherIcons.messageCircle,
                color: AppColors.borderIcon,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  FilterOrderButton(
                    text: 'Belum Bayar',
                    icon: FeatherIcons.creditCard,
                    index: 0,
                  ),
                  Spacer(),
                  FilterOrderButton(
                    text: 'Proses',
                    icon: FeatherIcons.clock,
                    index: 1,
                  ),
                  Spacer(),
                  FilterOrderButton(
                    text: 'Selesai',
                    icon: FeatherIcons.check,
                    index: 2,
                  )
                ],
              ),
              const SizedBox(height: 4),
              Obx(
                () {
                  if (orderController.selectedIndex == 0) {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return NotPaidCard(
                          imagePath: 'https://via.placeholder.com/100x150',
                          title: 'Jasa Photo individual,potrait photo(Lingkungan RUS)',
                          profileImagePath: 'https://via.placeholder.com/30x30',
                          profileUsername:
                              'mndinadinaidnikakwmdiawdjaw',
                          rating: 5.0,
                          totalProductPrice: 100000,
                          paymentMethod: "COD",
                          meetingLocation: "SMK RUS",
                          onCancelProduct: () {},
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
    );
  }
}
