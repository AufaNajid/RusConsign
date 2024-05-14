import 'package:get/instance_manager.dart';
import 'package:rusconsign/Page/registerSeller/register_seller_controller.dart';


class RegisterSellerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterSellerController());
  }
}