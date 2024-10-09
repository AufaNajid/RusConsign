import 'package:get/instance_manager.dart';
import 'package:rusconsign/Page/sellingPage/selling_page_controller.dart';


class SellingPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SellingPageController());
  }
}
