import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rusconsign/Page/editdataproductPage/widgets/imageedit.dart';
import 'package:rusconsign/utils/colors.dart';
import 'package:rusconsign/utils/commonWidget/common_appbar.dart';

class EditDataProduct extends StatelessWidget {
  const EditDataProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: 'editData'.tr),
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          ImageEdit()
        ],
      ),
    );
  }
}