import 'package:get/get.dart';
import 'package:rusconsign/Page/cartPage/controller/cart_controller.dart';

class CartPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CartController());
  }
}
