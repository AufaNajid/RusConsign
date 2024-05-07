import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:rusconsign/utils/extension.dart';
import 'package:rusconsign/utils/text_style.dart';
import '../../utils/colors.dart';
import '../../utils/app_responsive.dart';

class chatUI extends StatelessWidget {
  final String imagepath;
  final String nama;
  final String chat;
  final String waktu;
  const chatUI(
      {Key? key,
      required this.imagepath,
      required this.nama,
      required this.chat,
      required this.waktu})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed("chatpage");
      },
      child: Container(
        width: double.infinity,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipOval(
              child: Image.network(
                imagepath,
                width: AppResponsive().screenWidth(context) * 0.110,
                height: AppResponsive().screenHeight(context) * 0.060,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    nama,
                    style: AppTextStyle().header(AppColors.titleLine),
                  ),
                  Text(
                    chat,
                    style: AppTextStyle().chat(AppColors.description),
                  )
                ],
              ),
            ),
            Column(
              children: [
                Text(
                  waktu,
                  style: AppTextStyle().subHeader(AppColors.description),
                ),
                ClipOval(
                  child: Container(
                    height: 13,
                    width: 13,
                    decoration: BoxDecoration(color: AppColors.activeIcon),
                  ),
                )
              ].withSpaceBetween(height: 5),
            )
          ].withSpaceBetween(width: 5),
        ),
      ),
    );
  }
}

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
      padding: EdgeInsets.all(10),
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
