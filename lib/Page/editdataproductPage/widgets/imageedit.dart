import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rusconsign/Page/editdataproductPage/edit_data_product_controller.dart';
import 'package:rusconsign/utils/app_responsive.dart';
import 'package:rusconsign/utils/colors.dart';
import 'package:rusconsign/utils/extension.dart';
import 'package:rusconsign/utils/text_style.dart';

class ImageEdit extends StatelessWidget {
  final String imageUrl;

  const ImageEdit({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final EditDataProductController controller =
        Get.put(EditDataProductController());

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Container(
          width: AppResponsive().screenWidth(context) * 0.6,
          height: AppResponsive().screenHeight(context) * 0.3,
          decoration: BoxDecoration(
            color: AppColors.activeIcon,
            image: DecorationImage(image: NetworkImage(imageUrl)),
          ),
          child: Obx(() {
            return SizedBox(
              width: AppResponsive().screenWidth(context) * 0.6,
              height: AppResponsive().screenHeight(context) * 0.3,
              child: controller.pickedImage.value != null
                  ? Image.file(
                      controller.pickedImage.value!,
                      fit: BoxFit.cover,
                    )
                  : Center(
                      child: Image.network(
                        imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
            );
          }),
        ),
        ElevatedButton(
          onPressed: controller.pickImage,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.button1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Text(
              'pilihFoto'.tr,
              style: AppTextStyle().description(AppColors.textButton1),
            ),
          ),
        ),
      ].withSpaceBetween(height: 10),
    );
  }
}
