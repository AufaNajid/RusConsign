import 'package:get/instance_manager.dart';
import 'package:rusconsign/Page/qrisPage/qris_payment_controller.dart';

class QrPaymentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => QrCodeController());
  }
}
