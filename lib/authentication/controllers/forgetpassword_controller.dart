import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ForgotPasswordController {
  final String baseUrl = 'http://rusconsign.com';
  final TextEditingController emailController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  Future<String> forgotPassword(String email) async {
    final checkEmailResponse = await http.get(
      Uri.parse('$baseUrl/users?email=$email'),
      headers: {'Content-Type': 'application/json'},
    );

    if (checkEmailResponse.statusCode == 200) {
      return 'Email found, proceed to next page';
    } else if (checkEmailResponse.statusCode == 404) {
      return 'Email not found';
    } else {
      throw Exception('Failed to check email: ${checkEmailResponse.statusCode}');
    }
  }

  Future<String> resetPassword(String newPassword, String confirmPassword) async {
    if (newPassword != confirmPassword) {
      return 'Passwords do not match';
    }

    final response = await http.post(
      Uri.parse('$baseUrl/reset'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'password': newPassword}),
    );

    if (response.statusCode == 200) {
      return 'Password reset successfully';
    } else if (response.statusCode == 401) {
      return 'User not authenticated';
    } else {
      // Jika terjadi kesalahan lain
      return 'Failed to reset password: ${response.statusCode}';
    }
  }

}
