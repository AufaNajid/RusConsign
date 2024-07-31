  import 'package:flutter/material.dart';
  import 'package:get/get.dart';
  import 'package:rusconsign/Page/editdataproductPage/widgets/imageedit.dart';
  import 'package:rusconsign/Page/editdataproductPage/widgets/textfield_edit_data.dart';
  import 'package:rusconsign/Page/editdataproductPage/edit_data_product_controller.dart';
  import 'package:rusconsign/utils/app_responsive.dart';
  import 'package:rusconsign/utils/colors.dart';
  import 'package:rusconsign/utils/commonWidget/common_appbar.dart';
  import 'package:rusconsign/utils/extension.dart';
  import 'package:rusconsign/utils/text_style.dart';

  class EditDataProduct extends StatelessWidget {
    final EditDataProductController controller =
        Get.put(EditDataProductController());
    final int idBarang;

    EditDataProduct({Key? key, required this.idBarang}) : super(key: key) {
      controller.fetchData(idBarang);
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: CommonAppBar(title: 'editData'.tr),
        backgroundColor: AppColors.background,
        body: Obx(
          () {
            if (controller.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: AppResponsive().screenWidth(context) * 0.16,
                            child: Text(
                              'foto'.tr,
                              style:
                                  AppTextStyle().description(AppColors.titleLine),
                            ),
                          ),
                          const ImageEdit(),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: AppResponsive().screenWidth(context) * 0.16,
                            child: Text(
                              'nama'.tr,
                              style:
                                  AppTextStyle().description(AppColors.titleLine),
                            ),
                          ),
                          Expanded(
                            child: TextFieldEditData(
                              hintText: 'inputNamaPJ'.tr,
                              controller: controller.namaPJController,
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
                              style:
                                  AppTextStyle().description(AppColors.titleLine),
                            ),
                          ),
                          Expanded(
                            child: TextFieldEditData(
                              hintText: 'inputDeskripsi'.tr,
                              controller: controller.deskripsiController,
                              maxlines: 5,
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
                              'hargaRP'.tr,
                              style:
                                  AppTextStyle().description(AppColors.titleLine),
                            ),
                          ),
                          Expanded(
                            child: TextFieldEditDataNumber(
                              hintText: 'inputHarga'.tr,
                              controller: controller.hargaController,
                            ),
                          )
                        ],
                      )
                    ].withSpaceBetween(height: 20),
                  ),
                ),
              );
            }
          },
        ),
        bottomNavigationBar: BottomAppBar(
          surfaceTintColor: Colors.transparent,
          color: Colors.transparent,
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    controller.updateData(idBarang);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.button2,
                    shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  child: Text(
                    'ubahData'.tr,
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
