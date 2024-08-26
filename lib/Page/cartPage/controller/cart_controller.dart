import 'package:get/get.dart';
import 'package:rusconsign/Api/all_cart_response.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class CartController extends GetxController {
  final currentIndex = 0.obs;
  final _selectedIndex = 0.obs;
  RxBool isLoading = false.obs;
  var cartItems = <Cart>[].obs;

  int get selectedIndex => _selectedIndex.value;

  void updateCart(int index) {
    currentIndex.value = index;
  }

  void setSelectedCart(int index) {
    _selectedIndex.value = index;
  }

  void incrementQuantity(int index) {
    cartItems[index].quantity++;
    cartItems.refresh();
  }

  void decrementQuantity(int index) {
    if (cartItems[index].quantity > 1) {
      cartItems[index].quantity--;
      cartItems.refresh();
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchCart();
  }

  fetchCart() async {
    isLoading(true);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    final response = await http.get(
      Uri.parse("https://rusconsign.com/api/cart"),
      headers: <String, String>{
        'Authorization': "Bearer $token",
      },
    );
    if (response.statusCode == 200) {
      AllCartResponse data = allCartResponseFromJson(response.body);
      cartItems.value = data.cart;
    } else {
      cartItems.clear();
    }
    isLoading(false);
  }
}
