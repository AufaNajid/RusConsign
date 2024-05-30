// ignore_for_file: file_names

import 'package:shared_preferences/shared_preferences.dart';

class UserService {
  static const String _mitraStatusKey = 'mitra_status';

  static Future<void> setMitraStatus(int mitraId, String status) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('$_mitraStatusKey$mitraId', status);
  }

  static Future<String?> getMitraStatus(int mitraId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('$_mitraStatusKey$mitraId');
  }
}
