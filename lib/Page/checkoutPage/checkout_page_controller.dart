// ignore_for_file: avoid_print

import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rusconsign/Api/detail_barang_response.dart';
import 'package:rusconsign/Api/lokasi_by_id.dart';
import 'package:rusconsign/Api/lokasi_response.dart';
import 'package:rusconsign/Api/testing_payment.dart';
import 'package:rusconsign/Page/webView/testing_web_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CheckoutPageController extends GetxController {
  var selectedPaymentMethod = 'Cash On Delivery (COD)'.obs;
  var selectedLeading = 'assets/images/cod.svg'.obs;
  var selectedTitle = 'Cash On Delivery (COD)'.obs;
  RxString titleLokasi = 'SMK Raden Umar Said Kudus'.obs;
  var descLokasi =
      'Jalan Sukun Raya No.09, Besito Kulon, Besito, Kec. Gebog, Kabupaten Kudus, Jawa Tengah 59333'
          .obs;
  var expanded = false.obs;
  RxBool successfulPesanProduct = false.obs;
  RxString message = "".obs;
  RxBool isLoading = false.obs;
  var productDetail = Rxn<DetailBarangModel>();
  var lokasi = <LokasiResponse>[].obs;
  var detailLokasi = Rxn<LokasiById>();
  var selectedLocationIndex = Rxn<int>();
  final Map<String, dynamic> productCheckoutData =
      Get.arguments != null ? Get.arguments as Map<String, dynamic> : {};

  void selectLocation(int index) {
    selectedLocationIndex.value = index + 1;
    fetchLokasiById(lokasi[index].id);
  }

  var items = <Map<String, String>>[
    {'title': 'E-Money', 'leading': 'assets/images/e-money.svg'},
  ].obs;

  @override
  void onInit() async {
    super.onInit();
    try {
      await fetchProduct(productCheckoutData["idProduct"]);
    } catch (e) {
      print('Null check error: $e');
    }
    fetchLokasi();
    fetchLokasiById(1);
  }

  void selectPaymentMethod(int index) {
    var selectedItem = items[index];

    var previousSelectedItem = {
      'title': selectedTitle.value,
      'leading': selectedLeading.value,
    };
    items[index] = previousSelectedItem;

    selectedPaymentMethod.value = selectedItem['title']!;
    selectedLeading.value = selectedItem['leading']!;
    selectedTitle.value = selectedItem['title']!;

    if (selectedItem['title'] != 'Cash On Delivery (COD)') {
      items.removeWhere((item) => item['title'] == 'Cash On Delivery (COD)');
      items.insert(0, {'title': 'Cash On Delivery (COD)', 'leading': 'assets/images/cod.svg'});
    }

    expanded.value = false;
    selectedPaymentMethod.refresh();
  }

  fetchLokasiById(int lokasiID) async {
    isLoading(true);
    final response = await http
        .get(Uri.parse('https://rusconsign.com/api/lokasi/$lokasiID'));

    if (response.statusCode == 200) {
      LokasiById lokasiDetail = lokasiByIdFromJson(response.body);
      detailLokasi.value = lokasiDetail;
    }
    isLoading(false);
  }

  fetchProduct(int productID) async {
    try {
      isLoading(true);
      final response = await http
          .get(Uri.parse('https://rusconsign.com/api/barang/$productID'));

      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        DetailBarangModel product = DetailBarangModel.fromJson(jsonResponse);
        productDetail.value = product;
      } else {
        print('Failed to fetch product: ${response.statusCode}');
      }

      isLoading(false);
    } catch (e) {
      print('Null check error: $e');
    }
  }

  fetchLokasi() async {
    isLoading(true);
    final response =
        await http.get(Uri.parse('https://rusconsign.com/api/lokasi'));

    if (response.statusCode == 200) {
      List<LokasiResponse> lokasiList = lokasiResponseFromJson(response.body);
      lokasi.value = lokasiList;
    }
  }

  Future<void> paymentTesting(String idBarang, String jumlah) async {
    isLoading.value = true;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    print('Token: $token');

    var request = http.MultipartRequest(
        'POST', Uri.parse("https://rusconsign.com/api/create-invoice"));
    request.headers['Authorization'] = 'Bearer $token';
    request.fields['barang_id'] = idBarang;
    request.fields['quantity'] = jumlah;

    var response = await request.send();

    var responseData = await response.stream.bytesToString();
    print('Response Status: ${response.statusCode}');
    print('Response Data: $responseData');

    if (response.statusCode == 200 || response.statusCode == 201) {
      var jsonResponse = json.decode(responseData);
      TestingPayment invoice = TestingPayment.fromJson(jsonResponse);

      isLoading.value = false;
      Get.to(() => TestingWebcView(url: invoice.invoiceUrl));
    } else {
      print('Error: ${response.statusCode}');
      isLoading.value = false;
      Get.snackbar('Error', 'Failed to create invoice',
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<void> addPesanan(String idProduct, String idMitra) async {
    isLoading.value = true;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    var request = http.MultipartRequest(
        'POST', Uri.parse("https://rusconsign.com/api/add-pembayaran-cod"));
    request.headers['Authorization'] = 'Bearer $token';

    request.fields['barang_id'] = idProduct;
    request.fields['lokasi_id'] =
        selectedLocationIndex.value?.toString() ?? "1";
    request.fields['quantity'] =
        productCheckoutData["quantityProduct"].toString();

    var response = await request.send();

    if (response.statusCode == 200 || response.statusCode == 201) {
      successfulPesanProduct.value = true;
      message.value = "Pesan Product Successfull";
    } else {
      print("Eror Pesan-Product ${response.statusCode}");
    }
  }
}
