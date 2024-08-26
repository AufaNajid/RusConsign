import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:rusconsign/utils/colors.dart';
import 'package:rusconsign/utils/size_data.dart';
import 'package:rusconsign/utils/text_style.dart';

class AppBarCart extends StatelessWidget implements PreferredSizeWidget {
  const AppBarCart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: null,
      surfaceTintColor: AppColors.background,
      backgroundColor: AppColors.background,
      title: Text(
        'keranjang'.tr,
        style: AppTextStyle().title(context, AppColors.titleLine),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            size: SizeData.iconSize,
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
          icon: Icon(
            size: SizeData.iconSize,
            FeatherIcons.messageCircle,
            color: AppColors.borderIcon,
          ),
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
