import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:http_parser/http_parser.dart';
import 'package:rusconsign/Api/mitra_response.dart';

import '../../../Api/product_response.dart';

class MitraController extends GetxController {
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
  RxBool isLoading = false.obs;
  RxBool successfulRegister = false.obs;
  RxBool successfulAddProduct = false.obs;
  RxBool successfulEditProduct = false.obs;
  RxBool successfulDestroyProduct = false.obs;
  RxBool successfulAddJasa = false.obs;
  RxBool successfulEditJasa = false.obs;
  RxBool successfulDestroyJasa = false.obs;
  RxString message = "".obs;
  RxBool isPending = false.obs;
  RxBool isAccepted = true.obs;
  var pickedImage = Rx<File?>(null);

  Future<void> registerMitra(String nama,
      String namaToko,
      int nis,
      String no_dompet_digital,
      File imageIdCard,) async {
    isLoading.value = true;

    var request = http.MultipartRequest(
      'POST',
      Uri.parse("https://rusconsign.com/api/registermitra"),
    );

    request.fields['nama_lengkap'] = nama;
    request.fields['nama_toko'] = namaToko;
    request.fields['nis'] = nis.toString();
    request.fields['no_dompet_digital'] = no_dompet_digital;

    var imageStream = http.ByteStream(imageIdCard.openRead());
    var imageLength = await imageIdCard.length();
    var multipartFile = http.MultipartFile(
      'image_id_card',
      imageStream,
      imageLength,
      filename: basename(imageIdCard.path),
      contentType: MediaType('image', 'jpeg'),
    );
    request.files.add(multipartFile);

    print(
        "Sending request with fields: ${request
            .fields} and file: ${multipartFile.filename}");

    var response = await request.send();

    print("Response status: ${response.statusCode}");

    if (response.statusCode == 200 || response.statusCode == 201) {
      var responseBody = await response.stream.bytesToString();
      final data = json.decode(responseBody);
      Mitra mitra = Mitra.fromJson(data);
      successfulRegister.value = true;
      message.value = "Registration successful";
      print('Success: ${mitra.nama}');
      if (mitra.status == 'accepted') {
        updateSellerProfile();
      } else if (mitra.status == 'pending') {
        isPending.value = true;
        print('Registration is pending. Waiting for approval.');
      }
    } else {
      var responseBody = await response.stream.bytesToString();
      final data = json.decode(responseBody);
      successfulRegister.value = false;
      message.value = data['message'] ?? 'Registration failed';
      print('Failed to register: $responseBody');
    }
  }

  Future<void> pickImage() async {
    final pickedFile =
    await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      pickedImage.value = File(pickedFile.path);
    }
  }

  Future<void> addProduct(int mitraId) async {
    isLoading.value = true;

    try {
      final mitraResponse = await http
          .get(Uri.parse('https://rusconsign.com/api/mitra/$mitraId'));

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
            Uri.parse('https://rusconsign.com/api/add-product'),
            headers: {'Content-Type': 'application/json'},
            body: json.encode(productData),
          );
          if (response.statusCode == 201) {
            successfulAddProduct.value = true; // Fixed variable name
            message.value = 'Produk berhasil ditambahkan';
          } else {
            successfulAddProduct.value = false; // Fixed variable name
            message.value = 'Gagal menambahkan produk';
            print('Failed to add product: ${response.body}');
          }
        } else {
          successfulAddProduct.value = false; // Fixed variable name
          message.value = 'Mitra belum diterima';
          print('Mitra status: ${mitraData['status']}');
        }
      } else {
        successfulAddProduct.value = false; // Fixed variable name
        message.value = 'Gagal mengambil data mitra';
        print('Failed to fetch mitra data: ${mitraResponse.body}');
      }
    } catch (e) {
      successfulAddProduct.value = false; // Fixed variable name
      message.value = 'Terjadi kesalahan: $e';
      print('Error: $e');
    } finally {
      isLoading.value = false;
    }
  }

  void updateSellerProfile() {
    isAccepted.value = true;
    print('Seller profile updated after acceptance by admin');
  }

  Future<void> addJasa(int mitraId) async {
    isLoading.value = true;

    try {
      final mitraResponse = await http.get(
          Uri.parse('https://rusconsign.com/api/mitra/$mitraId'));

      if (mitraResponse.statusCode == 200) {
        final mitraData = json.decode(mitraResponse.body);

        if (mitraData['status'] == 'accepted') {
          final jasaData = {
            'name_jasa': namajasaController.text,
            'desc_jasa': deskripsiController.text,
            'price_jasa': hargaController.text,
            'rating_jasa': ratingController.text,
            'image_jasa': imageController.text,
            'mitra_id': mitraId.toString(),
          };

          final response = await http.post(
            Uri.parse('https://rusconsign.com/api/add-jasa'),
            headers: {'Content-Type': 'application/json'},
            body: json.encode(jasaData),
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
          print('Mitra status: ${mitraData['status']}');
        }
      } else {
        successfulAddJasa.value = false;
        message.value = 'Gagal mengambil data mitra';
        print('Failed to fetch mitra data: ${mitraResponse.body}');
      }
    } catch (e) {
      successfulAddJasa.value = false;
      message.value = 'Terjadi kesalahan: $e';
      print('Error: $e');
    } finally {
      isLoading.value = false;
    }
  }
  Future<void> editProduct(int productId) async {
    isLoading.value = true;

    try {
      final productResponse = await http.get(
          Uri.parse('https://rusconsign.com/api/product/$productId'));

      if (productResponse.statusCode == 200) {
        final productData = json.decode(productResponse.body);


        final editedProductData = {
          'name_product': namaproductController.text,
          'desc_product': deskripsiController.text,
          'price_product': hargaController.text,
          'rating_product': ratingController.text,
          'image': imageController.text,
        };

        final response = await http.put(
          Uri.parse('https://rusconsign.com/api/edit-products/$productId'),
          headers: {'Content-Type': 'application/json'},
          body: json.encode(editedProductData),
        );

        if (response.statusCode == 200) {
          successfulEditProduct.value = true;
          message.value = 'Produk berhasil diubah';
        } else {
          successfulEditProduct.value = false;
          message.value = 'Gagal mengubah produk';
          print('Failed to edit product: ${response.body}');
        }
      } else {
        successfulEditProduct.value = false;
        message.value = 'Gagal mengambil data produk';
        print('Failed to fetch product data: ${productResponse.body}');
      }
    } catch (e) {
      successfulEditProduct.value = false;
      message.value = 'Terjadi kesalahan: $e';
      print('Error: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> destroyProduct(int productId) async {
    isLoading.value = true;

    try {
      final response = await http.delete(
        Uri.parse('https://rusconsign.com/api/products/$productId'),
      );

      if (response.statusCode == 200) {
        successfulDestroyProduct.value = true;
        message.value = 'Produk berhasil dihapus';
      } else {
        successfulDestroyProduct.value = false;
        message.value = 'Gagal menghapus produk';
        print('Failed to delete product: ${response.body}');
      }
    } catch (e) {
      successfulDestroyProduct.value = false;
      message.value = 'Terjadi kesalahan: $e';
      print('Error: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> editJasa(int jasaId) async {
    isLoading.value = true;

    try {
      final jasaData = {
        'name_jasa': namajasaController.text,
        'desc_jasa': deskripsiController.text,
        'price_jasa': hargaController.text,
        'rating_jasa': ratingController.text,
        'image_jasa': imageController.text,
      };

      final response = await http.put(
        Uri.parse('https://rusconsign.com/api/jasa/$jasaId'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(jasaData),
      );

      if (response.statusCode == 200) {
        successfulEditJasa.value = true;
        message.value = 'Jasa berhasil diubah';
      } else {
        successfulEditJasa.value = false;
        message.value = 'Gagal mengubah jasa';
        print('Failed to edit jasa: ${response.body}');
      }
    } catch (e) {
      successfulEditJasa.value = false;
      message.value = 'Terjadi kesalahan: $e';
      print('Error: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> destroyJasa(int jasaId) async {
    isLoading.value = true;

    try {
      final response = await http.delete(
        Uri.parse('https://rusconsign.com/api/jasa/$jasaId'),
      );

      if (response.statusCode == 200) {
        successfulDestroyJasa.value = true;
        message.value = 'Jasa berhasil dihapus';
      } else {
        successfulDestroyJasa.value = false;
        message.value = 'Gagal menghapus jasa';
        print('Failed to delete jasa: ${response.body}');
      }
    } catch (e) {
      successfulDestroyJasa.value = false;
      message.value = 'Terjadi kesalahan: $e';
      print('Error: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<Product> fetchProduct(int productId) async {
    final response = await http.get(Uri.parse('https:/https://rusconsign.com/api/product'));

    if (response.statusCode == 200) {
      return Product.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load product');
    }
  }

}
