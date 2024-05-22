import 'package:get/get.dart';
import 'package:rusconsign/Page/chatPage/chat_controller.dart';

class ChatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChatController());
  }
}