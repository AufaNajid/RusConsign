// ignore_for_file: avoid_print

import 'package:get/get.dart';
import 'package:rusconsign/Api/KomentarResponse.dart';
import 'package:rusconsign/Api/all_cart_response.dart';
import 'package:rusconsign/Api/detail_barang_response.dart';
import 'package:http/http.dart' as http;
import 'package:rusconsign/Page/cartPage/controller/cart_controller.dart';
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
  var listKomen = <Review>[].obs;
  var avgRating = 0.0.obs;

  @override
  void onInit() {
    Get.put(LikeController());
    super.onInit();
    final productId = Get.arguments as int;
    loadData(productId);
    checkFavoriteStatus(productId);
    fetchDataKomentar(productId);
    checkCartStatus(productId);
    avgRating.value;
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

  void fetchDataKomentar(int productId) async {
    isLoading.value = true;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    final response = await http.get(
      Uri.parse('https://rusconsign.com/api/komentar?barang_id=$productId'),
      headers: <String, String>{
        'Authorization': "Bearer $token",
      },
    );

    if (response.statusCode == 200) {
      KomentarResponse dataKomentar = komentarResponseFromJson(response.body);
      listKomen.value = dataKomentar.reviews;
      print("value rating ${dataKomentar.summary.avg}");

      if (dataKomentar.summary.avg is int) {
        avgRating.value = (dataKomentar.summary.avg as int).toDouble();
      } else if (dataKomentar.summary.avg is double) {
        avgRating.value = dataKomentar.summary.avg;
      }

      update();
      print(avgRating);
    }
    isLoading.value = false;
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
      var request = http.MultipartRequest(
        'POST',
        Uri.parse("https://rusconsign.com/api/likes"),
      );

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

  void checkCartStatus(int productId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    final response = await http.get(
      Uri.parse('https://rusconsign.com/api/cart'),
      headers: <String, String>{
        'Authorization': "Bearer $token",
      },
    );

    if (response.statusCode == 200) {
      AllCartResponse data = allCartResponseFromJson(response.body);
      var isCart = data.cart.any((cart) => cart.barang.id == productId);
      isAddCart.value = isCart;
    }
  }

  Future<void> toogleCart(int idBarang) async {
    isLoading.value = true;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    final CartController controller = Get.find<CartController>();

    if (isAddCart.value == true) {
      final cartItemIndex =
          controller.cartItems.indexWhere((item) => item.barangId == idBarang);
      if (cartItemIndex != -1) {
        final cartId = controller.cartItems[cartItemIndex].cartsId;
        final response = await http.delete(
          Uri.parse('https://rusconsign.com/api/cart/$cartId'),
          headers: <String, String>{
            'Authorization': "Bearer $token",
          },
        );

        if (response.statusCode == 200 || response.statusCode == 201) {
          isAddCart.value = false;
          await controller.fetchCart();
          print("selesai masuk");
        }
      }
    } else {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse("https://rusconsign.com/api/cart"),
      );

      request.headers['Authorization'] = 'Bearer $token';
      request.fields['barang_id'] = idBarang.toString();
      request.fields['quantity'] = 1.toString();

      var response = await request.send();

      if (response.statusCode == 200 || response.statusCode == 201) {
        isAddCart.value = true;
        await controller.fetchCart();
        print("selesai");
      }
    }
    isLoading.value = false;
    update();
  }
}
