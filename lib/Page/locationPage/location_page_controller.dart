// ignore_for_file: avoid_print

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LocationPageController extends GetxController {
  RxString data = "".obs;

  

  @override
  void onInit() async {
    super.onInit();
    var selectedCheckout = GetStorage().read("checkoutFrom");
    print(selectedCheckout);
    data.value = selectedCheckout.toString();
  }
}
