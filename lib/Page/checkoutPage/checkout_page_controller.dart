// ignore_for_file: avoid_print

import 'package:get/get.dart';
import 'package:rusconsign/Api/product_response.dart';
import 'package:rusconsign/Page/homePage/home_page_controller.dart';


class CheckoutPageController extends GetxController {
  var selectedPaymentMethod = 'QRIS'.obs;
  var selectedLeading = 'assets/images/qris.svg'.obs;
  var selectedTitle = 'QRIS'.obs;
  var expanded = false.obs;
  RxBool isLoading = false.obs;
  var product = Rx<Datum?>(null);


  var items = <Map<String, String>>[
    {'title': 'Dana', 'leading': 'assets/images/dana.svg'},
    {'title': 'Gopay', 'leading': 'assets/images/gopay.svg'},
    {'title': 'OVO', 'leading': 'assets/images/ovo.svg'},
    {'title': 'Cash On Delivery (COD)', 'leading': 'assets/images/cod.svg'},
  ].obs;

  void selectPaymentMethod(int index) {
    var selectedItem = items[index];

    var previousSelectedItem = {
      'title': selectedTitle.value,
      'leading': selectedLeading.value,
    };
    items[index] = previousSelectedItem;

    selectedPaymentMethod.value = selectedItem['title']!;
    selectedLeading.value = selectedItem['leading']!;
    selectedTitle.value = selectedItem['title']!;

    if (selectedItem['title'] != 'QRIS') {
      items.removeWhere((item) => item['title'] == 'QRIS');
      items.insert(0, {'title': 'QRIS', 'leading': 'assets/images/qris.svg'});
    }

    expanded.value = false;
    selectedPaymentMethod.refresh();
  }

  @override
  void onInit(){
    super.onInit();
    final productID = Get.arguments as int;
    fetchProduct(productID);
  }

  fetchProduct(int productID) async {
    try {
      isLoading(true);
      final homeController = Get.find<HomePageController>();
      final fetchedProduct = homeController.productList.firstWhere((product) => product.id == productID);
      product.value = fetchedProduct;
    } catch (e) {
      print("Error: $e");
    } finally {
      isLoading(false);
    }
  }
}
