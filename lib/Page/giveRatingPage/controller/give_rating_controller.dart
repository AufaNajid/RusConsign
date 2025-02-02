// ignore_for_file: avoid_print, unnecessary_type_check

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Api/detail_barang_response.dart';


class GiveRatingController extends GetxController {
  final TextEditingController penilaianController = TextEditingController();
  RxBool isLoading = false.obs;
  var productDetail = Rxn<DetailBarangModel>();
  RxInt selectedRating = 0.obs;
  var avgRating = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    final productID = Get.arguments as int;
    fetchProduct(productID);
  }

  fetchProduct(int productID) async {
    isLoading(true);
    final response = await http
        .get(Uri.parse('https://rusconsign.com/api/barang/$productID'));

    if (response.statusCode == 200) {
      DetailBarangModel detailBarang = detailBarangModelFromJson(response.body);
      productDetail.value = detailBarang;

      if (detailBarang.ratingBarang is int) {
        avgRating.value = (detailBarang.ratingBarang).toDouble();
      } else if (detailBarang.ratingBarang is double) {
        avgRating.value =
            double.parse(detailBarang.ratingBarang.toStringAsFixed(2));
      }

    } else {
      print('Failed to fetch product: ${response.statusCode}');
    }
    isLoading(false);
  }

  Future<void> sendComment(String idBarang) async {
    isLoading.value = true;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    if (token == null) {
      Get.snackbar('Error', 'Token hilang');
      isLoading.value = false;
      return;
    }

    final uri =
    Uri.parse('https://rusconsign.com/api/add-komentar');
    final request = http.MultipartRequest('POST', uri);
    request.headers['Authorization'] = "Bearer $token";
    request.fields['komentar'] = penilaianController.text;
    request.fields['barang_id'] = idBarang;
    request.fields['rate'] = selectedRating.value.toString();

    var response = await request.send();
    print("Response status saat tambahkan komentar ${response.statusCode}");

    if (response.statusCode == 200 || response.statusCode == 201) {
      Get.offNamed("/menu");
    }
    isLoading.value = false;
  }
}