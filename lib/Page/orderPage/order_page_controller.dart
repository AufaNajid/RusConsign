import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:rusconsign/Api/AllOrderResponse.dart';
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

  Future<void> fetchPesanan(int filter) async {
    isLoading.value = true;
    Uri uri;

    switch (filter) {
      case 1:
        uri = Uri.parse("https://rusconsign.com/api/cods/status/user/progres");
        break;
      case 2:
        uri = Uri.parse("https://rusconsign.com/api/cods/status/user/selesai");
        break;
      default:
        uri = Uri.parse("https://rusconsign.com/api/cods/status/user/pending");
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
