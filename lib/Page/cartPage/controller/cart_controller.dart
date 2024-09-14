// ignore_for_file: avoid_print

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:rusconsign/Api/all_cart_response.dart';
import 'package:rusconsign/utils/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class CartController extends GetxController {
  var selectedItems = <int>[].obs;
  RxBool isLoading = false.obs;
  RxBool isSelectedAll = false.obs;
  var cartItems = <Cart>[].obs;

  void goToCheckout() {
    List<int> selectedCartIds =
        selectedItems.map((index) => cartItems[index].barang.id).toList();
    List<int> selectedCartQuantity =
        selectedItems.map((index) => cartItems[index].quantity).toList();

    print(selectedCartIds);
    print(selectedCartQuantity);

    Get.toNamed(
      "/checkoutcartpage",
      arguments: {
        "cartIds": selectedCartIds,
        "cartQuantity": selectedCartQuantity,
      },
    );
  }

  void setSelectedCart(int index) {
    print(cartItems[index].cartId);
    if (selectedItems.contains(index)) {
      selectedItems.remove(index);
    } else {
      selectedItems.add(index);
    }

    if (selectedItems.length == cartItems.length) {
      isSelectedAll.value = true;
    } else {
      isSelectedAll.value = false;
    }

    cartItems.refresh();
  }

  void setSelectedAll() {
    isSelectedAll.value = !isSelectedAll.value;
    if (isSelectedAll.value) {
      selectedItems.clear();
      selectedItems
          .assignAll(List.generate(cartItems.length, (index) => index));
    } else {
      selectedItems.clear();
    }

    cartItems.refresh();
  }

  int getTotalPrice() {
    int total = 0;
    for (var index in selectedItems) {
      total += cartItems[index].barang.harga * cartItems[index].quantity;
    }
    return total;
  }

  void incrementQuantity(int index) {
    print(cartItems[index].barang.stock);
    if (cartItems[index].quantity < cartItems[index].barang.stock) {
      cartItems[index].quantity++;
      cartItems.refresh();
    } else {
      Fluttertoast.showToast(
        msg: 'batasStok'.tr,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        fontSize: 12,
        backgroundColor: AppColors.cardIconFill,
        textColor: AppColors.description,
      );
      cartItems.refresh();
    }
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
      cartItems.value = data.carts;
    } else {
      cartItems.clear();
    }
    isLoading(false);
  }

  void removeFromCart(int idCart) async {
    print(idCart);
    isLoading(true);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    final response = await http.delete(
      Uri.parse("https://rusconsign.com/api/cart/$idCart"),
      headers: <String, String>{
        'Authorization': "Bearer $token",
      },
    );

    print(response.statusCode);

    if (response.statusCode == 200 || response.statusCode == 201) {
      Fluttertoast.showToast(
        msg: 'produkHapusKeranjang'.tr,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        fontSize: 12,
        backgroundColor: AppColors.cardIconFill,
        textColor: AppColors.description,
      );

      selectedItems.clear();
      isSelectedAll.value = false;

      await fetchCart();
    } else {
      Get.snackbar("Error", "Failed to remove item from cart");
    }

    isLoading(false);
  }
}
