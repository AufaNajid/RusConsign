import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:rusconsign/authentication/widget/widget.dart';
import 'package:rusconsign/page/chatPage/widgets/komponen.dart';
import 'package:rusconsign/utils/extension.dart';
import '../../utils/app_responsive.dart';
import '../../utils/colors.dart';

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
              padding: const EdgeInsets.symmetric(horizontal: 13.0)
                  .copyWith(right: 130.0),
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6.0),
                    child: MessageUi(
                        message:
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo ",
                        time: DateTime.now()),
                  );
                },
                itemCount: 5,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 13.0, vertical: 10)
                      .copyWith(bottom: 80)
                      .copyWith(left: 130.0),
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: MessageUi(
                        message:
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo ",
                        time: DateTime.now()),
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
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
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
                icon: const Icon(
                  FeatherIcons.plus,
                  size: 30,
                ),
              ),
              const Expanded(
                  child: MyTextField(
                isObscured: false,
                labelText: "Masukkan Pesan...",
              )),
              GestureDetector(
                onTap: () {},
                child: ClipOval(
                  child: Container(
                    height: AppResponsive().screenHeight(context) * 0.25,
                    width: AppResponsive().screenWidth(context) * 0.15,
                    decoration: const BoxDecoration(color: AppColors.button1),
                    child: const Icon(
                      Icons.send,
                      size: 25,
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
