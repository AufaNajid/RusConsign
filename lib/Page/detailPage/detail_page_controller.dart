// ignore_for_file: avoid_print

import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rusconsign/Api/all_barang_response.dart';
import 'package:rusconsign/Api/product_response.dart';
import 'package:rusconsign/Page/homePage/home_page_controller.dart';

class DetailPageController extends GetxController {
  RxBool isLoading = false.obs;
  var isFavorite = false.obs;
  var thumbsUpClicked = false.obs;
  var thumbsDownClicked = false.obs;
  var isAddCart = false.obs;
  var productDetail = Rxn<Barang>();


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
    fetchProductDetail(productId);
  }

  fetchProductDetail(int productId) async {
    isLoading(true);
    final response = await http.get(Uri.parse('https://rusconsign.com/api/barang/$productId'));

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      Barang product = Barang.fromJson(jsonResponse['barang']);
      productDetail.value = product;
      print('Product fetched successfully');
    } else {
      print('Failed to fetch product: ${response.statusCode}');
    }

    isLoading(false);
  }
}
