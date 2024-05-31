import 'package:flutter/cupertino.dart';
import 'package:rusconsign/utils/app_responsive.dart';
import 'package:rusconsign/utils/colors.dart';

class ImageEdit extends StatelessWidget {
  const ImageEdit({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppResponsive().screenWidth(context)*0.6,
      height: AppResponsive().screenHeight(context)*0.3,
    );
  }
}