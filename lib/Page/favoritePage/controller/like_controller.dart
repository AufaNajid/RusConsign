// ignore_for_file: avoid_print

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:rusconsign/utils/colors.dart';
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
      final response = await http.delete(
        Uri.parse('https://rusconsign.com/api/likes/$idBarang'),
        headers: <String, String>{
          'Authorization': "Bearer $token",
        },
      );

      if (response.statusCode == 200) {
        Fluttertoast.showToast(
          msg: 'hapusFavoritePesan'.tr,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          fontSize: 12,
          backgroundColor: AppColors.cardIconFill,
          textColor: AppColors.description,
        );
        await fetchFavorite();
      }
    }
    isLoading(false);
  }

  bool isItemFavorite(int idBarang) {
    return favoriteList.any((like) => like.barang.id == idBarang);
  }
}
