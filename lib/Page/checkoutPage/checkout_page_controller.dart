import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rusconsign/Api/all_barang_response.dart';
import 'package:rusconsign/Api/testing_payment.dart';
import 'package:rusconsign/Page/webView/testing_web_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CheckoutPageController extends GetxController {
  var selectedPaymentMethod = 'QRIS'.obs;
  var selectedLeading = 'assets/images/qris.svg'.obs;
  var selectedTitle = 'QRIS'.obs;
  RxString titleLokasi = 'SMK Raden Umar Said Kudus'.obs;
  var descLokasi =
      'Jalan Sukun Raya No.09, Besito Kulon, Besito, Kec. Gebog, Kabupaten Kudus, Jawa Tengah 59333'
          .obs;
  var expanded = false.obs;
  RxBool successfulPesanProduct = false.obs;
  RxString message = "".obs;
  RxBool isLoading = false.obs;
  var productDetail = Rxn<Barang>();

  var items = <Map<String, String>>[
    {'title': 'Dana', 'leading': 'assets/images/dana.svg'},
    {'title': 'Gopay', 'leading': 'assets/images/gopay.svg'},
    {'title': 'OVO', 'leading': 'assets/images/ovo.svg'},
    {'title': 'Cash On Delivery (COD)', 'leading': 'assets/images/cod.svg'},
  ].obs;

  @override
  void onInit() {
    super.onInit();
    final productID = Get.arguments as int;
    fetchProduct(productID);
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

    if (selectedItem['title'] != 'QRIS') {
      items.removeWhere((item) => item['title'] == 'QRIS');
      items.insert(0, {'title': 'QRIS', 'leading': 'assets/images/qris.svg'});
    }

    expanded.value = false;
    selectedPaymentMethod.refresh();
  }

  fetchProduct(int productID) async {
    isLoading(true);
    final response = await http
        .get(Uri.parse('https://rusconsign.com/api/barang/$productID'));

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      Barang product = Barang.fromJson(jsonResponse['barang']);
      productDetail.value = product;
    } else {
      print('Failed to fetch product: ${response.statusCode}');
    }

    isLoading(false);
  }

  Future<void> paymentTesting(String idBarang, String jumlah) async {
    isLoading.value = true;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    var request = http.MultipartRequest(
        'POST', Uri.parse("https://rusconsign.com/api/create-invoice"));
    request.headers['Authorization'] = 'Bearer $token';
    request.fields['barang id'] = idBarang;
    request.fields['quantity'] = jumlah;

    var response = await request.send();

    if (response.statusCode == 200 || response.statusCode == 201) {
      var responseData = await response.stream.bytesToString();
      var jsonResponse = json.decode(responseData);
      TestingPayment invoice = TestingPayment.fromJson(jsonResponse);

      isLoading.value = false;
      Get.to(() => TestingWebcView(url: invoice.invoiceUrl));
    } else {
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
    // request.fields['mitra_id'] = idMitra;
    request.fields['lokasi_id'] = "1";
    request.fields['quantity'] = "1";

    var response = await request.send();

    if (response.statusCode == 200 || response.statusCode == 201) {
      successfulPesanProduct.value = true;
      message.value = "Pesan Product Successfull";
    } else {
      print("Eror Pesan-Product ${response.statusCode}");
    }
  }
}
