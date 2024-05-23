import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rusconsign/Page/registerSeller/widgets/picturepicker.dart';
import 'package:rusconsign/page/registerSeller/widgets/customtextfield.dart';
import 'package:rusconsign/utils/app_responsive.dart';
import 'package:rusconsign/utils/colors.dart';
import 'package:rusconsign/utils/commonWidget/common_appbar.dart';
import 'package:rusconsign/utils/text_style.dart';

class RegisterSeller extends StatelessWidget {
  const RegisterSeller({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const RegisterSellerForm();
  }
}

class RegisterSellerForm extends StatelessWidget {
  const RegisterSellerForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        surfaceTintColor: Colors.transparent,
        color: Colors.transparent,
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  Get.toNamed("/waitingadmin");
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.button2,
                  shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                child: Text(
                  "Registrasi",
                  style: AppTextStyle().description(AppColors.background),
                ),
              ),
            ),
          ],
        ),
      ),
      appBar: CommonAppBar(title: 'registerPenjual'.tr),
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15,
        vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Nama Toko",
              style: AppTextStyle().subHeader(AppColors.titleLine)),
              const SizedBox(height: 10,),
              const TextFieldRegisterSeller(hintText: "Masukkan nama toko anda..."),
              const SizedBox(height: 15,),
              Text("Nama Lengkap",
              style: AppTextStyle().subHeader(AppColors.titleLine)),
              const SizedBox(height: 10,),
              const TextFieldRegisterSeller(hintText: "Masukkan nama lengkap anda..."),
              const SizedBox(height: 15,),
              Text("NIS",
              style: AppTextStyle().subHeader(AppColors.titleLine)),
              const SizedBox(height: 10,),
              const TextFieldRegisterSellerNumber(hintText: "Masukkan NIS anda..."),
              const SizedBox(height: 15,),
              Text("Nomor Dompet Digital Aktif (Dana, Gopay atau OVO)",
              style: AppTextStyle().subHeader(AppColors.titleLine)),
              const SizedBox(height: 10,),
              const TextFieldRegisterSellerNumber(hintText: "Masukkan nomor dompet digital anda..."),
              const SizedBox(height: 15,),
              Text(
                "Foto ID Card SMK RUS",
                style: AppTextStyle().subHeader(AppColors.titleLine),
              ),
              SizedBox(
                height: AppResponsive().screenHeight(context) * 0.02,
              ),
              const PicturePicker()
            ],
          ),
        ),
      ),
    );
  }
}

