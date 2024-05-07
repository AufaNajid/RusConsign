import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rusconsign/detailPage/widgets/komponen.dart';
import 'package:rusconsign/registerSeller/widgets/customtextfield.dart';
import 'package:rusconsign/utils/app_responsive.dart';
import 'package:rusconsign/utils/colors.dart';
import 'package:rusconsign/utils/text_style.dart';

class RegisterSeller extends StatelessWidget {
  const RegisterSeller({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Register Penjualan"),
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Nama Lengkap",
              style: AppTextStyle().subHeader(AppColors.titleLine), 
            ),
            TextFieldRegisterSeller(hintText: "Masukkan nama lengkap anda...",),
            Text(
              "NIS",
              style: AppTextStyle().subHeader(AppColors.titleLine), 
            ),
            TextFieldRegisterSeller(hintText: "Masukkan NIS anda...",),
            Text(
              "Nomor Dompet Digital Aktif (Dana, Gopay atau OVO)",
              style: AppTextStyle().subHeader(AppColors.titleLine), 
            ),
            TextFieldRegisterSeller(hintText: "Masukkan nomor dompet digital anda...",),
            Text(
              "Foto ID Card SMK RUS",
              style: AppTextStyle().subHeader(AppColors.titleLine), 
            ),
            DottedBorder(
              borderType: BorderType.RRect,
              radius: Radius.circular(10),
              strokeCap: StrokeCap.butt,
              strokeWidth: 4,
              color: AppColors.cardIconFill,
              dashPattern: [20,8],
              child:ClipRRect(
    borderRadius: BorderRadius.all(Radius.circular(12)),
    child: SizedBox(
      width: AppResponsive().screenWidth(context)*0.5,
      height: AppResponsive().screenHeight(context)*0.3,
      child: Center(
        child: SvgPicture.asset("assets/images/clarity_picture-line.svg")),
    ),
    ),
  ),
          ],
        ),
      ),
    );
  }
}
