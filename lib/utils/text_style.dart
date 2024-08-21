import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rusconsign/utils/size_data.dart';

class AppTextStyle {
  double responsiveFontSize(BuildContext context, double fontSize) {
    double baseWidth = 475;
    double screenWidth = MediaQuery.of(context).size.width;

    return fontSize * (screenWidth / baseWidth);
  }

  TextStyle title(BuildContext context, Color color) {
    return TextStyle(
      color: color,
      fontSize: responsiveFontSize(context, SizeData.fontTitleSize),
      fontFamily: "Poppins",
      fontWeight: FontWeight.w700,
      decoration: TextDecoration.none,
    );
  }

  TextStyle header(BuildContext context, Color color) {
    return TextStyle(
      color: color,
      fontSize: responsiveFontSize(context, SizeData.fontHeaderSize),
      fontFamily: "Poppins",
      fontWeight: FontWeight.w600,
      decoration: TextDecoration.none,
    );
  }

  TextStyle subHeader(BuildContext context, Color color) {
    return TextStyle(
      color: color,
      fontSize: responsiveFontSize(context, SizeData.fontSubHeaderSize),
      fontFamily: "Poppins",
      fontWeight: FontWeight.w500,
      decoration: TextDecoration.none,
    );
  }

  TextStyle description(BuildContext context, Color color) {
    return TextStyle(
      color: color,
      fontSize: responsiveFontSize(context, SizeData.fontDescriptionSize),
      fontFamily: "Poppins",
      fontWeight: FontWeight.w400,
      decoration: TextDecoration.none,
    );
  }

  TextStyle descriptionBold(BuildContext context, Color color) {
    return TextStyle(
      color: color,
      fontSize: responsiveFontSize(context, SizeData.fontDescriptionBoldSize),
      fontFamily: "Poppins",
      fontWeight: FontWeight.w600,
      decoration: TextDecoration.none,
    );
  }

  TextStyle textInfo(BuildContext context, Color color) {
    return TextStyle(
      color: color,
      fontSize: responsiveFontSize(context, SizeData.fontTextInfoSize),
      fontFamily: "Poppins",
      fontWeight: FontWeight.w400,
      decoration: TextDecoration.none,
    );
  }

  TextStyle textInfoBold(BuildContext context, Color color) {
    return TextStyle(
      color: color,
      fontSize: responsiveFontSize(context, SizeData.fontDescriptionBoldSize),
      fontFamily: "Poppins",
      fontWeight: FontWeight.w600,
      decoration: TextDecoration.none,
    );
  }

  TextStyle countdownText(BuildContext context, Color color) {
    return TextStyle(
      color: color,
      fontSize: responsiveFontSize(context, SizeData.fontCountdownSize),
      fontFamily: "Poppins",
      fontWeight: FontWeight.w600,
      decoration: TextDecoration.none,
    );
  }
}
