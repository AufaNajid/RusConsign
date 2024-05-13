import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rusconsign/Page/qrisPage/widgets/appbar.dart';
import 'package:rusconsign/Page/qrisPage/widgets/payment_countdown.dart';
import 'package:rusconsign/Page/qrisPage/widgets/qr_code.dart';
import 'package:rusconsign/utils/app_responsive.dart';
import 'package:rusconsign/utils/colors.dart';

class QrisPaymentPage extends StatelessWidget {
  const QrisPaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarQrisPayment(title: "Pembayaran QRIS"),
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          PaymentCountdown(),
          SizedBox(height: AppResponsive().screenHeight(context)*0.20,),
          QrCode()
        ],
      ),
    );
  }
}