import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rusconsign/Page/discountPage/widgets/discount_card.dart';
import 'package:rusconsign/utils/commonWidget/common_appbar.dart';

import '../../utils/colors.dart';

class DiscountPage extends StatelessWidget {
  const DiscountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CommonAppBar(title: 'produkDiskon'.tr, route: () { Get.back(); },),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return DiscountCard(
                imagePath: 'https://via.placeholder.com/50x50',
                title:
                    'Product uadnadiadiadiwd awujddadnia niandian jdnaidnad',
                price: 100000,
                rating: (index % 5) + 1,
                profileImagePath: 'https://via.placeholder.com/30x30',
                profileUsername: 'Username Toko',
                discountAmount: 50,
              );
            },
          ),
        ),
      ),
    );
  }
}
