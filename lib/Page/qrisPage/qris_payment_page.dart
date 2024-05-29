import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rusconsign/Page/qrisPage/widgets/payment_countdown.dart';
import 'package:rusconsign/Page/qrisPage/widgets/qr_code.dart';
import 'package:rusconsign/utils/colors.dart';
import 'package:rusconsign/utils/commonWidget/common_appbar.dart';

class QrisPaymentPage extends StatelessWidget {
  const QrisPaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 5), () {
      Get.toNamed("/paymentdone");
    });
    return Scaffold(
      appBar: CommonAppBar(title: 'pembayaranQRIS'.tr),
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const PaymentCountdown(),
              const SizedBox(height: 10),
              QrCode()
            ],
          ),
        ),
      ),
    );
  }
}
