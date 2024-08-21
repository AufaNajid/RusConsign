import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:rusconsign/Page/chatPage/chat_controller.dart';
import 'package:rusconsign/Page/chatPage/widgets/custom_app_bar.dart';
import 'package:rusconsign/Page/chatPage/widgets/textfield_chat.dart';
import 'package:rusconsign/utils/extension.dart';
import 'package:rusconsign/utils/size_data.dart';
import '../../authentication/widget/message_item.dart';
import '../../utils/app_responsive.dart';
import '../../utils/colors.dart';
import '../../utils/text_style.dart';

class ChatPage extends StatelessWidget {
  final List<TextInputFormatter>? inputFormatter;
  final TextInputType? keyboardType;

  const ChatPage({Key? key, this.inputFormatter, this.keyboardType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ChatController controller = Get.put(ChatController());
    bool tes = true;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.background,
      appBar: CustomAppBarChat(
        title: "Username User",
        imagepath: "https://via.placeholder.com/50x50",
        onBackPressed: () {
          Get.back();
        },
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.only(right: 10, left: 10),
              itemBuilder: (BuildContext context, int index) {
                tes = !tes;
                return MessageUi(
                  message:
                      " aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo ",
                  time: DateTime.now(),
                  sender: tes,
                );
              },
              itemCount: 20,
            ),
            Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                    child: Container(
                      constraints: BoxConstraints(
                          maxWidth: AppResponsive().screenWidth(context) * 0.7),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      decoration: BoxDecoration(
                          color: AppColors.cardIconFill,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          controller.pickedImage.value != null
                              ? ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                  child: Image.file(
                                    controller.pickedImage.value!,
                                    fit: BoxFit.cover,
                                  ),
                                )
                              : Text(
                                  "message",
                                  style: AppTextStyle().description(
                                      context, AppColors.description),
                                ),
                          Text(
                            DateTime.now().toString().substring(11, 16),
                            style: AppTextStyle()
                                .textInfoBold(context, AppColors.description),
                          )
                        ].withSpaceBetween(height: 5),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 80,
            )
          ],
        ),
      ),
      bottomSheet: Container(
          width: double.infinity,
          height: AppResponsive().screenWidth(context) * 0.180,
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                onPressed: controller.pickImage,
                icon: const Icon(
                  FeatherIcons.plus,
                  size: SizeData.iconSize + 4,
                ),
              ),
              const Expanded(
                child: TextFieldInputChat(hintText: "Masukkan Pesan"),
              ),
              GestureDetector(
                onTap: () {},
                child: ClipOval(
                  child: Container(
                    height: AppResponsive().screenWidth(context) * 0.12,
                    width: AppResponsive().screenWidth(context) * 0.12,
                    decoration: const BoxDecoration(color: AppColors.button1),
                    child: const Icon(
                      Icons.send,
                      size: SizeData.iconSize,
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
