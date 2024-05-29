import 'package:get/instance_manager.dart';
import 'package:rusconsign/Page/detailPage/detail_page_controller.dart';

class DetailPageBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => DetailPageController());
  }
}