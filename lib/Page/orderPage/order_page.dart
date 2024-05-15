import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:rusconsign/Page/orderPage/widgets/finish_card.dart';
import 'package:rusconsign/Page/orderPage/widgets/on_process_card.dart';
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
          'pesananSaya'.tr,
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: Row(
              children: [
                FilterOrderButton(
                  text: 'belumBayar'.tr,
                  icon: FeatherIcons.creditCard,
                  index: 0,
                ),
                const Spacer(),
                FilterOrderButton(
                  text: 'proses'.tr,
                  icon: FeatherIcons.clock,
                  index: 1,
                ),
                const Spacer(),
                FilterOrderButton(
                  text: 'selesai'.tr,
                  icon: FeatherIcons.check,
                  index: 2,
                )
              ],
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
                                imagePath:
                                    'https://via.placeholder.com/100x150',
                                title:
                                    'Jasa Photo individual,potrait photo (Lingkungan RUS)',
                                profileImagePath:
                                    'https://via.placeholder.com/30x30',
                                profileUsername: 'mndinadinadjn',
                                rating: 5.0,
                                totalProductPrice: 100000,
                                paymentMethod: "CODadbubabda ",
                                meetingLocation: "SMK RUS",
                                onCancelProduct: () {},
                              );
                            },
                          );
                        } else if (orderController.selectedIndex == 1) {
                          return ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              return OnProcessCard(
                                imagePath:
                                    'https://via.placeholder.com/100x150',
                                title:
                                    'Gantungan Kunci (Key Chain) Bodadad had adjneka Unik',
                                profileImagePath:
                                    'https://via.placeholder.com/30x30',
                                profileUsername: 'efijwfisi iaduhhdhdia mfef',
                                rating: 4.5,
                                totalProductPrice: 155000,
                                paymentMethod: "Dana",
                                meetingLocation: "Gazebo dekat sekolah",
                                onChatSeller: () {},
                              );
                            },
                          );
                        } else if (orderController.selectedIndex == 2) {
                          return ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              return FinishCard(
                                imagePath:
                                    'https://via.placeholder.com/100x150',
                                title:
                                    'Jasa Pengeditan Vide Tugas, atau video individu di sekitaran RUS',
                                profileImagePath:
                                    'https://via.placeholder.com/30x30',
                                profileUsername: 'edadisi iaduadybad ad daidna',
                                rating: 4.0,
                                totalProductPrice: 155000,
                                paymentMethod: "Gopay",
                                meetingLocation: "Depan Studio RUS",
                                onGiveRating: () {},
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
