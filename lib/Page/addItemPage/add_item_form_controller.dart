// ignore_for_file: avoid_print, unnecessary_overrides

import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart';
import 'package:http_parser/http_parser.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:rusconsign/Api/add_barang_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddItemFormController extends GetxController {
  // final TextEditingController namaController = TextEditingController();
  // final TextEditingController namajasaController = TextEditingController();
  // final TextEditingController namaTokoController = TextEditingController();
  // final TextEditingController nisController = TextEditingController();
  // final TextEditingController nomorController = TextEditingController();
  final TextEditingController namaproductController = TextEditingController();
  final TextEditingController deskripsiController = TextEditingController();
  final TextEditingController hargaController = TextEditingController();
  final TextEditingController ratingController = TextEditingController();
  // final TextEditingController imageController = TextEditingController();
  final currentIndex = 0.obs;
  final _selectedIndex = 0.obs;
  RxBool successfulAddProduct = false.obs;
  RxBool isLoading = false.obs;
  RxBool successfulRegister = false.obs;
  RxBool successfulAddJasa = false.obs;
  RxString message = "".obs;
  var pickedImage = Rxn<File>();

  int get selectedIndex => _selectedIndex.value;

  @override
  void onInit() {
    super.onInit();
    // print("AddItemFormController initializaed");
  }

  void updateCurrentIndexIndicator(int index) {
    currentIndex.value = index;
  }

  void setSelectedFilter(int index) {
    _selectedIndex.value = index;
    update();
    _selectedIndex.refresh();
    print("Selected Index adalah ${_selectedIndex}");
  }

  Future<void> addProduct(File imageProduct,
      String namaProduk, String descProduk, String harga ) async {
    isLoading.value = true;
    String category = _selectedIndex.value.toString();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    print("Token Update Barang ${token}");

    var request = http.MultipartRequest(
      'POST',
      Uri.parse("https://rusconsign.com/api/add-barang")
    );

    request.headers['Authorization'] = 'Bearer $token';

    request.fields['nama_barang'] = namaProduk;
    request.fields['deskrpsi'] = descProduk;
    request.fields["harga"] = harga;
    request.fields["rating_barang"] = category;
    request.fields["category_id"] = category;

    var imageStream = http.ByteStream(imageProduct.openRead());
    var imageLength = await imageProduct.length();
    var multipartFile = http.MultipartFile(
      'image_barang',
      imageStream,
      imageLength,
      filename: basename(imageProduct.path),
      contentType: MediaType('image', 'jpeg'),
    );
    request.files.add(multipartFile);

    print(
        "Sending request with fields: ${request.fields} and file: ${multipartFile.filename}");

    var response = await request.send();

    print("Response status: ${response.statusCode}");

    if (response.statusCode == 200 || response.statusCode == 201) {
      var responseBody = await response.stream.bytesToString();
      final data =  json.decode(responseBody);
      Product product = Product.fromJson(data);
      successfulAddProduct.value = true;
      message.value = "Add Product Successful";
      print("Success: ${product.namaBarang}");
      isLoading.value = false;
    } else {
      print("Eror Add-Product ${response.statusCode}");
    }

  }

}