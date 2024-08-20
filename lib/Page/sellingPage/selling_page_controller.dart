import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../Api/AllOrderResponse.dart';

class SellingPageController extends GetxController {
  RxBool isLoading = false.obs;
  final _selectedIndex = 0.obs;
  var pesananList = <Cod>[].obs;

  int get selectedIndex => _selectedIndex.value;

  void setSelectedFilter(int index) async {
    if (_selectedIndex.value != index) {
      _selectedIndex.value = index;
      await fetchPesanan(index);
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchPesanan(0);
  }

  Future<void> updateProgress(int idPesanan) async {
    isLoading.value = true;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    final response = await http.put(
      Uri.parse(
          "https://rusconsign.com/api/cod/$idPesanan/update-status?status_pembayaran=progres"),
      headers: <String, String>{
        'Authorization': "Bearer $token",
      },
    );

    if (response.statusCode == 200) {
      await fetchPesanan(0);
    }
  }

  Future<void> fetchPesanan(int filter) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String? idMitra = pref.getString('idMitra');
    isLoading.value = true;
    Uri uri;

    switch (filter) {
      case 1:
        uri = Uri.parse("https://rusconsign.com/api/cods/mitra/progres/$idMitra");
        break;
      case 2:
        uri = Uri.parse("https://rusconsign.com/api/cods/mitra/selesai/$idMitra");
        break;
      case 3:
        uri = Uri.parse("https://rusconsign.com/api/cods/mitra/batal_pesanan/$idMitra");
        break;
      default:
        uri = Uri.parse(
            "https://rusconsign.com/api/cods/mitra/belum_pembayaran/$idMitra");
        break;
    }

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');

    final response = await http.get(
      uri,
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {

      final data = jsonDecode(response.body);
      final allOrderResponse = AllOrderResponse.fromJson(data);
      pesananList.value = allOrderResponse.cods;
    } else {
      print("Response Status Penjualan = ${response.statusCode}");
    }

    isLoading.value = false;
  }
}
