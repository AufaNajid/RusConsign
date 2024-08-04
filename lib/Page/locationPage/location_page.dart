import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:rusconsign/Page/locationPage/widgets/location_card.dart';
import 'package:rusconsign/utils/colors.dart';
import 'package:rusconsign/utils/commonWidget/common_appbar.dart';

import '../../utils/text_style.dart';

class LocationPage extends StatelessWidget {
  const LocationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CommonAppBar(title: 'lokasiPertemuan'.tr, route: () { Get.back(); },),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'lokasiBawaan'.tr,
              style: AppTextStyle().header(AppColors.titleLine),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                SizedBox(
                  width: 40,
                  height: 40,
                  child: ClipOval(
                    child: Material(
                      color: AppColors.cardIconFill,
                      child: Icon(
                        FeatherIcons.mapPin,
                        color: AppColors.nonActiveIcon,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'SMK Raden Umar Said',
                        style: AppTextStyle().subHeader(AppColors.description),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Jalan Sukun Raya No.09, Besito Kulon, Besito, Kec. Gebog, Kabupaten Kudus, Jawa Tengah 59333',
                        style: AppTextStyle().textInfo(AppColors.titleLine),
                      ),
                      const SizedBox(height: 5),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    FeatherIcons.check,
                    color: AppColors.activeIcon,
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(AppColors.cardIconFill),
                    side: const MaterialStatePropertyAll(
                      BorderSide(
                          color: AppColors.button1,
                          style: BorderStyle.solid,
                          width: 1),
                    ),
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    fixedSize: const MaterialStatePropertyAll(Size(24, 24)),
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),
            Text(
              'rekomendasiLokasi'.tr,
              style: AppTextStyle().header(AppColors.titleLine),
            ),
            const SizedBox(height: 5),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 4,
              itemBuilder: (context, index) {
                return LocationCard(
                  imagePath: 'https://via.placeholder.com/200x175',
                  title: 'Title lokasi',
                  desc:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sijssed  adipiscing do  aliqua.',
                  onSelected: () {},
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
