import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LikeController {
  final String baseUrl = 'http://rusconsign.com';

  Future<List<dynamic>> fetchLikedProducts(String authToken) async {
    final response = await http.get(
      Uri.parse('$baseUrl/likes'),
      headers: {'Authorization': 'Bearer $authToken'},
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load liked products: ${response.statusCode}');
    }
  }

  Future<Map<String, dynamic>> likeProduct(String authToken, int productId) async {
    final response = await http.post(
      Uri.parse('$baseUrl/likes'),
      headers: {
        'Authorization': 'Bearer $authToken',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({'product_id': productId}),
    );

    if (response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to like product: ${response.statusCode}');
    }
  }

  Future<void> unlikeProduct(String authToken, int likeId) async {
    final response = await http.delete(
      Uri.parse('$baseUrl/likes/$likeId'),
      headers: {'Authorization': 'Bearer $authToken'},
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to unlike product: ${response.statusCode}');
    }
  }
}
