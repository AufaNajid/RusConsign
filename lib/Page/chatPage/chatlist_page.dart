import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rusconsign/Page/chatPage/widgets/chat_item.dart';
import 'package:rusconsign/utils/commonWidget/common_appbar.dart';
import '../../utils/colors.dart';

class ChatListPage extends StatelessWidget {
  const ChatListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CommonAppBar(
        title: 'chat'.tr,
        route: () {
          Get.back();
        },
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
            return Divider(
              color: AppColors.cardIconFill,
            );
          },
        ),
      ),
    );
  }
}
