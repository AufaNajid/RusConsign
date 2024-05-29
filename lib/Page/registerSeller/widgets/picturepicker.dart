import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:rusconsign/Page/registerSeller/register_seller_controller.dart';
import 'package:rusconsign/utils/app_responsive.dart';
import 'package:rusconsign/utils/colors.dart';
import 'package:rusconsign/utils/text_style.dart';

class PicturePicker extends StatelessWidget {
  const PicturePicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final RegisterSellerController controller =
        Get.put(RegisterSellerController());
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
                width: AppResponsive().screenWidth(context) * 0.4,
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
