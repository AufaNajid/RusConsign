import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:rusconsign/Page/checkoutPage/checkout_page_controller.dart';
import 'package:rusconsign/utils/colors.dart';
import 'package:rusconsign/utils/size_data.dart';
import 'package:rusconsign/utils/text_style.dart';

class LocationCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String desc;
  final int index;

  const LocationCard(
      {super.key,
      required this.imagePath,
      required this.title,
      required this.desc,
      required this.index});

  @override
  Widget build(BuildContext context) {
    final CheckoutPageController locationController = Get.find();
    const imageUrl = "https://rusconsign.com/api/storage/public";
    return SizedBox(
      width: double.infinity,
      child: Card(
        elevation: 0,
        color: AppColors.cardIconFill,
        margin: const EdgeInsets.symmetric(vertical: 6),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 175,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    "$imageUrl${imagePath.replaceFirst("storage/", "")}",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 20,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: AppTextStyle()
                              .subHeader(context, AppColors.titleLine),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          desc,
                          style: AppTextStyle()
                              .textInfo(context, AppColors.description),
                        )
                      ],
                    ),
                  ),
                  const Spacer(),
                  Obx(() => IconButton(
                    onPressed: () {
                      locationController.selectLocation(index);
                    },
                    icon: Icon(
                      FeatherIcons.check,
                      size: SizeData.iconSize,
                      color: locationController.selectedLocationIndex.value == index + 1
                      ? AppColors.activeIconType
                      : AppColors.activeIcon,
                    ),
                    style: ButtonStyle(
                      backgroundColor:
                      MaterialStatePropertyAll(
                        locationController.selectedLocationIndex.value == index + 1
                        ? AppColors.button1
                        : AppColors.cardIconFill,
                      ),
                      side: const MaterialStatePropertyAll(
                        BorderSide(
                            color: AppColors.button1,
                            style: BorderStyle.solid,
                            width: 0),
                      ),
                      shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
