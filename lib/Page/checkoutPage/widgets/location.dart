import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:rusconsign/utils/colors.dart';
import 'package:rusconsign/utils/extension.dart';
import 'package:rusconsign/utils/size_data.dart';
import 'package:rusconsign/utils/text_style.dart';

class LocationChekout extends StatelessWidget {
  final String locationHeader;
  final String locationDetail;

  const LocationChekout(
      {Key? key, required this.locationHeader, required this.locationDetail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 40,
          width: 40,
          child: ClipOval(
              child: Material(
            color: AppColors.cardIconFill,
            child: Icon(
              size: SizeData.iconSize,
              FeatherIcons.mapPin,
              color: AppColors.nonActiveIcon,
            ),
          )),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                locationHeader,
                style: AppTextStyle().subHeader(context, AppColors.description),
              ),
              Text(
                locationDetail,
                style: AppTextStyle().textInfo(context, AppColors.description),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              )
            ].withSpaceBetween(height: 5),
          ),
        ),
        IconButton(
            onPressed: () {
              Get.toNamed("/locationpage");
            },
            icon: Icon(
              size: SizeData.iconSize,
              FeatherIcons.edit,
              color: AppColors.nonActiveIcon,
            ))
      ].withSpaceBetween(width: 10),
    );
  }
}
