import 'package:flutter/material.dart';
import 'package:rusconsign/registerSeller/widgets/appbar.dart';
import 'package:rusconsign/utils/colors.dart';
import 'package:rusconsign/utils/text_style.dart';

class RegisterSeller extends StatelessWidget {
  const RegisterSeller({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarRegisterSeller(title: "Register Penjual"),
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              "Nama Lengkap",
              style: AppTextStyle().subHeader(AppColors.titleLine),
            ),
            
          ],
        ),
      ),
    );
  }
}
