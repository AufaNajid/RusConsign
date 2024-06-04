// ignore_for_file: avoid_print

import 'package:get/get.dart';
import 'package:rusconsign/Api/detail_barang_response.dart';
import 'package:rusconsign/Page/detailPage/service/detail_service.dart';

class DetailPageController extends GetxController with StateMixin<DetailBarangModel>{
  RxBool isLoading = false.obs;
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

  @override
  void onInit() {
    super.onInit();
    final productId = Get.arguments as int;
    loadData(productId);
  }
  void loadData(int productId) async {
    try {
      isLoading(true);
      change(await DetailService.fetchProductDetail(productId), status: RxStatus.success());
    // ignore: empty_catches
    } finally {
      isLoading.value = false;
    }
    update();
  }
}
