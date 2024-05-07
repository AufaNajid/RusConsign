import 'package:get/instance_manager.dart';
import 'package:rusconsign/page/detailPage/detail_page_controller.dart';

class DetailPageBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => DetailPageController());
  }
}