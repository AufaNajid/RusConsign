import 'package:flutter/widgets.dart';
import 'package:rusconsign/utils/colors.dart';
import 'package:rusconsign/utils/text_style.dart';

class PaymentCountdown extends StatelessWidget {
  const PaymentCountdown({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.cardIconFill
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Menunggu Pembayaran",
          style: AppTextStyle().header(AppColors.titleLine),
          textAlign: TextAlign.center,
          ),
          Text("Selesaikan pembayaran sebelum waktu habis agar pesanan kamu tidak kadaluarsa",
          style: AppTextStyle().description(AppColors.description),
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          ),
          
        ],
      ),
    );
  }
}