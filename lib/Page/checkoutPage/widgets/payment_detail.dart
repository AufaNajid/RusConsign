import 'package:flutter/material.dart';
import 'package:rusconsign/utils/app_responsive.dart';
import 'package:rusconsign/utils/colors.dart';
import 'package:rusconsign/utils/text_style.dart';

class PaymentDetail extends StatelessWidget {
  final String subPrice;
  final String adminPrice;
  final String totalPrice;

  const PaymentDetail({
    Key? key,
    required this.subPrice,
    required this.adminPrice,
    required this.totalPrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double subPriceValue = double.parse(subPrice);
    double adminPriceValue = double.parse(adminPrice);
    double totalPriceValue = subPriceValue + adminPriceValue;
    String totalPriceString = totalPriceValue.toStringAsFixed(2).replaceAll(RegExp(r"([.]*00|0)$"), "");

    return Card(
      elevation: 0,
      color: AppColors.cardIconFill,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Subtotal Produk",
                  style: AppTextStyle().description(AppColors.description),
                  textAlign: TextAlign.start,
                ),
                const Spacer(),
                Text(
                  "Rp$subPrice",
                  style: AppTextStyle().descriptionBold(AppColors.hargaStat),
                  textAlign: TextAlign.end,
                )
              ],
            ),
            SizedBox(
              height: AppResponsive().screenHeight(context) * 0.02,
            ),
            Row(
              children: [
                Text(
                  "Biaya Admin",
                  style: AppTextStyle().description(AppColors.description),
                  textAlign: TextAlign.start,
                ),
                const Spacer(),
                Text(
                  "Rp$adminPrice",
                  style: AppTextStyle().descriptionBold(AppColors.hargaStat),
                  textAlign: TextAlign.end,
                )
              ],
            ),
            SizedBox(height: AppResponsive().screenHeight(context) * 0.01),
            const Divider(thickness: 1, color: AppColors.titleLine),
            SizedBox(height: AppResponsive().screenHeight(context) * 0.01),
            Row(
              children: [
                Text(
                  "Total",
                  style: AppTextStyle().description(AppColors.description),
                  textAlign: TextAlign.start,
                ),
                const Spacer(),
                Text(
                  "Rp$totalPriceString",
                  style: AppTextStyle().descriptionBold(AppColors.hargaStat),
                  textAlign: TextAlign.end,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
