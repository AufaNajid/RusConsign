import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rusconsign/page/chatPage/widgets/komponen.dart';
import '../detailPage/widgets/komponen.dart';
import '../../utils/colors.dart';

class ChatListPage extends StatelessWidget {
  const ChatListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CustomAppBar(
        title: "Chat",
        onBackPressed: () {
          Get.back();
        },
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return const Padding(
              padding:
                  EdgeInsets.only(bottom: 10.0, left: 7.0, right: 7.0, top: 10),
              child: chatUI(
                  imagepath:
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSU5NotY59b9Il4DR4FAUdE6cDxIvYQTHdi2CLPuMmv_Q&s",
                  nama: "nama",
                  chat:
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec odio. Praesent libero. Sed cursus ante dapibus diam. Sed nisi. Nulla quis sem at nibh elementum imperdiet. Duis sagittis ipsum. Praesent mauris. Fusce nec tellus sed augue semper porta. Mauris massa. Vestibulum lacinia arcu eget nulla. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.",
                  waktu: "00.00"),
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
