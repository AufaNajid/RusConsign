import 'package:get/get.dart';
import 'package:rusconsign/Page/giveRatingPage/controller/give_rating_controller.dart';

class GiveRatingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GiveRatingController());
  }

}