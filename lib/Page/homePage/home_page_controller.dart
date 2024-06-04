// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:rusconsign/Api/all_barang_response.dart';
import '../../Api/jasa_response.dart';
// ignore: unused_import
import '../../Api/product_response.dart';

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
    update();
    _selectedIndex.refresh();
  }
  @override
  void onInit(){
    super.onInit();
    fetchProduct();

  }

  fetchProduct() async {
    isLoading.value = true;
    final response = await http.get(Uri.parse('https://rusconsign.com/api/barang'));
    print ("Status Code ${response.statusCode}");
    if(response.statusCode == 200) {
      AllBarangResponse data = allBarangResponseFromJson(response.body);
      productList.value = data.barangs;
      isLoading(false);
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
