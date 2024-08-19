import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:rusconsign/utils/colors.dart';
import 'package:rusconsign/utils/text_style.dart';

class SellingAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const SellingAppbar({
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.background,
      surfaceTintColor: AppColors.background,
      elevation: null,
      leading: IconButton(
        icon: Icon(FeatherIcons.chevronLeft ,color:AppColors.borderIcon  ,),
        onPressed: () {
          Get.back();
        },
        iconSize: 24,
      ),
      title: Text(
        title,
        style: AppTextStyle().title(context, AppColors.titleLine)
      ),
      centerTitle: true,
      actions: <Widget>[
        IconButton(onPressed: () {
          Get.toNamed("/chatlist");
        }, icon: Icon(FeatherIcons.messageCircle ,color:AppColors.borderIcon))
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  
}
