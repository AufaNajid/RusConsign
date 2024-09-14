import 'package:get/get.dart';
import 'package:rusconsign/Page/locationPage/location_page_controller.dart';

class LocationPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LocationPageController());
  }
}