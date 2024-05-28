import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../Api/jasa_response.dart';
import '../../Api/product_response.dart';

class HomePageController extends GetxController {
  final currentIndex = 0.obs;
  final _selectedIndex = 0.obs;
  RxBool isLoading = false.obs;
  RxBool successfulRegister = false.obs;
  RxString message = "".obs;

  int get selectedIndex => _selectedIndex.value;

  void updateCurrentIndexIndicator(int index) {
    currentIndex.value = index;
  }

  void setSelectedFilter(int index) {
    _selectedIndex.value = index;
    update();
    _selectedIndex.refresh();
  }

  Future<Product> fetchProduct(int productId) async {
    final response = await http.get(Uri.parse('https:/https://rusconsign.com/api/product'));

    if (response.statusCode == 200) {
      return Product.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load product');
    }
  }

  Future<Jasa> fetchJasa(int jasaId) async {
    final response = await http.get(Uri.parse('https:/https://rusconsign.com/api/jasa'));

    if (response.statusCode == 200) {
      return Jasa.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load Jasa');
    }
  }
}
