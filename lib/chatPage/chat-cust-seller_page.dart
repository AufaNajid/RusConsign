import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:rusconsign/authentication/widget/widget.dart';
import 'package:rusconsign/chatPage/widgets/komponen.dart';
import 'package:rusconsign/utils/extension.dart';
import '../utils/app_responsive.dart';
import '../utils/colors.dart';
import '../utils/text_style.dart';

class ChatPage extends StatelessWidget {
  final List<TextInputFormatter>? inputFormatter;
  final TextInputType? keyboardType;

  const ChatPage({Key? key, this.inputFormatter, this.keyboardType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
                    child: MessageUi(
                        message:
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo ",
                        time: "00.00"),
                  );
                },
                itemCount: 5,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 130.0, right: 10, bottom: 90),
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: MessageUi(
                        message:
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo ",
                        time: "00.00"),
                  );
                },
                itemCount: 5,
              ),
            ),
          ].withSpaceBetween(height: 10),
        ),
      ),
      bottomSheet: Container(
          width: double.infinity,
          height: AppResponsive().screenHeight(context) * 0.090,
          padding: EdgeInsets.only(bottom: 10, top: 10, left: 5, right: 5),
          decoration: BoxDecoration(
            color: AppColors.background,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                spreadRadius: 2,
                blurRadius: 3,
                offset: const Offset(0, -3),
              ),
            ],
          ),
          child: Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  FeatherIcons.plus,
                  size: 30,
                ),
              ),
              Expanded(
                  child: MyTextField(
                isObscured: false,
                labelText: "Masukkan Pesan...",
              )),
              ClipOval(
                child: Container(
                  decoration: BoxDecoration(color: AppColors.button1),
                  padding: EdgeInsets.all(3),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.send,
                      color: AppColors.activeIconType,
                    ),
                  ),
                ),
              )
            ].withSpaceBetween(width: 7),
          )),
    );
  }
}

// TextField(
// style: AppTextStyle().description(AppColors.description),
// decoration: InputDecoration(
// hintStyle: AppTextStyle().description(AppColors.description),
// fillColor: AppColors.cardIconFill,
// filled: true,
// hintText: 'Masukkan Teks...',
// border: OutlineInputBorder(
// borderRadius: BorderRadius.circular(8.0),
// ),
// focusedBorder: const OutlineInputBorder(
// borderSide: BorderSide(color: Color(0xFFFFFFFF)),
// ),
// enabledBorder: const OutlineInputBorder(
// borderSide: BorderSide(color: Color(0xFFFFFFFF)),
// ),
// ),
// ),
