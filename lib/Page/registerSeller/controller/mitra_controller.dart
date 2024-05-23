// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:rusconsign/Api/mitra_response.dart';

class MitraController extends GetxController {
  final TextEditingController imageProfileController = TextEditingController();
  final TextEditingController namaController = TextEditingController();
  final TextEditingController namaTokoController = TextEditingController();
  final TextEditingController nisController = TextEditingController();
  final TextEditingController nomorController = TextEditingController();
  final TextEditingController imageController = TextEditingController();
  final TextEditingController statusController = TextEditingController();
  final TextEditingController pengikutController = TextEditingController();
  final TextEditingController jumlahProductController = TextEditingController();
  final TextEditingController jumlahJasaController = TextEditingController();
  final TextEditingController penilaianController = TextEditingController();
  RxBool isLoading = false.obs;
  RxBool successfulRegister = false.obs;
  RxString message = "".obs;

  Future<void> registermitra(
      String nama,
      String namaToko,
      int nis,
      String nomor,
      String image,
      ) async {
    isLoading.value = true;
    try {
      final response = await http.post(
        Uri.parse("https://rusconsign.com/api/registermitra"),
        headers: <String, String>{
          'Content-Type': 'application/x-www-form-urlencoded',
          'Accept': 'application/json',
        },
        body: <String, String>{
          'nama_lengkap': nama,
          'nama_toko': namaToko,
          'nis': nis.toString(),
          'nomor': nomor,
          'image': image,
        },
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        Mitra mitra = Mitra.fromJson(data);
        successfulRegister.value = true;
        message.value = "Registration successful";
        print('Success: ${mitra.nama}');
      } else {
        final data = json.decode(response.body);
        successfulRegister.value = false;
        message.value = data['message'] ?? 'Registration failed';
        print('Failed to register: ${response.body}');
      }
    } catch (e) {
      successfulRegister.value = false;
      message.value = 'An error occurred: $e';
      print('Error: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
