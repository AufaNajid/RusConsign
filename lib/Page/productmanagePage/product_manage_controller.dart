// ignore_for_file: avoid_print, unnecessary_brace_in_string_interps

import 'package:get/get.dart';
import 'package:rusconsign/Api/product_mitra_list.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ProductManageController extends GetxController {
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
    fetchProductMitra(index);
    update();
    _selectedIndex.refresh();
  }

  @override
  void onInit() {
    super.onInit();
    fetchProductMitra(0);
  }

  Future<void> fetchProductMitra(int filter) async {
    isLoading.value = true;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    String? idMitra = prefs.getString('idMitra');
    // print(idMitra);
    Uri uri;

    if (filter == 1) {
      uri = Uri.parse(
          'https://rusconsign.com/api/filter-products-by-mitra?mitra_id=$idMitra&category_id=2');
    } else if (filter == 2) {
      uri = Uri.parse(
          'https://rusconsign.com/api/filter-products-by-mitra?mitra_id=$idMitra&category_id=1');
    } else {
      uri = Uri.parse('https://rusconsign.com/api/mitra/barang/$idMitra');
    }

    final response = await http.get(
      uri,
      headers: <String, String>{
        'Authorization': "Bearer $token",
      },
    );

    if (response.statusCode == 200) {
      ProductMitraList data = productMitraListFromJson(response.body);
      productList.value = data.barangs;

      // print(response.body);
      // print("Token User adalah${token}");
    } else {
      productList.clear();
    }
    isLoading.value = false;
  }

  Future<void> deleteBarang(int idBarang) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');
      final response = await http.delete(
        Uri.parse('https://rusconsign.com/api/mitra/delete-barang/$idBarang'),
        headers: <String, String>{
          'Authorization': "Bearer $token",
        },
      );

      if (response.statusCode == 200) {
        fetchProductMitra(0);
        print('Barang deleted successfully');
      } else {
        throw Exception('Failed to delete barang');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
