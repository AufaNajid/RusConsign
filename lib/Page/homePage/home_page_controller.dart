import 'package:get/get.dart';

class HomePageController extends GetxController {
  final currentIndex = 0.obs;
  final _selectedIndex = 0.obs;

  int get selectedIndex => _selectedIndex.value;

  void updateCurrentIndexIndicator(int index) {
    currentIndex.value = index;
  }

  void setSelectedFilter(int index) {
    _selectedIndex.value = index;
    update();
    _selectedIndex.refresh();
  }
}
