import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rusconsign/utils/colors.dart';
import 'package:rusconsign/utils/extension.dart';
import 'package:rusconsign/utils/money_format.dart';
import 'package:rusconsign/utils/text_style.dart';

class PaymentDetail extends StatelessWidget {
  final int subPrice;
  final int adminPrice;

  const PaymentDetail({
    Key? key,
    required this.subPrice,
    required this.adminPrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int totalPrice = subPrice + adminPrice;
    return SizedBox(
      width: double.infinity,
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 0),
        elevation: 0,
        color: AppColors.cardIconFill,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'subtotalProduk'.tr,
                    style: AppTextStyle().description(context, AppColors.description),
                    textAlign: TextAlign.start,
                  ),
                  const Spacer(),
                  Text(
                    MoneyFormat.format(subPrice),
                    style: AppTextStyle().descriptionBold(context, AppColors.hargaStat),
                    textAlign: TextAlign.end,
                  )
                ],
              ),
              Row(
                children: [
                  Text(
                    'biayaAdmin'.tr,
                    style: AppTextStyle().description(context, AppColors.description),
                    textAlign: TextAlign.start,
                  ),
                  const Spacer(),
                  Text(
                    MoneyFormat.format(adminPrice),
                    style: AppTextStyle().descriptionBold(context, AppColors.hargaStat),
                    textAlign: TextAlign.end,
                  )
                ],
              ),
              Divider(thickness: 1, color: AppColors.titleLine),
              Row(
                children: [
                  Text(
                    'total'.tr,
                    style: AppTextStyle().description(context, AppColors.description),
                    textAlign: TextAlign.start,
                  ),
                  const Spacer(),
                  Text(
                    MoneyFormat.format(totalPrice),
                    style: AppTextStyle().header(context, AppColors.hargaStat),
                    textAlign: TextAlign.end,
                  )
                ],
              ),
            ].withSpaceBetween(height: 15),
          ),
        ),
      ),
    );
  }
}
