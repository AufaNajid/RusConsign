import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:rusconsign/utils/colors.dart';
import 'package:rusconsign/utils/text_style.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback route;

  const CommonAppBar({
    required this.title,
    Key? key, required this.route,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.background,
      surfaceTintColor: AppColors.background,
      elevation: null,
      leading: IconButton(
        icon: Icon(FeatherIcons.chevronLeft ,color:AppColors.borderIcon  ,),
        onPressed: route,
        iconSize: 24,
      ),
      title: Text(
        title,
        style: AppTextStyle().title(AppColors.titleLine)
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  
}
