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
              width: 30,
              height: 30,
              fit: BoxFit.cover,
            ),
          ),
          Text(title, style: AppTextStyle().header(AppColors.titleLine)),
        ].withSpaceBetween(width: 5),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class MessageUi extends StatelessWidget {
  final String message;
  final DateTime time;
  const MessageUi({Key? key, required this.message, required this.time})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
          color: AppColors.cardIconFill,
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            message,
            style: AppTextStyle().description(AppColors.description),
          ),
          Text(
              time.toString().substring(0, 16),
            style: AppTextStyle().textInfo(AppColors.description),
          )
        ],
      ),
    );
  }
}
