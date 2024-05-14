import 'package:get/get.dart';

class DetailPageController extends GetxController {
  var isLiked = false.obs;
  var thumbsUpClicked = false.obs;
  var thumbsDownClicked = false.obs;

  void toggleLike() {
    isLiked.value = !isLiked.value;
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