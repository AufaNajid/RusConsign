import 'package:get/get.dart';

class DotsIndicatorController extends GetxController {
  var currentIndex = 0.obs;

  void updateCurrentIndex(int index) {
    currentIndex.value = index;
  }
}