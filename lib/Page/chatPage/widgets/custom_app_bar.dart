import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:rusconsign/utils/extension.dart';
import 'package:rusconsign/utils/text_style.dart';
import '../../../utils/colors.dart';

class CustomAppBarChat extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String imagepath;
  final VoidCallback? onBackPressed;

  const CustomAppBarChat({
    required this.title,
    this.onBackPressed,
    Key? key,
    required this.imagepath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.background,
      surfaceTintColor: Colors.white,
      elevation: null,
      leading: IconButton(
        icon: const Icon(FeatherIcons.chevronLeft),
        onPressed: onBackPressed,
        iconSize: 30,
      ),
      title: Row(
        children: [
          ClipOval(
            child: Image.network(
              imagepath,
              width: 40,
              height: 40,
              fit: BoxFit.cover,
            ),
          ),
          Text(title, style: AppTextStyle().header(context, AppColors.titleLine)),
        ].withSpaceBetween(width: 5),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}


