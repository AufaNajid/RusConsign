import 'package:get/instance_manager.dart';

import '../controllers/dots_indicator_controller.dart';
import '../controllers/filter_button_controller.dart';

class HomePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DotsIndicatorController());
    Get.put(FilterButtonController());
  }
}
