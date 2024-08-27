import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:rusconsign/Api/all_cart_response.dart';
import 'package:rusconsign/utils/colors.dart';
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

  void removeFromCart(int idCart) async {
    isLoading(true);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    final response = await http.delete(
      Uri.parse("https://rusconsign.com/api/cart/$idCart"),
      headers: <String, String>{
        'Authorization': "Bearer $token",
      },
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      Fluttertoast.showToast(
        msg: 'produkHapusKeranjang'.tr,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        fontSize: 12,
        backgroundColor: AppColors.cardIconFill,
        textColor: AppColors.description
      );
      await fetchCart();

      if (cartItems.isNotEmpty) {
        _selectedIndex.value = 0;
      }
    } else {
      Get.snackbar("Error", "Failed to remove item from cart");
    }

    isLoading(false);
  }
}
