import 'package:get/get.dart';

class AuthController extends GetxController {
  RxBool isShow = true.obs;

  void showPassword() {
    isShow.value = !isShow.value;
    update();
  }
}