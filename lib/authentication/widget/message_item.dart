import 'package:flutter/cupertino.dart';

import '../../utils/colors.dart';
import '../../utils/text_style.dart';

class MessageUi extends StatelessWidget {
  final String message;
  final DateTime time;
  const MessageUi({Key? key, required this.message, required this.time})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
            time.toString().substring(11, 16),
            style: AppTextStyle().textInfoBold(AppColors.description),
          )
        ],
      ),
    );
  }
}