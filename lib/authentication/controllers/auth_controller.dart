import 'package:get/get.dart';

class AuthController extends GetxController {
  RxBool isShow = false.obs;

  void showPassword() {
    isShow.value = !isShow.value;
    update();
  }
}