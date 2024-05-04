import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppTextStyle {
  title(Color color) {
    return TextStyle(
        color: color,
        fontSize: 18,
        fontFamily: "Poppins",
        fontWeight: FontWeight.w700,
        height: 0);
  }

  header(Color color) {
    return TextStyle(
        color: color,
        fontSize: 16,
        fontFamily: "Poppins",
        fontWeight: FontWeight.w600,
        height: 0);
  }

  subHeader(Color color) {
    return TextStyle(
        color: color,
        fontSize: 14,
        fontFamily: "Poppins",
        fontWeight: FontWeight.w500,
        height: 0);
  }

  description(Color color) {
    return TextStyle(
        color: color,
        fontSize: 12,
        fontFamily: "Poppins",
        fontWeight: FontWeight.w400,
        height: 0);
  }

  textInfo(Color color) {
    return TextStyle(
        color: color,
        fontSize: 10,
        fontFamily: "Poppins",
        fontWeight: FontWeight.w400,
        height: 0);
  }

  descriptionBold(Color color) {
    return TextStyle(
        color: color,
        fontSize: 12,
        fontFamily: "Poppins",
        fontWeight: FontWeight.w600,
        height: 0);
  }

  textInfoBold(Color color) {
    return TextStyle(
        color: color,
        fontSize: 10,
        fontFamily: "Poppins",
        fontWeight: FontWeight.w600,
        height: 0);
  }

  chat(Color color) {
    return TextStyle(
        color: color,
        overflow: TextOverflow.ellipsis,
        fontSize: 12,
        fontFamily: "Poppins",
        fontWeight: FontWeight.w400,
        height: 0);
  }
}
