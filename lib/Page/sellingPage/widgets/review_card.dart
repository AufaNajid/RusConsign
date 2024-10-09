import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:rusconsign/utils/colors.dart';

import 'package:rusconsign/utils/text_style.dart';

class ReviewCardSelling extends StatelessWidget {
  final String imagePath;
  final String username;
  final double rating;
  final DateTime date;
  final String desc;
  final int like;
  final int disLike;

  const ReviewCardSelling({
    super.key,
    required this.imagePath,
    required this.username,
    required this.rating,
    required this.date,
    required this.desc,
    required this.like,
    required this.disLike,

  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        elevation: 0,
        color: AppColors.cardIconFill,
        margin: const EdgeInsets.symmetric(vertical: 6),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(
              color: AppColors.titleLine,
              width: 1,
              style: BorderStyle.solid,
            )),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 40,
                height: 40,
                child: Column(
                  children: [
                    ClipOval(
                      child: Image.network(
                        imagePath,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      username,
                      style: AppTextStyle().subHeader(context, AppColors.titleLine),
                    ),
                    const SizedBox(height: 5),
                    RatingBar.builder(
                      ignoreGestures: true,
                      unratedColor: AppColors.nonActiveBar,
                      itemSize: 20,
                      maxRating: 5.0,
                      initialRating: rating,
                      minRating: 0.0,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemBuilder: (context, _) => Stack(
                        alignment: Alignment.center,
                        children: [
                          const Icon(
                            Icons.star,
                            color: AppColors.bintang,
                            size: 18,
                          ),
                          Icon(
                            Icons.star_border_rounded,
                            color: AppColors.borderIcon,
                            size: 20,
                          ),
                        ],
                      ),
                      onRatingUpdate: (rating) {},
                    ),
                    const SizedBox(height: 5),
                    Text(
                      date.toString().substring(0, 16),
                      style: AppTextStyle().textInfoBold(context, AppColors.description),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      desc,
                      style: AppTextStyle().textInfo(context, AppColors.description),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 45,
                          child: Row(
                            children: [
                             Icon(FeatherIcons.thumbsUp, size: 20, color: AppColors.description, ),
                              const Spacer(),
                              Text(like.toString(),
                                  style: AppTextStyle()
                                      .descriptionBold(context, AppColors.description)),
                            ],
                          ),
                        ),
                        const SizedBox(width: 20),
                        SizedBox(
                          width: 45,
                          child: Row(
                            children: [
                              Icon(FeatherIcons.thumbsUp, size: 20, color:AppColors.description),
                              const Spacer(),
                              Text(disLike.toString(),
                                  style: AppTextStyle()
                                      .descriptionBold(context, AppColors.description)),
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
