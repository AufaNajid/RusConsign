import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:rusconsign/utils/colors.dart';
import 'package:rusconsign/utils/size_data.dart';
import 'package:rusconsign/utils/text_style.dart';

class LocationCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String desc;
  final VoidCallback onSelected;

  const LocationCard(
      {super.key,
      required this.imagePath,
      required this.title,
      required this.desc,
      required this.onSelected});

  @override
  Widget build(BuildContext context) {
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
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      FeatherIcons.check,
                      size: SizeData.iconSize,
                      color: AppColors.activeIconType,
                    ),
                    style: ButtonStyle(
                      backgroundColor:
                          const MaterialStatePropertyAll(AppColors.button1),
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
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
