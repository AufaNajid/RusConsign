import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rusconsign/profilePage/widgets/customwidget.dart';

class SectionController extends GetxController {

  var selectedIndex = 0.obs;
  Widget selectedSection = const SectionPribadi();

  void setSelectedFilter(int index) {
    selectedIndex.value = index;
  }

  void setSelectedSection(Widget section) {
    selectedSection = section;
  }
}


