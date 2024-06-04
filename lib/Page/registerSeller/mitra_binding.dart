import 'package:get/instance_manager.dart';
import 'package:rusconsign/Page/registerSeller/controller/mitra_controller.dart';


class MitraBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MitraController());
  }
}