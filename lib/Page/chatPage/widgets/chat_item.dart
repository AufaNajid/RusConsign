import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rusconsign/utils/colors.dart';
import 'package:rusconsign/utils/extension.dart';
import 'package:rusconsign/utils/text_style.dart';

class ChatItem extends StatelessWidget {
  final String imagePath;
  final String name;
  final String message;
  final DateTime time;
  const ChatItem({
    super.key,
    required this.imagePath,
    required this.name,
    required this.message,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: GestureDetector(
        onTap: () {
          Get.toNamed('/chatpage');
        },
        child: Card(
          margin: const EdgeInsets.symmetric(vertical: 0),
          elevation: 0,
          color: AppColors.background,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                  width: 50,
                  child: ClipOval(
                    child: Image.network(
                      imagePath,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            style: AppTextStyle().header(context, AppColors.titleLine),
                          ),
                          const Spacer(),
                          Text(
                            time.toString().substring(11, 16),
                            style:
                                AppTextStyle().subHeader(context, AppColors.description),
                          ),
                        ],
                      ),
                      Text(
                        message,
                        style:
                            AppTextStyle().description(context, AppColors.description),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      )
                    ].withSpaceBetween(height: 5),
                  ),
                ),
              ].withSpaceBetween(width: 10),
            ),
          ),
        ),
      ),
    );
  }
}
