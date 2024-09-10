import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:rusconsign/Api/all_order_payment_mitra.dart';
import 'package:rusconsign/Api/all_order_payment_response.dart';
import 'package:rusconsign/Api/all_order_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrderPageController extends GetxController {
  RxBool isLoading = false.obs;
  final _selectedIndex = 0.obs;
  var productList = <Cod>[].obs;
  var pesananPaymentList = <Paymentt>[].obs;
  int get selectedIndex => _selectedIndex.value;

  void setSelectedFilter(int index) async {
    if (_selectedIndex.value != index) {
      _selectedIndex.value = index;
      await fetchPesanan(index);
      await fetchPesananPayment(index);
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchPesanan(0);
    fetchPesananPayment(0);
    // fetchPesananSelesaiPayment(2);
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

  Future<void> updatePaymentComplete(String external) async {
    isLoading.value = true;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    // Prepare the body with external_id and status
    Map<String, dynamic> requestBody = {
      'external_id': external,
      'status': "paid"
    };

    // Make the POST request with the required headers and body
    final response = await http.post(
      Uri.parse("https://rusconsign.com/api/payments/webhook/xendit"),
      headers: <String, String>{
        'Authorization': "Bearer $token",
        'Content-Type': 'application/json',  // Specify that the body is JSON
      },
      body: jsonEncode(requestBody),  // Encode the body to JSON format
    );

    // Debugging: print the status code
    print({response.statusCode});

    // Check for a successful response
    if (response.statusCode == 200) {
      await fetchPesanan(1);  // Refresh the payment list
    } else {
      // Handle error if needed
      print("Error: ${response.statusCode}");
    }

    isLoading.value = false;  // Update loading state
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

  Future<void> fetchPesananPayment(int filter) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String? idUser = pref.getString('idUser');
    isLoading.value = true;
    Uri uri;

    switch (filter) {
    // case 1:
    //   uri = Uri.parse("https://rusconsign.com/api/cods/mitra/progres/$idMitra");
    //   break;
    case 2:
      uri = Uri.parse("https://rusconsign.com/api/payments/user/selesai/$idUser");
      break;
      default:
        uri = Uri.parse("https://rusconsign.com/api/payments/user/progres/$idUser");
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
    print(response.body);

    if (response.statusCode == 200) {
      // final data = jsonDecode(response.body);
      final data = jsonDecode(response.body);
      final allOrderPaymentResponse = AllOrderPaymentMitraResponse.fromJson(data);
      pesananPaymentList.value = allOrderPaymentResponse.payments;
    } else {
      print("Response Status Penjualan = ${response.statusCode}");
    }

    isLoading.value = false;
  }

  // Future<void> fetchPesananSelesaiPayment(int filter) async {
  //   final SharedPreferences pref = await SharedPreferences.getInstance();
  //   String? idMitra = pref.getString('idMitra');
  //   isLoading.value = true;
  //   Uri uri;
  //
  //   switch (filter) {
  //   // case 1:
  //   //   uri = Uri.parse("https://rusconsign.com/api/cods/mitra/progres/$idMitra");
  //   //   break;
  //   // case 3:
  //   //   uri = Uri.parse("https://rusconsign.com/api/cods/mitra/batal_pesanan/$idMitra");
  //   //   break;
  //     default:
  //       uri = Uri.parse("https://rusconsign.com/api/payments/mitra/selesai/$idMitra");
  //       break;
  //   }
  //
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   final String? token = prefs.getString('token');
  //
  //   final response = await http.get(
  //     uri,
  //     headers: {
  //       'Authorization': 'Bearer $token',
  //       'Accept': 'application/json',
  //     },
  //   );
  //   print(response.body);
  //
  //   if (response.statusCode == 200) {
  //     // final data = jsonDecode(response.body);
  //     final data = jsonDecode(response.body);
  //     final allOrderPaymentResponse = AllOrderPaymentMitraResponse.fromJson(data);
  //     pesananPaymentList.value = allOrderPaymentResponse.payments;
  //   } else {
  //     print("Response Status Penjualan = ${response.statusCode}");
  //   }
  //
  //   isLoading.value = false;
  // }
}
