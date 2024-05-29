import 'package:get/get.dart';
import 'package:rusconsign/Api/product_response.dart';
import 'package:rusconsign/Page/homePage/home_page_controller.dart';

class DetailPageController extends GetxController {
  RxBool isLoading = false.obs;
  var isFavorite = false.obs;
  var thumbsUpClicked = false.obs;
  var thumbsDownClicked = false.obs;
  var isAddCart = false.obs;
  var product = Rx<Datum?>(null);

  void toggleFavorite() {
    isFavorite.value = !isFavorite.value;
    update();
  }

  void toggleThumbsUp() {
    thumbsUpClicked.value = !thumbsUpClicked.value;
    update();
  }

  void toggleThumbsDown() {
    thumbsDownClicked.value = !thumbsDownClicked.value;
    update();
  }

  void toggleAddcart() {
    isAddCart.value = !isAddCart.value;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    final productId = Get.arguments as int;
    fetchProduct(productId);
  }

  fetchProduct(int productId) async {
    try {
      isLoading(true);
      final homeController = Get.find<HomePageController>();
      final fetchedProduct = homeController.productList.firstWhere((product) => product.id == productId);
      product.value = fetchedProduct;
    } catch (e) {
      print("Error: $e");
    } finally {
      isLoading(false);
    }
  }
}
