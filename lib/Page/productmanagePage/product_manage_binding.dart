import 'package:get/instance_manager.dart';
import 'package:rusconsign/Page/productmanagePage/product_manage_controller.dart';

class ProductManageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProductManageController());
  }
}
