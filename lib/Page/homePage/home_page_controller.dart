// ignore_for_file: avoid_print

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:rusconsign/Api/all_barang_response.dart';

class HomePageController extends GetxController {
  final currentIndex = 0.obs;
  final _selectedIndex = 0.obs;
  RxBool isLoading = false.obs;
  RxBool successfulRegister = false.obs;
  RxString message = "".obs;
  var productList = <Barang>[].obs;

  int get selectedIndex => _selectedIndex.value;

  void updateCurrentIndexIndicator(int index) {
    currentIndex.value = index;
  }

  void setSelectedFilter(int index) {
    _selectedIndex.value = index;
    fetchProduct(index); // Fetch products based on selected filter
    update();
    _selectedIndex.refresh();
  }

  @override
  void onInit() {
    super.onInit();
    fetchProduct(0); // Default fetch all products
  }

  Future<void> fetchProduct(int filter) async {
    isLoading.value = true;
    Uri uri;

    if (filter == 1) {
      uri = Uri.parse(
          'https://rusconsign.com/api/accepted-barangs?category_id=2');
    } else if (filter == 2) {
      uri = Uri.parse(
          'https://rusconsign.com/api/accepted-barangs?category_id=1');
    } else {
      uri = Uri.parse('https://rusconsign.com/api/accepted-barangs');
    }

    final response = await http.get(uri);
    if (response.statusCode == 200) {
      AllBarangResponse data = allBarangResponseFromJson(response.body);
      productList.value = data.barangs;
    } else {
      productList.clear();
    }
    isLoading.value = false;
  }
}
