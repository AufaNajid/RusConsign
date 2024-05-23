import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:rusconsign/Page/qrisPage/widgets/countdown.dart';
import 'package:rusconsign/utils/colors.dart';
import 'package:rusconsign/utils/extension.dart';
import 'package:rusconsign/utils/text_style.dart';

class PaymentCountdown extends StatelessWidget {
  const PaymentCountdown({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.cardIconFill),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Text(
                  'menungguPembayaran'.tr,
                  style: AppTextStyle().header(AppColors.titleLine),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'descMenungguPembayaran'.tr,
                  style: AppTextStyle().description(AppColors.description),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ].withSpaceBetween(height: 5),
            ),
            const SizedBox(
              height: 10,
            ),
            TimerTest(
              deadline: DateTime.now().add(const Duration(minutes: 10)),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
