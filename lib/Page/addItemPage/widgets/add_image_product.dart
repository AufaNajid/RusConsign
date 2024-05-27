import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:rusconsign/Page/addItemPage/add_item_form_controller.dart';
import 'package:rusconsign/utils/app_responsive.dart';
import 'package:rusconsign/utils/colors.dart';
import 'package:rusconsign/utils/text_style.dart';

class AddImageProduct extends StatelessWidget {
  const AddImageProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AddItemFormController controller =
        Get.put(AddItemFormController());
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Obx(
              () => DottedBorder(
            borderType: BorderType.RRect,
            radius: const Radius.circular(10),
            strokeCap: StrokeCap.butt,
            strokeWidth: 4,
            color: AppColors.cardIconFill,
            dashPattern: const [20, 8],
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              child: SizedBox(
                width: AppResponsive().screenWidth(context) * 0.6,
                height: AppResponsive().screenHeight(context) * 0.3,
                child: controller.pickedImage.value != null
                    ? Image.file(
                  controller.pickedImage.value!,
                  fit: BoxFit.cover,
                )
                    : Center(
                  child: SvgPicture.asset(
                    "assets/images/clarity_picture-line.svg",
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: AppResponsive().screenHeight(context) * 0.01,
        ),
        ElevatedButton(
          onPressed: controller.pickImage,
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: AppColors.button1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Text(
              "Pilih Foto",
              style: AppTextStyle().description(AppColors.textButton1),
            ),
          ),
        ),
      ],
    );
  }
}
