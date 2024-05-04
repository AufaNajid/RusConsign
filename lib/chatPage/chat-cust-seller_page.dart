import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rusconsign/chatPage/widgets/komponen.dart';
import 'package:rusconsign/utils/extension.dart';
import 'package:rusconsign/utils/text_style.dart';

import '../utils/colors.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CustomAppBarChat(
        title: "Username User",
        imagepath:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSU5NotY59b9Il4DR4FAUdE6cDxIvYQTHdi2CLPuMmv_Q&s",
        onBackPressed: () {
          Get.back();
        },
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 13.0, right: 130.0),
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: MessageUi(message: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo ", time: "00.00"),
                  );
                },
                itemCount: 5,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 130.0, right: 10),
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: MessageUi(message: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo ", time: "00.00"),
                  );
                },
                itemCount: 5,
              ),
            ),
          ].withSpaceBetween(height: 10),
        ),
      ),
    );
  }
}
