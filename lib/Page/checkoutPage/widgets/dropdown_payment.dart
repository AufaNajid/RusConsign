import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rusconsign/utils/colors.dart';
import 'package:rusconsign/utils/text_style.dart';

class DropdownPayment extends StatelessWidget {
  const DropdownPayment({super.key});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      backgroundColor: AppColors.cardIconFill,
      collapsedBackgroundColor: AppColors.cardIconFill,
      iconColor: AppColors.nonActiveIcon,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      collapsedShape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      title: Text(
        "QRIS",
        style: AppTextStyle().description(AppColors.description),
      ),
      leading: SvgPicture.asset('assets/images/qris.svg'),
      children: [
        ListTile(
          leading: SvgPicture.asset('assets/images/dana.svg'),
          title: Text(
            "Dana",
            style: AppTextStyle().description(AppColors.titleLine),
          ),
          onTap: () {},
        ),
        ListTile(
          leading: SvgPicture.asset('assets/images/gopay.svg'),
          title: Text(
            "Gopay",
            style: AppTextStyle().description(AppColors.titleLine),
          ),
          onTap: () {},
        ),
        ListTile(
          leading: SvgPicture.asset('assets/images/ovo.svg'),
          title: Text(
            "OVO",
            style: AppTextStyle().description(AppColors.titleLine),
          ),
          onTap: () {},
        ),
        ListTile(
          leading: SvgPicture.asset('assets/images/cod.svg'),
          title: Text(
            "Cash On Delivery (COD)",
            style: AppTextStyle().description(AppColors.titleLine),
          ),
          onTap: () {},
        ),
      ],
    );
  }
}
