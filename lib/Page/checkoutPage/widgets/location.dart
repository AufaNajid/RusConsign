import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:rusconsign/utils/colors.dart';
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
              child: Container(
            color: AppColors.cardIconFill,
            child: const Icon(
              FeatherIcons.mapPin,
              color: AppColors.nonActiveIcon,
            ),
          )),
        ),
        const SizedBox(width: 10,),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                locationHeader,
                style: AppTextStyle().subHeader(AppColors.description),
              ),
              Text(
                locationDetail,
                style: AppTextStyle().textInfo(AppColors.description),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              )
            ],
          ),
        ),
        IconButton(onPressed: () {
          
        }, icon: const Icon(FeatherIcons.edit, color: AppColors.nonActiveIcon,))
      ],
    );
  }
}
