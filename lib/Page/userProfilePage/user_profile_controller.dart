import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:rusconsign/Api/product_mitra_list.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProfilePageController extends GetxController {
  final currentIndex = 0.obs;
  final _selectedIndex = 0.obs;
  final following = false.obs;
  RxBool isLoading = false.obs;
  var productList = <Barang>[].obs;

  int get selectedIndex => _selectedIndex.value;

  void updateCurrentIndexIndicator(int index) {
    currentIndex.value = index;
  }

  void setSelectedFilter(int index) {
    _selectedIndex.value = index;
    update();
    _selectedIndex.refresh();
  }

  void onFollow() {
    following.value = !following.value;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    final idMitra = Get.arguments as int;
    fetchProduct(idMitra);
  }

  Future<void> fetchProduct(int idProduct) async {
    isLoading.value = true;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    final response = await http.get(
      Uri.parse('https://rusconsign.com/api/mitra/barang/$idProduct'),
      headers: <String, String>{
        'Authorization': "Bearer ${token.toString()}",
      },
    );

    if(response.statusCode == 200) {
      ProductMitraList data = productMitraListFromJson(response.body);
      productList.value = data.barangs;
      print(productList);
      isLoading(false);
      print(response.body);
    }
  }
}
