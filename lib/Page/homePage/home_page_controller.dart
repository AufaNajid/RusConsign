// ignore_for_file: avoid_print

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
  var productList = <Datum>[].obs;

  int get selectedIndex => _selectedIndex.value;

  void updateCurrentIndexIndicator(int index) {
    currentIndex.value = index;
  }

  void setSelectedFilter(int index) {
    _selectedIndex.value = index;
    update();
    _selectedIndex.refresh();
  }
  @override
  void onInit(){
    super.onInit();
    fetchProduct();
  }

  fetchProduct() async {
    try {
      isLoading(true);
      final response = await http.get(Uri.parse('https://rusconsign.com/api/product'));
      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = json.decode(response.body);
        final List<dynamic> data = jsonResponse["data"];
        productList.value = data.map((json) => Datum.fromJson(json)).toList();
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      print("Error: $e");
    } finally {
      isLoading.value = false;
    }
  }
  Future<Jasa> fetchJasa(int jasaId) async {
    final response = await http.get(Uri.parse('https:/https://rusconsign.com/api/jasas'));

    if (response.statusCode == 200) {
      return Jasa.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load Jasa');
    }
  }
}
