// ignore_for_file: must_be_immutable, unnecessary_null_comparison

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rusconsign/Page/registerSeller/register_seller_controller.dart';
import 'package:rusconsign/Page/registerSeller/widgets/picturepicker.dart';
import 'package:rusconsign/Page/registerSeller/controller/mitra_controller.dart';
import 'package:rusconsign/Page/registerSeller/widgets/customtextfield.dart';
import 'package:rusconsign/utils/app_responsive.dart';
import 'package:rusconsign/utils/colors.dart';
import 'package:rusconsign/utils/commonWidget/common_appbar.dart';
import 'package:rusconsign/utils/text_style.dart';

class RegisterSeller extends StatelessWidget {
  RegisterSeller({Key? key}) : super(key: key);

  final MitraController controller = Get.put(MitraController());
  final RegisterSellerController controllerImage = Get.put(RegisterSellerController());
  final TextEditingController namaController = TextEditingController();
  final TextEditingController namaTokoController = TextEditingController();
  final TextEditingController nisController = TextEditingController();
  final TextEditingController nomorController = TextEditingController();
  var pickedImage = Rx<File?>(null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: 'registerPenjual'.tr),
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Nama Toko", style: AppTextStyle().subHeader(AppColors.titleLine)),
              const SizedBox(height: 10),
              TextFieldRegisterSeller(
                hintText: "Masukkan nama toko anda...",
                controller: controller.namaTokoController,
              ),
              const SizedBox(height: 15),
              Text("Nama Lengkap", style: AppTextStyle().subHeader(AppColors.titleLine)),
              const SizedBox(height: 10),
              TextFieldRegisterSeller(
                hintText: "Masukkan nama lengkap anda...",
                controller: controller.namaController,
              ),
              const SizedBox(height: 15),
              Text("NIS", style: AppTextStyle().subHeader(AppColors.titleLine)),
              const SizedBox(height: 10),
              TextFieldRegisterSellerNumber(
                hintText: "Masukkan NIS anda...",
                controller: controller.nisController,
              ),
              const SizedBox(height: 15),
              Text("Nomor Dompet Digital Aktif (Dana, Gopay atau OVO)",
                  style: AppTextStyle().subHeader(AppColors.titleLine)),
              const SizedBox(height: 10),
              TextFieldRegisterSellerNumber(
                hintText: "Masukkan nomor dompet digital anda...",
                controller: controller.nomorController,
              ),
              const SizedBox(height: 15),
              Text("Foto ID Card SMK RUS",
                  style: AppTextStyle().subHeader(AppColors.titleLine)),
              SizedBox(
                height: AppResponsive().screenHeight(context) * 0.02,
              ),
              const PicturePicker(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        surfaceTintColor: Colors.transparent,
        color: Colors.transparent,
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () async {
                  String namaToko = controller.namaTokoController.text;
                  String namaLengkap = controller.namaController.text;
                  String nis = controller.nisController.text;
                  String nomor = controller.nomorController.text;
                  File imageIdCard = controllerImage.pickedImage.value!;

                  if (namaToko.isNotEmpty &&
                      namaLengkap.isNotEmpty &&
                      nis.isNotEmpty &&
                      nomor.isNotEmpty &&
                      imageIdCard != null) {
                    await controller.registerMitra(
                      namaLengkap,
                      namaToko,
                      int.parse(nis),
                      nomor,
                      imageIdCard,
                    );
                    if (controller.successfulRegister.value == true) {
                      Get.offNamed("/waitingadmin");
                    } else {
                      Get.snackbar('Error', controller.message.value);
                    }
                  } else {
                    Get.snackbar("Error", "Please fill all fields",
                        snackPosition: SnackPosition.BOTTOM);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.button2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: Text(
                  "Registrasi",
                  style: AppTextStyle().description(AppColors.textButton2),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}