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
  final RegisterSellerController controllerImage =
      Get.put(RegisterSellerController());
  var pickedImage = Rx<File?>(null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: 'registerPenjual'.tr,
        route: () {
          Get.back();
        },
      ),
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('namaToko'.tr,
                  style:
                      AppTextStyle().subHeader(context, AppColors.titleLine)),
              const SizedBox(height: 10),
              TextFieldRegisterSeller(
                hintText: 'namaTokoHint'.tr,
                controller: controller.namaTokoController,
              ),
              const SizedBox(height: 15),
              Text('namaLengkap'.tr,
                  style:
                      AppTextStyle().subHeader(context, AppColors.titleLine)),
              const SizedBox(height: 10),
              TextFieldRegisterSeller(
                hintText: 'masukkanNamaLengkap'.tr,
                controller: controller.namaController,
              ),
              const SizedBox(height: 15),
              Text('nis'.tr,
                  style:
                      AppTextStyle().subHeader(context, AppColors.titleLine)),
              const SizedBox(height: 10),
              TextFieldRegisterSellerNumber(
                hintText: 'masukkanNIS'.tr,
                controller: controller.nisController,
              ),
              const SizedBox(height: 15),
              Text(
                'nomorDompetDigital'.tr,
                style: AppTextStyle().subHeader(context, AppColors.titleLine),
              ),
              const SizedBox(height: 10),
              TextFieldRegisterSellerNumber(
                hintText: 'masukkanNomorDompetDigital'.tr,
                controller: controller.nomorController,
              ),
              const SizedBox(height: 15),
              Text(
                'nomorWa'.tr,
                style: AppTextStyle().subHeader(context, AppColors.titleLine),
              ),
              const SizedBox(height: 10),
              TextFieldRegisterSellerNumber(
                hintText: 'nomorWaHint'.tr,
                controller: controller.nomroWaController,
              ),
              const SizedBox(height: 15),
              Text(
                'fotoSelfie'.tr,
                style: AppTextStyle().subHeader(context, AppColors.titleLine),
              ),
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
                  String nomorWa = controller.nomroWaController.text;
                  File imageIdCard = controllerImage.pickedImage.value!;

                  if (namaToko.isNotEmpty &&
                      namaLengkap.isNotEmpty &&
                      nis.isNotEmpty &&
                      nomor.isNotEmpty &&
                      nomorWa.isNotEmpty &&
                      imageIdCard != null) {
                    await controller.registerMitra(
                      namaLengkap,
                      namaToko,
                      int.parse(nis),
                      nomor,
                      imageIdCard,
                      nomorWa,
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
                  'registerSekarang'.tr,
                  style: AppTextStyle()
                      .description(context, AppColors.textButton2),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
