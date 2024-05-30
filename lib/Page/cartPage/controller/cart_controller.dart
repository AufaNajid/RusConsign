import 'dart:convert';
import 'package:http/http.dart' as http;

class CartController {
  final String baseUrl = 'http://rusconsign.com';

  Future<List<dynamic>> fetchCartItems(String authToken) async {
    final response = await http.get(
      Uri.parse('$baseUrl/cart'),
      headers: {'Authorization': 'Bearer $authToken'},
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load cart items: ${response.statusCode}');
    }
  }

  Future<Map<String, dynamic>> addToCart(
      String authToken, int productId, int quantity) async {
    final response = await http.post(
      Uri.parse('$baseUrl/cart'),
      headers: {
        'Authorization': 'Bearer $authToken',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'product_id': productId,
        'quantity': quantity,
      }),
    );

    if (response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to add product to cart: ${response.statusCode}');
    }
  }

  Future<Map<String, dynamic>> updateCartItem(
      String authToken, int cartItemId, int quantity) async {
    final response = await http.put(
      Uri.parse('$baseUrl/cart/$cartItemId'),
      headers: {
        'Authorization': 'Bearer $authToken',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({'quantity': quantity}),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to update cart item: ${response.statusCode}');
    }
  }

  Future<void> deleteCartItem(String authToken, int cartItemId) async {
    final response = await http.delete(
      Uri.parse('$baseUrl/cart/$cartItemId'),
      headers: {'Authorization': 'Bearer $authToken'},
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to delete cart item: ${response.statusCode}');
    }
  }
}
