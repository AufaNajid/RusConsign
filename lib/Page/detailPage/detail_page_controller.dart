import 'package:get/get.dart';

class DetailPageController extends GetxController {
  var isFavorite = false.obs;
  var thumbsUpClicked = false.obs;
  var thumbsDownClicked = false.obs;

  void toggleFavorite() {
    isFavorite.value = !isFavorite.value;
  }

  void toggleThumbsUp() {
    thumbsUpClicked.value = !thumbsUpClicked.value;
    if (thumbsUpClicked.value) {
      thumbsDownClicked.value = false;
    }
  }

  void toggleThumbsDown() {
    thumbsDownClicked.value = !thumbsDownClicked.value;
    if (thumbsDownClicked.value) {
      thumbsUpClicked.value = false;
    }
  }
}