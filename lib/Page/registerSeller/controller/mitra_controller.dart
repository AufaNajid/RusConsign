// ignore_for_file: unused_import, depend_on_referenced_packages, unnecessary_overrides, avoid_print, unrelated_type_equality_checks

import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:http_parser/http_parser.dart';
import 'package:rusconsign/Api/User_service.dart';
import 'package:rusconsign/Api/mitra_response.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
  RxBool successfulEditProduct = false.obs;
  RxBool successfulDestroyProduct = false.obs;
  RxBool successfulEditJasa = false.obs;
  RxBool successfulDestroyJasa = false.obs;
  RxString message = "".obs;
  RxBool isPending = false.obs;
  RxBool isAccepted = false.obs;
  var pickedImage = Rx<File?>(null);
  var mitraId = 0.obs;

  @override
  void onInit() {
    super.onInit();
    // print("MitraController initialized");
  }

  Future<void> registerMitra(String nama, String namaToko, int nis, String noDompetDigital, File imageIdCard) async {
    isLoading.value = true;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token =prefs.getString('token');

    var request = http.MultipartRequest(
      'POST',
      Uri.parse("https://rusconsign.com/api/registermitra"),
    );

    request.headers['Authorization'] = 'Bearer $token';

    request.fields['nama_lengkap'] = nama;
    request.fields['nama_toko'] = namaToko;
    request.fields['nis'] = nis.toString();
    request.fields['no_dompet_digital'] = noDompetDigital;

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

    print("Sending request with fields: ${request.fields} and file: ${multipartFile.filename}");

    var response = await request.send();

    print("Response status: ${response.statusCode}");


    if (response.statusCode == 200 || response.statusCode == 201) {
      var responseBody = await response.stream.bytesToString();
      final data = json.decode(responseBody);
      Mitra mitra = Mitra.fromJson(data);
      successfulRegister.value = true;
      message.value = "Registration successful";
      print('Success: ${mitra.namaLengkap}');
      mitraId.value = mitra.id;
    } else {
      var responseBody = await response.stream.bytesToString();
      final data = json.decode(responseBody);
      successfulRegister.value = false;
      message.value = data['message'] ?? 'Registration failed';
      print('Failed to register: $responseBody');
      isLoading.value = false;
      return;
    }

    String? status = await getMitraStatus(mitraId.value);
    if (status == 'accepted') {
      updateSellerProfile(mitraId.value);
    } else if (status == 'pending') {
      isPending.value = true;
      print('Registration is pending. Waiting for approval.');
    }

    isLoading.value = false;
  }

  Future<void> pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      pickedImage.value = File(pickedFile.path);
    }
  }

  void updateSellerProfile(int mitraId) {
    isAccepted.value = true;
    print('Seller profile updated after acceptance by admin for Mitra ID: $mitraId');
  }

  bool canAccessFunction(int mitraId) {
    return getMitraStatus(mitraId) == 'accepted';
  }

  void someRestrictedFunction() {
    if (canAccessFunction(mitraId.value)) {
      print('Akses diberikan untuk Mitra ID: ${mitraId.value}');
    } else {
      print('Akses ditolak untuk Mitra ID: ${mitraId.value}');
    }
  }

  Future<String?> getMitraStatus(int mitraId) async {
    return await UserService.getMitraStatus(mitraId);
  }
}