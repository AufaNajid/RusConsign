import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:rusconsign/utils/colors.dart';
import 'package:rusconsign/utils/text_style.dart';

class AppBarCart extends StatelessWidget implements PreferredSizeWidget {
  const AppBarCart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.background,
      title: Text(
        'Keranjang'.tr,
        style: AppTextStyle().title(AppColors.titleLine),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            FeatherIcons.trash2,
            color: AppColors.activeIcon,
          ),
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          hoverColor: Colors.transparent,
        ),
        IconButton(
          onPressed: () {
            Get.toNamed("/chatlist");
          },
          icon: Icon(FeatherIcons.messageCircle, color: AppColors.borderIcon),
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          hoverColor: Colors.transparent,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
