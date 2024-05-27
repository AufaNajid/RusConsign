import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:rusconsign/Page/addItemPage/add_item_form_controller.dart';
import 'package:rusconsign/Page/addItemPage/widgets/add_image_product.dart';
import 'package:rusconsign/Page/addItemPage/widgets/category_button.dart';
import 'package:rusconsign/Page/addItemPage/widgets/textfield.dart';
import 'package:rusconsign/utils/colors.dart';
import 'package:rusconsign/utils/commonWidget/common_appbar.dart';
import 'package:rusconsign/utils/extension.dart';
import 'package:rusconsign/utils/text_style.dart';

class AddItemForm extends StatelessWidget {
  final controller = Get.put(AddItemFormController());
  final TextEditingController namaproductController= TextEditingController();
  final TextEditingController deskripsiController= TextEditingController();
  final TextEditingController hargaController= TextEditingController();

  AddItemForm({Key? key}) : super(key: key);
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
                    Get.back();
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
          )),
      appBar: CommonAppBar(title: 'buatBaru'.tr),
      backgroundColor: AppColors.background,
      body:  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text('jenis'.tr ,style: AppTextStyle().description(AppColors.titleLine),),
                  Row(
                    children: [
                      CategoryButton(
                        index: 0,
                        text: 'produk',
                      ),
                      CategoryButton(
                        index: 1,
                        text: 'jasa',
                      ),
                    ].withSpaceBetween(width: 10),
                  ),
                ].withSpaceBetween(width: 50),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('foto'.tr, style: AppTextStyle().description(AppColors.titleLine),),
                  AddImageProduct(),
                ].withSpaceBetween(width: 50),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('nama'.tr, style: AppTextStyle().description(AppColors.titleLine),),
                  Expanded(child: TextFieldAddItem(hintText: 'inputNamaPJ'.tr, controller:namaproductController, maxlines: 1,)),
                ].withSpaceBetween(width: 50),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('deskripsi'.tr, style: AppTextStyle().description(AppColors.titleLine),),
                  Expanded(child: TextFieldAddItem(hintText: 'inputDeskripsi'.tr, controller:deskripsiController, maxlines: 6,)),
                ].withSpaceBetween(width: 23),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('harga'.tr, style: AppTextStyle().description(AppColors.titleLine),),
                  Expanded(child: TextFieldAddItemNumber(hintText: 'inputHarga'.tr, controller:hargaController,)),
                ].withSpaceBetween(width: 50),
              )
            ].withSpaceBetween(height: 15),
          ),
        ),
      ),
    );
  }
}
