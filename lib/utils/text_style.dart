import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppTextStyle {
  title(Color color) {
    return TextStyle(
      color: color,
      fontSize: 16,
      fontFamily: "Poppins",
      fontWeight: FontWeight.w700,
      decoration: TextDecoration.none,
    );
  }

  header(Color color) {
    return TextStyle(
      color: color,
      fontSize: 14,
      fontFamily: "Poppins",
      fontWeight: FontWeight.w600,
      decoration: TextDecoration.none,
    );
  }

  subHeader(Color color) {
    return TextStyle(
      color: color,
      fontSize: 12,
      fontFamily: "Poppins",
      fontWeight: FontWeight.w500,
      decoration: TextDecoration.none,
    );
  }

  description(Color color) {
    return TextStyle(
      color: color,
      fontSize: 10,
      fontFamily: "Poppins",
      fontWeight: FontWeight.w400,
      decoration: TextDecoration.none,
    );
  }

  descriptionBold(Color color) {
    return TextStyle(
      color: color,
      fontSize: 10,
      fontFamily: "Poppins",
      fontWeight: FontWeight.w600,
      decoration: TextDecoration.none,
    );
  }

  textInfo(Color color) {
    return TextStyle(
      color: color,
      fontSize: 8,
      fontFamily: "Poppins",
      fontWeight: FontWeight.w400,
      decoration: TextDecoration.none,
    );
  }

  textInfoBold(Color color) {
    return TextStyle(
      color: color,
      fontSize: 8,
      fontFamily: "Poppins",
      fontWeight: FontWeight.w600,
      decoration: TextDecoration.none,
    );
  }
}
