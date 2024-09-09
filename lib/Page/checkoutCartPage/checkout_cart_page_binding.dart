import 'package:get/get.dart';
import 'package:rusconsign/Page/checkoutCartPage/checkout_cart_page_controller.dart';

class CheckoutCartPageBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => CheckoutCartPageController());
  }
}