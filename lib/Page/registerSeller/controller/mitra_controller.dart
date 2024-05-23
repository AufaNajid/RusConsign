import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:rusconsign/Api/mitra_response.dart';
import 'package:path/path.dart';
import 'package:http_parser/http_parser.dart';

class MitraController extends GetxController {
  final TextEditingController namaController = TextEditingController();
  final TextEditingController namaTokoController = TextEditingController();
  final TextEditingController nisController = TextEditingController();
  final TextEditingController nomorController = TextEditingController();
  RxBool isLoading = false.obs;
  RxBool successfulRegister = false.obs;
  RxString message = "".obs;
  var pickedImage = Rx<File?>(null);

  Future<void> registermitra(
      String nama,
      String namaToko,
      int nis,
      String noDompetDigital,
      File imageIdCard,
      ) async {
    isLoading.value = true;
    try {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse("https://rusconsign.com/api/registermitra"),
      );

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

      var response = await request.send();

      print('Response status: ${response.statusCode}');

      if (response.statusCode == 200) {
        var responseBody = await response.stream.bytesToString();
        final data = json.decode(responseBody);
        Mitra mitra = Mitra.fromJson(data);
        successfulRegister.value = true;
        message.value = "Registration successful";
        print('Success: ${mitra.nama}');
      } else {
        var responseBody = await response.stream.bytesToString();
        final data = json.decode(responseBody);
        successfulRegister.value = false;
        if (data['errors'] != null) {
          message.value = data['errors'].toString();
        } else {
          message.value = data['message'] ?? 'Registration failed';
        }
        print('Failed to register: $responseBody');
      }
    } catch (e) {
      successfulRegister.value = false;
      message.value = 'An error occurred: $e';
      print('Error: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      pickedImage.value = File(pickedFile.path);
    }
  }
}