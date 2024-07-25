import 'dart:convert';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditDataProductController extends GetxController {
  var pickedImage = Rxn<File>();
  final TextEditingController namaPJController = TextEditingController();
  final TextEditingController deskripsiController = TextEditingController();
  final TextEditingController hargaController = TextEditingController();

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      pickedImage.value = File(pickedFile.path);
    }
  }

  Future<void> fetchData(int idBarang) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');

      if (token == null) {
        print('Token is null');
        return;
      }

      final response = await http.get(
        Uri.parse('https://rusconsign.com/api/barang/$idBarang'),
        headers: <String, String>{
          'Authorization': "Bearer $token",
        },
      );

      if (response.statusCode == 200) {
        final productData = jsonDecode(response.body);

        namaPJController.text = productData['namaBarang'];
        deskripsiController.text = productData['deskripsi'];
        hargaController.text = productData['harga'].toString();

        pickedImage.value = productData['imageBarang'] ?? "";
      } else {
        print('Failed to fetch data: ${response.statusCode}');
      }
    } catch (e) {
      print('Exception during fetch: $e');
    }
  }

  Future<void> updateData(int idBarang) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');

      final url = 'https://rusconsign.com/api/mitra/edit-barang/$idBarang';
      final response = await http.put(
        Uri.parse(url),
        headers: <String, String>{
          'Authorization': "Bearer ${token.toString()}",
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'namaBarang': namaPJController.text,
          'deskripsi': deskripsiController.text,
          'harga': int.parse(hargaController.text),
        }),
      );

      if (response.statusCode == 200) {
        print('Data updated successfully');
      } else {
        print('Failed to update data: ${response.statusCode}');
      }
    } catch (e) {
      print('Exception during update: $e');
    }
  }
}