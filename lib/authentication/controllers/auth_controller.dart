import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart'as http;

class AuthController extends GetxController {
  RxBool isShow = false.obs;
  RxBool isShowConfirmPassword = false.obs;
  final TextEditingController usernameTextEditingController =
  TextEditingController();
  final TextEditingController emailTextEditingController =
  TextEditingController();
  final TextEditingController passwordTextEditingController =
  TextEditingController();
  RxBool isObsecure = true.obs;
  RxBool isObsecureFalse = false.obs;
  RxBool isLoading = false.obs;
  RxBool successfulRegister = true.obs;
  RxString message = "".obs;

  void showPassword() {
    isShow.value = !isShow.value;
    update();
  }

  void showConfirmPassword() {
    isShowConfirmPassword.value = !isShowConfirmPassword.value;
    update();
  }

  signin(String username, String email, String password) async {
    isLoading.value = true;
    final response = await http.post(
      Uri.parse("https://rusconsign.com/api/register"),
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: <String, String>{
        'username': username,
        'email': email,
        'password': password,
      },
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      bool status = jsonResponse['status'];
      String message = jsonResponse['message'];
      if (status) {
        successfulRegister.value = true;
        isLoading.value = false;
        this.message.value = message;
        return;
      } else {
        successfulRegister.value = false;
        isLoading.value = false;
        this.message.value = message;
      }
    } else {
      successfulRegister.value = false;
    }
  }
}
