
import 'package:get/get.dart';
import 'package:rusconsign/Page/orderPage/order_page_controller.dart';

class OrderPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OrderPageController());
  }
}
