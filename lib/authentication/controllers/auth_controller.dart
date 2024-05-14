import 'package:get/get.dart';

class AuthController extends GetxController {
  RxBool isShow = false.obs;
  RxBool isShowConfirmPassword = false.obs;

  void showPassword() {
    isShow.value = !isShow.value;
    update();
  }

  void showConfirmPassword() {
    isShowConfirmPassword.value = !isShowConfirmPassword.value;
    update();
  }
}
