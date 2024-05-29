import 'package:get/instance_manager.dart';
import 'package:rusconsign/Page/profilePage/profile_page_controller.dart';


class ProfilePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfilePageController());
  }
}
