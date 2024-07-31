// ignore_for_file: avoid_print, unnecessary_overrides, depend_on_referenced_packages

import 'dart:io';
import 'package:path/path.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http_parser/http_parser.dart';
import 'package:http/http.dart' as http;
import 'package:rusconsign/Api/edit_product_response.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';

class EditDataProductController extends GetxController {
  var pickedImage = Rxn<File>();
  var imageUrl = Rxn<String>();
  var isLoading = false.obs;

  final TextEditingController namaPJController = TextEditingController();
  final TextEditingController deskripsiController = TextEditingController();
  final TextEditingController hargaController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      pickedImage.value = File(pickedFile.path);
    }
  }

  Future<void> fetchData(int idBarang) async {
    isLoading.value = true;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    if (token == null) {
      Get.snackbar('Error', 'Token hilang');
      isLoading.value = false;
      return;
    }

    final response = await http.get(
      Uri.parse('https://rusconsign.com/api/barang/$idBarang'),
      headers: <String, String>{
        'Authorization': "Bearer $token",
      },
    );

    if (response.statusCode == 200) {
      EditProductResponse data = editProductResponseFromJson(response.body);

      namaPJController.text = data.barang.namaBarang;
      deskripsiController.text = data.barang.deskripsi;
      hargaController.text = data.barang.harga.toString();
      imageUrl.value = 'https://rusconsign.com/api${data.barang.imageBarang}';
      pickedImage.value = null;
    } else {
      Get.snackbar('Error', 'Ada data error: ${response.statusCode}');
    }

    isLoading.value = false;
  }

  Future<void> updateData(int idBarang) async {
    isLoading.value = true;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    if (token == null) {
      Get.snackbar('Error', 'Token hilang');
      isLoading.value = false;
      return;
    }

    final uri =
        Uri.parse('https://rusconsign.com/api/mitra/edit-barang/$idBarang');
    final request = http.MultipartRequest('POST', uri);
      request.headers['Authorization'] = "Bearer $token";
      request.fields['nama_barang'] = namaPJController.text;
      request.fields['deskripsi'] = deskripsiController.text;
      request.fields['harga'] = hargaController.text;


    if (pickedImage.value != null) {
      print("data galeri");
      imageUrl.value = null;
    var imageStream = http.ByteStream(pickedImage.value!.openRead());
    var imageLength = await pickedImage.value!.length();
      request.files.add(
        http.MultipartFile(
          'image_barang',
          imageStream,
          imageLength,
          filename: basename(pickedImage.value!.path),
          contentType: MediaType('image', 'jpeg,img,png,jpg'),
        ),
      );
    } else {
      print("data bawaan");
    }

    var response = await request.send();

    if (response.statusCode == 200 || response.statusCode == 201) {
      final responseBody = await response.stream.bytesToString();
      print(responseBody);
      Get.snackbar('Success', 'Data berhasil diperbarui');
    } else if (response.statusCode == 302) {
      print('Redirection found: ${response.headers['location']}');
      Get.snackbar(
          'Error', 'Redirection found: ${response.headers['location']}');
    } else {
      print('Ada kesalahan: ${response.statusCode}');
      Get.snackbar('Error', 'Ada kesalahan: ${response.statusCode}');
    }
    isLoading.value = false;
  }
}
