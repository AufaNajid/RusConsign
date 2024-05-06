import 'package:get/get.dart';

class SettingController extends GetxController {
  var isSwitched = false.obs;

  void toggleSwitch() {
    isSwitched.value = !isSwitched.value;
    update();
    isSwitched.refresh();
  }
}