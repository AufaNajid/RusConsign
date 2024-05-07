import 'package:get/get.dart';

class SettingController extends GetxController {
  var isNotificationSwitched = false.obs;
  var isDarkModeSwitched = false.obs;
  var isOpenMenu = false.obs;
  var selectedLanguage = 'Indonesia'.obs;
  var isShow = false.obs;

  void toggleNotificationSwitch() {
    isNotificationSwitched.value = !isNotificationSwitched.value;
    update();
  }

  void toggleDarkModeSwitch() {
    isDarkModeSwitched.value = !isDarkModeSwitched.value;
    update();
  }

  void changeLanguage(String newLanguage) {
    selectedLanguage.value = newLanguage;
    update();
  }

  void showPassword() {
    isShow.value = !isShow.value;
    update();
  }
}
