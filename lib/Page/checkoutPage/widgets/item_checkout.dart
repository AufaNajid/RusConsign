import 'package:flutter/cupertino.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:rusconsign/utils/app_responsive.dart';
import 'package:rusconsign/utils/colors.dart';
import 'package:rusconsign/utils/text_style.dart';

class ItemChekcout extends StatelessWidget {
  const ItemChekcout({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Gantungan Kunci (Key Chain) Boneka Unik",
        style: AppTextStyle().descriptionBold(AppColors.titleLine),),
        Row(
          children: [Container(
                width: AppResponsive().screenWidth(context)*0.1,
                height: AppResponsive().screenHeight(context)*0.1,
                decoration: const ShapeDecoration(
                  image: DecorationImage(
                    image: NetworkImage("https://via.placeholder.com/165x110"),
                    fit: BoxFit.fill,
                  ),
                  shape: CircleBorder(),
                ),
              ),
              Text("Bagas Prasetyo", style: AppTextStyle().textInfo(AppColors.description),)
              ],),
        Row(
          children: [
            Icon(FeatherIcons.star, color: AppColors.activeIcon, fill: BorderSide.strokeAlignCenter,),
          ],
        )
      ],

    );
  }
}