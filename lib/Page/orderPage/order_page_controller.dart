import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:rusconsign/Api/all_order_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrderPageController extends GetxController {
  RxBool isLoading = false.obs;
  final _selectedIndex = 0.obs;
  var productList = <Cod>[].obs;

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

  Future<void> updateComplete(int idPesanan) async {
    isLoading.value = true;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    final response = await http.put(
      Uri.parse(
          "https://rusconsign.com/api/cod/$idPesanan/complete?status_pembayaran=selesai"),
      headers: <String, String>{
        'Authorization': "Bearer $token",
      },
    );

    if (response.statusCode == 200) {
      await fetchPesanan(1);
    }
  }

  Future<void> cancelOrder(int idPesanan) async {
    isLoading.value = true;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    final response = await http.delete(
      Uri.parse(
          "https://rusconsign.com/api/cod/cancel/$idPesanan"),
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
    String? idUser = pref.getString('idUser');
    isLoading.value = true;
    Uri uri;

    switch (filter) {
      case 1:
        uri = Uri.parse("https://rusconsign.com/api/cods/user/progres/$idUser");
        break;
      case 2:
        uri = Uri.parse("https://rusconsign.com/api/cods/user/selesai/$idUser");
        break;
      case 3:
        uri = Uri.parse("https://rusconsign.com/api/cods/user/batal_pesanan/$idUser");
        break;
      default:
        uri = Uri.parse(
            "https://rusconsign.com/api/cods/user/belum_pembayaran/$idUser");
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
      productList.value = allOrderResponse.cods;
    } else {
      // Handle error
    }

    isLoading.value = false;
  }
}
