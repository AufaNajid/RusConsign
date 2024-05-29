// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart'as http;


class AuthController extends GetxController {
  RxBool isShow = false.obs;
  final TextEditingController usernameTextEditingController = TextEditingController();
  final TextEditingController emailTextEditingController = TextEditingController();
  final TextEditingController passwordTextEditingController = TextEditingController();
  RxBool isLoading = false.obs;
  RxBool successfulRegister = false.obs;
  RxString message = "".obs;

  void showPassword() {
    isShow.value = !isShow.value;
  }

  Future<void> signin(String name, String email, String password) async {
    isLoading.value = true;
    try {
      final response = await http.post(
        Uri.parse("https://rusconsign.com/api/register"),
        headers: <String, String>{
          'Content-Type': 'application/x-www-form-urlencoded',
          'Accept': 'application/json'
        },
        body: <String, String>{
          'name': name,
          'email': email,
          'password': password,
        },
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        bool status = jsonResponse['status'] ?? false;
        String message = jsonResponse['message'] ?? 'Unknown error occurred';

        print('Status: $status, Message: $message');

        successfulRegister.value = status;
        this.message.value = message;
      } else {
        successfulRegister.value = false;
        message.value = 'Failed to register. Please try again.';
      }
    } catch (e) {
      successfulRegister.value = false;
      message.value = 'An error occurred: $e';
    } finally {
      isLoading.value = false;
    }
  }
}
