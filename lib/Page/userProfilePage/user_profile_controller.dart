import 'package:get/get.dart';

class UserProfilePageController extends GetxController {
  final currentIndex = 0.obs;
  final _selectedIndex = 0.obs;
  final following = false.obs;

  int get selectedIndex => _selectedIndex.value;

  void updateCurrentIndexIndicator(int index) {
    currentIndex.value = index;
  }

  void setSelectedFilter(int index) {
    _selectedIndex.value = index;
    update();
    _selectedIndex.refresh();
  }

  void onFollow() {
    following.value = !following.value;
    update();
  }
}