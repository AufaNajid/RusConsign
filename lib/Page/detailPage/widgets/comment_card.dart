import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';
import 'package:rusconsign/utils/app_responsive.dart';
import 'package:rusconsign/utils/colors.dart';
import 'package:rusconsign/utils/size_data.dart';
import 'package:rusconsign/utils/text_style.dart';

class CommentCard extends StatelessWidget {
  final String imagePath;
  final String username;
  final double rating;
  final DateTime date;
  final String desc;
  final int like;
  final int disLike;
  final VoidCallback onliked;
  final VoidCallback ondisliked;
  const CommentCard({
    super.key,
    required this.imagePath,
    required this.username,
    required this.rating,
    required this.date,
    required this.desc,
    required this.like,
    required this.disLike,
    required this.onliked,
    required this.ondisliked,
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
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: AppResponsive().screenWidth(context) * 0.1,
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
                      style: AppTextStyle()
                          .subHeader(context, AppColors.titleLine),
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
                            size: SizeData.iconStarInsideSize,
                          ),
                          Icon(
                            Icons.star_border_rounded,
                            color: AppColors.borderIcon,
                            size: SizeData.iconSize,
                          ),
                        ],
                      ),
                      onRatingUpdate: (rating) {},
                    ),
                    const SizedBox(height: 5),
                    Text(
                      DateFormat('dd MMMM yyyy').format(date),
                      style: AppTextStyle()
                          .textInfoBold(context, AppColors.description),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      desc,
                      style: AppTextStyle()
                          .description(context, AppColors.description),
                    ),
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
