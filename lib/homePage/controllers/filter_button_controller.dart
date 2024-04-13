import 'package:get/get.dart';

class FilterButtonController extends GetxController {
  final _selectedIndex = 0.obs;

  int get selectedIndex => _selectedIndex.value;

  void setSelectedIndex(int index) {
    _selectedIndex.value = index;
    update();
    _selectedIndex.refresh();
  }
}
