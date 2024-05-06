import 'package:flutter/material.dart';
import 'package:rusconsign/favoritePage/widgets/favorite_card.dart';
import 'package:rusconsign/utils/colors.dart';
import 'package:rusconsign/utils/text_style.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: Text(
          "Favorit",
          style: AppTextStyle().title(AppColors.titleLine),
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return FavoriteCard(
              imagePath: 'https://via.placeholder.com/50x50',
              title:
                  'Product uadnadiadiadiwd awujdniandiandadjnwa iadniandandaikd aikujdnaidnad',
              price: 12000,
              rating: (index % 5) + 1,
              profileImagePath: 'https://via.placeholder.com/20x20',
              profileUsername: 'Username Toko',
            );
          },
        ),
      ),
    );
  }
}
