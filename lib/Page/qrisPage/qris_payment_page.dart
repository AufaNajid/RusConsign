import 'package:flutter/material.dart';
import 'package:rusconsign/Page/qrisPage/widgets/appbar.dart';
import 'package:rusconsign/Page/qrisPage/widgets/payment_countdown.dart';
import 'package:rusconsign/Page/qrisPage/widgets/qr_code.dart';
import 'package:rusconsign/utils/colors.dart';

class QrisPaymentPage extends StatelessWidget {
  const QrisPaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarQrisPayment(title: "Pembayaran QRIS"),
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            const PaymentCountdown(),
            const SizedBox(height: 10),
             QrCode()
          ],
        ),
      ),
    );
  }
}