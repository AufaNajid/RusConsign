// ignore_for_file: avoid_print, unnecessary_overrides

import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class AddItemFormController extends GetxController {
  final TextEditingController namaController = TextEditingController();
  final TextEditingController namajasaController = TextEditingController();
  final TextEditingController namaTokoController = TextEditingController();
  final TextEditingController nisController = TextEditingController();
  final TextEditingController nomorController = TextEditingController();
  final TextEditingController namaproductController = TextEditingController();
  final TextEditingController deskripsiController = TextEditingController();
  final TextEditingController hargaController = TextEditingController();
  final TextEditingController ratingController = TextEditingController();
  final TextEditingController imageController = TextEditingController();
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
    // print("AddItemFormController initialized");
  }

  void updateCurrentIndexIndicator(int index) {
    currentIndex.value = index;
  }

  void setSelectedFilter(int index) {
    _selectedIndex.value = index;
    update();
    _selectedIndex.refresh();
    print(index);
  }

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      pickedImage.value = File(pickedFile.path);
    }
  }

  Future<void> addProduct(int mitraId) async {
    isLoading.value = true;

    try {
      if (canAccessFunction(mitraId)) {
        final productData = _buildProductData(mitraId);

        final response = await _postRequest(
          'https://rusconsign.com/api/add-product',
          productData,
        );

        if (response.statusCode == 201) {
          successfulAddProduct.value = true;
          message.value = 'Produk berhasil ditambahkan';
        } else {
          successfulAddProduct.value = false;
          message.value = 'Gagal menambahkan produk';
          print('Failed to add product: ${response.body}');
        }
      } else {
        successfulAddProduct.value = false;
        message.value = 'Mitra belum diterima';
        print('Mitra status: pending or rejected');
      }
    } catch (e) {
      successfulAddProduct.value = false;
      message.value = 'Terjadi kesalahan: $e';
      print('Error: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> addJasa(int mitraId) async {
    isLoading.value = true;

    try {
      if (canAccessFunction(mitraId)) {
        final jasaData = _buildJasaData(mitraId);

        final response = await _postRequest(
          'https://rusconsign.com/api/add-jasa',
          jasaData,
        );

        if (response.statusCode == 201) {
          successfulAddJasa.value = true;
          message.value = 'Jasa berhasil ditambahkan';
        } else {
          successfulAddJasa.value = false;
          message.value = 'Gagal menambahkan jasa';
          print('Failed to add jasa: ${response.body}');
        }
      } else {
        successfulAddJasa.value = false;
        message.value = 'Mitra belum diterima';
        print('Mitra status: pending or rejected');
      }
    } catch (e) {
      successfulAddJasa.value = false;
      message.value = 'Terjadi kesalahan: $e';
      print('Error: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<http.Response> _postRequest(String url, Map<String, String> data) async {
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(data),
      );
      return response;
    } catch (e) {
      print('Error making POST request: $e');
      rethrow;
    }
  }

  Map<String, String> _buildProductData(int mitraId) {
    return {
      'name_product': namaproductController.text,
      'desc_product': deskripsiController.text,
      'price_product': hargaController.text,
      'rating_product': ratingController.text,
      'image': imageController.text,
      'mitra_id': mitraId.toString(),
    };
  }

  Map<String, String> _buildJasaData(int mitraId) {
    return {
      'name_jasa': namajasaController.text,
      'desc_jasa': deskripsiController.text,
      'price_jasa': hargaController.text,
      'rating_jasa': ratingController.text,
      'image_jasa': imageController.text,
      'mitra_id': mitraId.toString(),
    };
  }

  bool canAccessFunction(int mitraId) {
    return getMitraStatus(mitraId) == 'accepted';
  }

  String getMitraStatus(int mitraId) {
    if (mitraId == 123) {
      return 'accepted';
    } else {
      return 'pending';
    }
  }
}