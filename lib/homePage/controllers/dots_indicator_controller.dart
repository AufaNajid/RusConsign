import 'package:get/get.dart';

class DotsIndicatorController extends GetxController {
  final currentIndex = 0.obs;

  void updateCurrentIndex(int index) {
    currentIndex.value = index;
  }
}
