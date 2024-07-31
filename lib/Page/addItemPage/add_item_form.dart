// ignore_for_file: unnecessary_null_comparison

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rusconsign/Page/addItemPage/add_item_form_controller.dart';
import 'package:rusconsign/Page/addItemPage/contoller/controller_pick_image.dart';
import 'package:rusconsign/Page/addItemPage/widgets/add_image_product.dart';
import 'package:rusconsign/Page/addItemPage/widgets/category_button.dart';
import 'package:rusconsign/Page/addItemPage/widgets/textfield.dart';
import 'package:rusconsign/utils/app_responsive.dart';
import 'package:rusconsign/utils/colors.dart';
import 'package:rusconsign/utils/commonWidget/common_appbar.dart';
import 'package:rusconsign/utils/extension.dart';
import 'package:rusconsign/utils/text_style.dart';

class AddItemForm extends StatelessWidget {
  final AddItemFormController controller = Get.put(AddItemFormController());
  final PickedImageController controllerImage =
      Get.put(PickedImageController());

  AddItemForm({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: 'buatBaru'.tr),
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: AppResponsive().screenWidth(context) * 0.16,
                    child: Text(
                      'jenis'.tr,
                      style: AppTextStyle().description(AppColors.titleLine),
                    ),
                  ),
                  Row(
                    children: [
                      const CategoryButton(
                        index: 1,
                        text: 'produk',
                      ),
                      const CategoryButton(
                        index: 2,
                        text: 'jasa',
                      ),
                    ].withSpaceBetween(width: 10),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: AppResponsive().screenWidth(context) * 0.16,
                    child: Text(
                      'foto'.tr,
                      style: AppTextStyle().description(AppColors.titleLine),
                    ),
                  ),
                  const AddImageProduct(),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: AppResponsive().screenWidth(context) * 0.16,
                    child: Text(
                      'nama'.tr,
                      style: AppTextStyle().description(AppColors.titleLine),
                    ),
                  ),
                  Expanded(
                    child: TextFieldAddItem(
                      hintText: 'inputNamaPJ'.tr,
                      controller: controller.namaproductController,
                      maxlines: 1,
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: AppResponsive().screenWidth(context) * 0.16,
                    child: Text(
                      'deskripsi'.tr,
                      style: AppTextStyle().description(AppColors.titleLine),
                    ),
                  ),
                  Expanded(
                    child: TextFieldAddItem(
                      hintText: 'inputDeskripsi'.tr,
                      controller: controller.deskripsiController,
                      maxlines: 6,
                    ),
                  ),
                ],
              ),
              Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                SizedBox(
                  width: AppResponsive().screenWidth(context) * 0.16,
                  child: Text(
                    'harga'.tr,
                    style: AppTextStyle().description(AppColors.titleLine),
                  ),
                ),
                Expanded(
                    child: TextFieldAddItemNumber(
                  hintText: 'inputHarga'.tr,
                  controller: controller.hargaController,
                )),
              ])
            ].withSpaceBetween(height: 15),
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
                  File? imageProduct = controllerImage.pickedImage.value;
                  String namaProduk = controller.namaproductController.text;
                  String deskripsi = controller.deskripsiController.text;
                  String harga = controller.hargaController.text;
                  if (imageProduct != null &&
                      namaProduk.isNotEmpty &&
                      deskripsi.isNotEmpty &&
                      harga.isNotEmpty) {
                    await controller.addProduct(
                      imageProduct,
                      namaProduk,
                      deskripsi,
                      harga,
                    );
                    if (controller.successfulAddProduct.value == true) {
                      Get.offNamed("/menu");
                    } else {
                      Get.snackbar("Eror", controller.message.value);
                    }
                  } else {
                    Get.snackbar("Error", "Please fill all fields",
                        snackPosition: SnackPosition.BOTTOM);
                  }
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.button2,
                    shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(2))),
                child: Text(
                  'buat'.tr,
                  style: AppTextStyle().description(AppColors.background),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
