import 'package:get/instance_manager.dart';
import 'package:rusconsign/Page/addItemPage/add_item_form_controller.dart';

class AddItemFormBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddItemFormController());
  }
}
