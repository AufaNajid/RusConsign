import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rusconsign/Page/favoritePage/widgets/favorite_card.dart';
import 'package:rusconsign/utils/colors.dart';
import 'package:rusconsign/utils/text_style.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.background,
        surfaceTintColor: AppColors.background,
        title: Text(
          'favorit'.tr,
          style: AppTextStyle().title(AppColors.titleLine),
        ),
      ),
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return FavoriteCard(
              onDelete: () {},
              imagePath: 'https://fakeimg.pl/50x50?text=Placeholder&font=museo',
              title:
                  'Product uadnadiadiadiwd awujdniandiandadjnwa iadniandandaikd aikujdnaidnad',
              price: 12000,
              rating: (index % 5) + 1,
              profileImagePath: 'https://fakeimg.pl/30x30?text=Placeholder&font=museo',
              profileUsername: 'Username Toko',
            );
          },
        ),
      ),
    );
  }
}
