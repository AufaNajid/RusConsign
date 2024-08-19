import 'package:flutter/cupertino.dart';
import 'package:rusconsign/utils/app_responsive.dart';
import '../../utils/colors.dart';
import '../../utils/text_style.dart';

class MessageUi extends StatelessWidget {
  final String message;
  final DateTime time;
  final bool sender;
  const MessageUi(
      {Key? key,
      required this.message,
      required this.time,
      required this.sender})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          sender ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Container(
            constraints: BoxConstraints(
                maxWidth: AppResponsive().screenWidth(context) * 0.7),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
                color: AppColors.cardIconFill,
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  message,
                  style: AppTextStyle().description(context, AppColors.description),
                ),
                Text(
                  time.toString().substring(11, 16),
                  style: AppTextStyle().textInfoBold(context, AppColors.description),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
