import 'package:get/instance_manager.dart';
import 'package:rusconsign/Page/editdataproductPage/edit_data_product_controller.dart';

class EditDataProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EditDataProductController());
  }
}
