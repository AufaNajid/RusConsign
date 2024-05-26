import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rusconsign/Page/addItemPage/add_item_form_controller.dart';
import 'package:rusconsign/Page/addItemPage/widgets/add_image_product.dart';
import 'package:rusconsign/Page/addItemPage/widgets/category_button.dart';
import 'package:rusconsign/utils/colors.dart';
import 'package:rusconsign/utils/commonWidget/common_appbar.dart';

class AddItemForm extends StatelessWidget {
  final controller = Get.put(AddItemFormController());

  AddItemForm({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: 'buatBaru'.tr),
      backgroundColor: AppColors.background,
      body: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CategoryButton(
              index: 0,
              text: 'produk',
            ),
            CategoryButton(
              index: 1,
              text: 'jasa',
            ),
            AddImageProduct()
          ],
        ),
      ),
    );
  }
}
