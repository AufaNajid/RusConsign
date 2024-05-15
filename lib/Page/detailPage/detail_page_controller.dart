import 'package:get/get.dart';

class DetailPageController extends GetxController {
  var isFavorite = false.obs;
  var thumbsUpClicked = false.obs;
  var thumbsDownClicked = false.obs;
  var isAddCart = false.obs;

  void toggleFavorite() {
    isFavorite.value = !isFavorite.value;
    update();
  }

  void toggleThumbsUp() {
    thumbsUpClicked.value = !thumbsUpClicked.value;
    update();
  }

  void toggleThumbsDown() {
    thumbsDownClicked.value = !thumbsDownClicked.value;
    update();
  }

  void toggleAddcart() {
    isAddCart.value = !isAddCart.value;
    update();
  }
}
