// ignore_for_file: avoid_print, file_names

import 'dart:convert';
import 'package:http/http.dart' as http;

class UserStatusService {
  static Future<String?> getMitraStatus(int mitraId) async {
    try {
      final response = await http.get(Uri.parse('https://rusconsign.com/api/mitra/status/$mitraId'));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data['status'];
      } else {
        print('Failed to load status: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error fetching mitra status: $e');
      return null;
    }
  }
}