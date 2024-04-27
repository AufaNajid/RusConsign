import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppTextStyle {
  TextStyle title(Color color) {
    return TextStyle(
        color: color,
        fontSize: 18,
        fontFamily: "Poppins",
        fontWeight: FontWeight.w700,
        height: 0);
  }

  TextStyle header(Color color) {
    return TextStyle(
        color: color,
        fontSize: 16,
        fontFamily: "Poppins",
        fontWeight: FontWeight.w600,
        height: 0);
  }

  TextStyle subHeader(Color color) {
    return TextStyle(
        color: color,
        fontSize: 13,
        fontFamily: "Poppins",
        fontWeight: FontWeight.w500,
        height: 0);
  }

  TextStyle description(Color color) {
    return TextStyle(
        color: color,
        fontSize: 11,
        fontFamily: "Poppins",
        fontWeight: FontWeight.w400,
        height: 0);
  }

  TextStyle textInfo(Color color) {
    return TextStyle(
        color: color,
        fontSize: 8,
        fontFamily: "Poppins",
        fontWeight: FontWeight.w400,
        height: 0);
  }

  TextStyle descriptionBold(Color color) {
    return TextStyle(
        color: color,
        fontSize: 11,
        fontFamily: "Poppins",
        fontWeight: FontWeight.w600,
        height: 0);
  }

  TextStyle textInfoBold(Color color) {
    return TextStyle(
        color: color,
        fontSize: 8,
        fontFamily: "Poppins",
        fontWeight: FontWeight.w600,
        height: 0);
  }
}
