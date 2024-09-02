import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../Api/all_profile_response.dart';

class AuthLoginController extends GetxController {
  late SharedPreferences prefs;
  static final box = GetStorage();
  final TextEditingController emailTextEditingController =
      TextEditingController();
  final TextEditingController passwordTextEditingController =
      TextEditingController();
  RxBool isLoading = false.obs;
  RxBool successfulLogin = false.obs;
  RxString message = ''.obs;
  RxString dataUsername = ''.obs;
  RxString dataEmail = ''.obs;
  RxInt dataJumJasa = 0.obs;
  RxInt dataJumProduk = 0.obs;
  RxInt dataPenilaian = 0.obs;
  RxInt dataPengikut = 0.obs;
  RxString dataBio = ''.obs;
  RxString dataImageUrl = ''.obs;

  @override
  void onInit() async {
    super.onInit();
    prefs = await SharedPreferences.getInstance();
    successfulLogin.value = box.read('done') ?? false;
    if (successfulLogin.value) {
      await emailData();
    }
  }

  Future<void> checkUserStatus() async {
    prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    if (token != null && dataEmail.isNotEmpty) {
      Get.offNamed("/menu");
    } else {
      Get.offNamed("/login");
    }
  }

  void loadData() async {
    prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('token')) {
      await emailData();
    }
  }

  void logout() async {
    successfulLogin.value = false;
    box.write('done', successfulLogin.value);
    await prefs.remove('token');
    update();
    Get.offAllNamed('/login');
  }

  Future<void> login(String email, String password) async {
    isLoading.value = true;
    final response = await http.post(
      Uri.parse('https://rusconsign.com/api/login'),
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded',
        'Accept': 'application/json',
      },
      body: <String, String>{
        'email': email,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      bool status = jsonResponse['status'];
      String message = jsonResponse['message'];
      String? token = jsonResponse['token'];
      print(token);

      if (status) {
        await prefs.setString('token', token!);
        this.message.value = message;
        successfulLogin.value = true;
        box.write('done', successfulLogin.value);

        box.write('email', email);
        await emailData();
      } else {
        this.message.value = message;
        successfulLogin.value = false;
      }
    } else {
      successfulLogin.value = false;
      message.value = 'gagalDesc'.tr;
    }
    isLoading.value = false;
  }

  Future<void> emailData() async {
    String? token = prefs.getString('token');
    print("Token User adalah $token");
    if (token != null) {
      var response = await http.get(
        Uri.parse("https://rusconsign.com/api/allprofile"),
        headers: {"Authorization": "Bearer $token"},
      );
      if (response.statusCode == 200) {
        ModelResponseProfile responseProfile =
            modelResponseProfileFromJson(response.body);
        jsonDecode(response.body);
        dataJumJasa.value = responseProfile.data.jumlahjasa ?? 0;
        dataUsername.value = responseProfile.data.name.toString();
        dataEmail.value = responseProfile.data.email.toString();
        dataJumProduk.value = responseProfile.data.jumlahproduct ?? 0;
        dataPenilaian.value = responseProfile.data.penilaian ?? 0;
        dataPengikut.value = responseProfile.data.pengikut ?? 0;
        dataBio.value = responseProfile.data.bioDesc ?? 'Deskripsi Masih Kosong';
        dataImageUrl.value = responseProfile.data.imageProfiles.toString();
        print(prefs.getString("statusMitra"));
      } else {
        print("Eror FetchingProfile${response.statusCode}");
      }
    }
  }
}
