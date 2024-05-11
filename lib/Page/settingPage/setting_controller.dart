import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:get_storage/get_storage.dart';

class SettingController extends GetxController {
  static final box = GetStorage();

  RxBool isNotificationSwitched = false.obs;
  RxBool isDarkModeSwitched = false.obs;
  RxBool isOpenMenu = false.obs;
  RxString selectedLanguage = 'Indonesia'.obs;
  RxBool isShow = false.obs;

  @override
  void onInit() async {
    super.onInit();
    isNotificationSwitched.value = box.read('isNotificationSwitched') ?? false;
    isDarkModeSwitched.value = box.read('isDarkModeSwitched') ?? false;
    isOpenMenu.value = box.read('isOpenMenu') ?? false;
    selectedLanguage.value = box.read('selectedLanguage') ?? 'Indonesia';
    update();
  }

  void toggleNotificationSwitch() {
    isNotificationSwitched.value = !isNotificationSwitched.value;
    box.write('isNotificationSwitched', isNotificationSwitched.value);
    update();
  }

  void toggleDarkModeSwitch() {
    isDarkModeSwitched.value = !isDarkModeSwitched.value;
    box.write('isDarkModeSwitched', isDarkModeSwitched.value);
    update();
  }

  void changeLanguage(String newLanguage) {
    selectedLanguage.value = newLanguage;
    box.write('selectedLanguage', selectedLanguage.value);
    update();
  }

  void showPassword() {
    isShow.value = !isShow.value;
    update();
  }
}
