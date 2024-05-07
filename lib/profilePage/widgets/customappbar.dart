import 'package:flutter/material.dart';
import 'package:rusconsign/utils/colors.dart';
import 'package:rusconsign/utils/text_style.dart';

class AppBarProfile extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const AppBarProfile({
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title, style: AppTextStyle().title(AppColors.titleLine)),
      centerTitle: true,
      backgroundColor: AppColors.background,
      surfaceTintColor: AppColors.background,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
