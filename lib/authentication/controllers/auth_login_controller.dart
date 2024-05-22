// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class AuthLoginController extends GetxController {
  late SharedPreferences prefs;
  final TextEditingController emailTextEditingController = TextEditingController();
  final TextEditingController passwordTextEditingController = TextEditingController();
  RxBool isLoading = false.obs;
  RxBool successfulLogin = true.obs;
  RxString message = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  loadData() async {
    prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('token')) {
    }
  }

  login(String email, String password) async {
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

      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = json.decode(response.body);
        bool status = jsonResponse['status'];
        String message = jsonResponse['message'];
        String? token = jsonResponse['token'];

        if (status) {
          await prefs.setString('token', token!);
          this.message.value = message;
          successfulLogin.value = true;
          isLoading.value = false;
        } else {
          this.message.value = message;
          successfulLogin.value = false;
          isLoading.value = false;
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