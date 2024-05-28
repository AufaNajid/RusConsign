import 'package:get/get.dart';

class ProductManageController extends GetxController {
  final currentIndex = 0.obs;
  final _selectedIndex = 0.obs;
  RxBool isLoading = false.obs;
  RxBool successfulRegister = false.obs;
  RxString message = "".obs;

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
