import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Api/all_favorite_response.dart';

class LikeController extends GetxController {
  RxBool isLoading = false.obs;
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
    } else {
      favoriteList.clear();
    }
    isLoading(false);
  }

  Future<void> toggleFavorite(int idBarang) async {
    isLoading(true);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    if (isItemFavorite(idBarang)) {
      // If already favorite, remove it
      final response = await http.delete(
        Uri.parse('https://rusconsign.com/api/likes/$idBarang'),
        headers: <String, String>{
          'Authorization': "Bearer $token",
        },
      );

      if (response.statusCode == 200) {
        await fetchFavorite();
      }
    }
    isLoading(false);
  }
  bool isItemFavorite(int idBarang) {
    return favoriteList.any((like) => like.barang.id == idBarang);
  }
}
