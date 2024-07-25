import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Api/all_favorite_response.dart';

class LikeController extends GetxController {
  RxBool isLoading = false.obs;
  var isFavorite = false.obs;
  var favoriteList = <Like>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchFavorite();
  }

  fetchFavorite() async {
    isLoading(true);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    print("Token Update Barang $token");
    final response = await http.get(
      Uri.parse('https://rusconsign.com/api/likes'),
      headers: <String, String>{
        'Authorization': "Bearer $token",
      },
    );
    print("Status Code ${response.statusCode}");

    if (response.statusCode == 200) {
      ProductFavorite data = productFavoriteFromJson(response.body);
      favoriteList.value = data.likes;
      isFavorite.value = data.likes.isNotEmpty;
    } else {
      favoriteList.clear();
      isFavorite(false);
    }
    isLoading(false);
  }

  Future<void> toggleFavorite(int idBarang) async {
    isLoading(true);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    if (isFavorite.value) {
      // If already favorite, remove it
      final response = await http.delete(
        Uri.parse('https://rusconsign.com/api/likes/$idBarang'),
        headers: <String, String>{
          'Authorization': "Bearer $token",
        },
      );

      if (response.statusCode == 200) {
        await fetchFavorite();
        isFavorite.value =
            favoriteList.any((like) => like.barang.id == idBarang);
      }
    } else {
      // Add to favorite
      var request = http.MultipartRequest(
          'POST', Uri.parse("https://rusconsign.com/api/likes"));

      request.headers['Authorization'] = 'Bearer $token';
      request.fields['barang_id'] = idBarang.toString();

      var response = await request.send();

      if (response.statusCode == 200) {
        await fetchFavorite();
        isFavorite.value =
            favoriteList.any((like) => like.barang.id == idBarang);
      }
    }
    isLoading(false);
  }
}
