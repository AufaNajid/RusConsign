import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProductController extends GetxController {
  final TextEditingController namaproductController = TextEditingController();
  final TextEditingController deskripsiController = TextEditingController();
  final TextEditingController hargaController = TextEditingController();
  final TextEditingController ratingController = TextEditingController();
  final TextEditingController imageController = TextEditingController();
  RxBool isLoading = false.obs;
  RxBool successfulRegister = false.obs;
  RxString message = "".obs;

  final String apiUrl = 'http://rusconsign.com/add-product';
  final String mitraUrl = 'http://rusconsign.com/mitra';

  Future<void> addProduct(int mitraId) async {
    isLoading.value = true;

    try {
      final mitraResponse = await http.get(Uri.parse('$mitraUrl/$mitraId'));

      if (mitraResponse.statusCode == 200) {
        final mitraData = json.decode(mitraResponse.body);
        if (mitraData['status'] == 'accepted') {
          final productData = {
            'name_product': namaproductController.text,
            'desc_product': deskripsiController.text,
            'price_product': hargaController.text,
            'rating_product': ratingController.text,
            'image': imageController.text,
            'mitra_id': mitraId.toString(),
          };

          final response = await http.post(
            Uri.parse(apiUrl),
            headers: {'Content-Type': 'application/json'},
            body: json.encode(productData),
          );

          if (response.statusCode == 201) {
            successfulRegister.value = true;
            message.value = 'Produk berhasil ditambahkan';
          } else {
            successfulRegister.value = false;
            message.value = 'Gagal menambahkan produk';
          }
        } else {
          successfulRegister.value = false;
          message.value = 'Mitra belum diterima';
        }
      } else {
        successfulRegister.value = false;
        message.value = 'Gagal mendapatkan data mitra';
      }
    } catch (e) {
      successfulRegister.value = false;
      message.value = 'Terjadi kesalahan: $e';
    } finally {
      isLoading.value = false;
    }
  }

  // Clean up the controllers when the controller is disposed
  @override
  void onClose() {
    namaproductController.dispose();
    deskripsiController.dispose();
    hargaController.dispose();
    ratingController.dispose();
    imageController.dispose();
    super.onClose();
  }
}
