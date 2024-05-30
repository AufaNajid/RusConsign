import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthLoginController extends GetxController {
  late SharedPreferences prefs;
  static final box = GetStorage();
  final TextEditingController emailTextEditingController = TextEditingController();
  final TextEditingController passwordTextEditingController = TextEditingController();
  RxBool isLoading = false.obs;
  RxBool successfulLogin = false.obs;
  RxString message = ''.obs;
  RxString dataUsername = ''.obs;

  @override
  void onInit() {
    super.onInit();
    successfulLogin.value = box.read('done') ?? false;
    loadData();
  }

  loadData() async {
    prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('token')) {
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
    try {
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
        String? username = jsonResponse['username'];

        dataUsername.value = username.toString(); 

        if (status) {
          await prefs.setString('token', token!);
          this.message.value = message;
          successfulLogin.value = true;
          box.write('username', username);
          box.write('done', successfulLogin.value);
        } else {
          this.message.value = message;
          successfulLogin.value = false;
        }
      } else {
        successfulLogin.value = false;
        message.value = 'Failed to load data';
      }
    } catch (e) {
      successfulLogin.value = false;
      message.value = 'An error occurred: $e';
    } finally {
      isLoading.value = false;
    }
  }
}
