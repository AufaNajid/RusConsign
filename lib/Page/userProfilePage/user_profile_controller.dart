// ignore_for_file: avoid_print

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:rusconsign/Api/detail_mitra.dart';
import 'package:rusconsign/Api/product_mitra_list.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProfilePageController extends GetxController {
  final currentIndex = 0.obs;
  final _selectedIndex = 0.obs;
  final following = false.obs;
  RxBool isLoading = false.obs;
  var productList = <Barang>[].obs;
  var detailMitra = Rxn<Data>();

  int get selectedIndex => _selectedIndex.value;
  late int mitraId;

  void updateCurrentIndexIndicator(int index) {
    currentIndex.value = index;
  }

  void setSelectedFilter(int index) {
    _selectedIndex.value = index;
    fetchProduct(index);
    update();
    _selectedIndex.refresh();
  }

  void onFollow() {
    following.value = !following.value;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    mitraId = Get.arguments as int;
    print("ID Mitra anda : $mitraId");
    final idMitra = Get.arguments as int;
    fetchProduct(0);
    fetchDetailMitra(idMitra);
  }

  fetchDetailMitra(int mitraId) async {
    isLoading.value = true;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    final response = await http.get(
      Uri.parse('https://rusconsign.com/api/mitra/show/$mitraId'),
      headers: <String, String>{
        'Authorization': "Bearer ${token.toString()}",
      },
    );

    if(response.statusCode == 200) {
      MitraResponse mitra = mitraResponseFromJson(response.body);
      detailMitra.value = mitra.data;
    }
    isLoading.value = false;
  }

  Future<void> fetchProduct(int filter) async {
    isLoading.value = true;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    Uri uri;

    if (filter == 1) {
      uri = Uri.parse(
          'https://rusconsign.com/api/filter-products-by-mitra?mitra_id=$mitraId&category_id=2');
    } else if (filter == 2) {
      uri = Uri.parse(
          'https://rusconsign.com/api/filter-products-by-mitra?mitra_id=$mitraId&category_id=1');
    } else {
      uri = Uri.parse('https://rusconsign.com/api/mitra/barang/$mitraId');
    }

    final response = await http.get(
      uri,
      headers: <String, String>{
        'Authorization': "Bearer ${token.toString()}",
      },
    );

    if (response.statusCode == 200) {
      ProductMitraList data = productMitraListFromJson(response.body);
      productList.value = data.barangs;
    } else {
      productList.clear();
    }
    isLoading.value = false;
  }
}
