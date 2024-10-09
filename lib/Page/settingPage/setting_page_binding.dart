import 'package:get/get.dart';
import 'package:rusconsign/Page/settingPage/setting_controller.dart';

class SettingPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SettingController());
  }
}