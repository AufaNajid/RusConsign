// ignore_for_file: avoid_print

import 'package:get/get.dart';
import 'package:rusconsign/Api/detail_barang_response.dart';
import 'package:http/http.dart' as http;
import 'package:rusconsign/Page/detailPage/service/detail_service.dart';
import 'package:rusconsign/Page/favoritePage/controller/like_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Api/all_favorite_response.dart';

class DetailPageController extends GetxController
    with StateMixin<DetailBarangModel> {
  RxBool isLoading = false.obs;
  var isFavorite = false.obs;
  var thumbsUpClicked = false.obs;
  var thumbsDownClicked = false.obs;
  var isAddCart = false.obs;

  @override
  void onInit() {
    super.onInit();
    final productId = Get.arguments as int;
    loadData(productId);
    checkFavoriteStatus(productId);
  }

  void loadData(int productId) async {
    try {
      isLoading(true);
      change(await DetailService.fetchProductDetail(productId),
          status: RxStatus.success());
    } finally {
      isLoading.value = false;
    }
    update();
  }

  void checkFavoriteStatus(int productId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    final response = await http.get(
      Uri.parse('https://rusconsign.com/api/likes'),
      headers: <String, String>{
        'Authorization': "Bearer $token",
      },
    );

    if (response.statusCode == 200) {
      ProductFavorite data = productFavoriteFromJson(response.body);
      var isFav = data.likes.any((like) => like.barang.id == productId);
      isFavorite.value = isFav;
    }
  }

  Future<void> toggleFavorite(int idBarang) async {
    isLoading.value = true;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    final LikeController controller = Get.find<LikeController>();

    if (isFavorite.value) {
      // If already favorite, remove it
      final response = await http.delete(
        Uri.parse('https://rusconsign.com/api/likes/$idBarang'),
        headers: <String, String>{
          'Authorization': "Bearer $token",
        },
      );

      if (response.statusCode == 200) {
        await controller.fetchFavorite();
        isFavorite.value = false;
      }
    } else {
      // Add to favorite
      var request = http.MultipartRequest(
          'POST', Uri.parse("https://rusconsign.com/api/likes"));

      request.headers['Authorization'] = 'Bearer $token';
      request.fields['barang_id'] = idBarang.toString();

      var response = await request.send();

      if (response.statusCode == 200) {
        await controller.fetchFavorite();
        isFavorite.value = true;
      }
    }
    isLoading.value = false;
    update();
  }
}
