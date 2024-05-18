import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:rusconsign/Page/chatPage/widgets/chat_item.dart';
import 'package:rusconsign/utils/text_style.dart';
import '../../utils/colors.dart';

class ChatListPage extends StatelessWidget {
  const ChatListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        surfaceTintColor: AppColors.background,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            FeatherIcons.chevronLeft,
            color: AppColors.borderIcon,
          ),
        ),
        title: Text(
          'chat'.tr,
          style: AppTextStyle().title(AppColors.titleLine),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return ChatItem(
              imagePath: 'https://via.placeholder.com/50x50',
              name: 'Bagas Prasetyo',
              message:
                  'fafnjijeid iefisnfsf infnisnfisfdadhuand uanduianduad uanduianduand iadnianjdianda okggomfa d isenfisnf',
              time: DateTime.now(),
            );
          },
          itemCount: 12,
          separatorBuilder: (BuildContext context, int index) {
            return const Divider(
              color: AppColors.cardIconFill,
            );
          },
        ),
      ),
    );
  }
}
