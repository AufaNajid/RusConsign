import 'package:get/instance_manager.dart';
import 'package:rusconsign/Page/userProfilePage/user_profile_controller.dart';

class UserProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserProfilePageController());
  }
}
