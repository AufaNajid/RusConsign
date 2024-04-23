import 'package:get/instance_manager.dart';
import 'package:rusconsign/homePage/home_page_controller.dart';


class HomePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomePageController());
  }
}
