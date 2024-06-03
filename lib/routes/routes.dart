import 'package:get/get.dart';
import 'package:rusconsign/Page/addItemPage/add_item_form.dart';
import 'package:rusconsign/Page/chatPage/chat_binding.dart';
import 'package:rusconsign/Page/editdataproductPage/edit_data_product.dart';
import 'package:rusconsign/Page/editdataproductPage/edit_data_product_binding.dart';
import 'package:rusconsign/Page/productmanagePage/product_manage_binding.dart';
import 'package:rusconsign/Page/productmanagePage/product_manage_page.dart';
import 'package:rusconsign/Page/profilePage/profile_page_binding.dart';
import 'package:rusconsign/Page/sellingPage/selling_page.dart';
import 'package:rusconsign/Page/sellingPage/selling_page_binding.dart';
import 'package:rusconsign/Page/chatPage/chat_cust_seller_page.dart';
import 'package:rusconsign/Page/chatPage/chatlist_page.dart';
import 'package:rusconsign/Page/detailPage/detail_page.dart';
import 'package:rusconsign/Page/detailPage/detail_page_binding.dart';
import 'package:rusconsign/Page/favoritePage/favorite_page.dart';
import 'package:rusconsign/Page/homePage/home_page.dart';
import 'package:rusconsign/Page/homePage/home_page_binding.dart';
import 'package:rusconsign/Page/notificationPage/notifcation_page.dart';
import 'package:rusconsign/Page/orderPage/order_page.dart';
import 'package:rusconsign/Page/orderPage/order_page_binding.dart';
import 'package:rusconsign/Page/profilePage/profile_page.dart';
import 'package:rusconsign/Page/registerSeller/register_seller.dart';
import 'package:rusconsign/Page/settingPage/setting_page.dart';
import 'package:rusconsign/Page/settingPage/setting_page_binding.dart';
import 'package:rusconsign/Page/splash/splash.dart';
import 'package:rusconsign/authentication/page/forgot_password_page.dart';
import 'package:rusconsign/authentication/page/login_page.dart';
import 'package:rusconsign/authentication/page/register_page.dart';
import 'package:rusconsign/menu.dart';
import 'package:rusconsign/Page/cartPage/cart_page.dart';
import 'package:rusconsign/Page/checkoutPage/checkout_page_binding.dart';
import 'package:rusconsign/Page/discountPage/discount_page.dart';
import 'package:rusconsign/Page/paymentDone/payment_done.dart';
import 'package:rusconsign/Page/qrisPage/qris_payment_binding.dart';
import 'package:rusconsign/Page/registerSeller/register_seller_binding.dart';
import 'package:rusconsign/Page/qrisPage/qris_payment_page.dart';
import 'package:rusconsign/Page/userProfilePage/user_profile_binding.dart';
import 'package:rusconsign/Page/userProfilePage/user_profile_page.dart';
import 'package:rusconsign/authentication/auth_binding.dart';
import 'package:rusconsign/Page/locationPage/location_page.dart';
import 'package:rusconsign/Page/checkoutPage/checkout_page.dart';
import 'package:rusconsign/Page/registerSeller/register_seller_done.dart';
import 'package:rusconsign/Page/registerSeller/register_seller_waiting.dart';

List<GetPage> routes = [
  GetPage(name: "/splash", page: () => const SplashScreen()),
  GetPage(name: "/menu", page: () => const Menu()),
  GetPage(name: "/favoritepage", page: () => const FavoritePage()),
  GetPage(name: "/chatlist", page: () => const ChatListPage()),

  GetPage(name: "/diskonpage", page: () => const DiscountPage()),
  GetPage(name: "/notificationpage", page: () => const NotificationPage()),
  GetPage(name: "/waitingadmin", page: () => const RegisterSellerWaiting()),
  GetPage(name: "/locationpage", page: () => const LocationPage()),
  GetPage(name: "/paymentdone", page: () => const PaymentDone()),
  GetPage(name: "/cartpage", page: () => const CartPage()),
  GetPage(name: "/additemform", page:() => AddItemForm()),
  GetPage(
    name: "/editdataproduct", 
    page: () =>  EditDataProduct(),
    binding: EditDataProductBinding()),
  GetPage(
    name: "/productmanagepage", 
    page: () => ProductManagePage(),
    binding: ProductManageBinding()),
  GetPage(
    name: "/sellingpage", 
    page: () => SellingPage(),
    binding: SellingPageBinding()),
  GetPage(  
    name: "/profilepage", 
    page: () => const ProfilePage(),
    binding: ProfilePageBinding()),
  GetPage(
    name: "/qrispayment",
    page: () => const QrisPaymentPage(),
    binding: QrPaymentBinding(),
  ),
  GetPage(
    name: "/login",
    page: () => LoginPage(),
    binding: AuthBinding(),
  ),
  GetPage(
    name: "/register",
    page: () => RegisterPage(),
    binding: AuthBinding(),
  ),
  GetPage(
    name: "/chatpage",
    page: () => const ChatPage(),
    binding: ChatBinding(),
  ),
  GetPage(
    name: "/forgotpasswordpage",
    page: () => ForgotPasswordPage(),
    binding: AuthBinding(),
  ),
  GetPage(
    name: "/userprofilepage",
    page: () => UserProfilePage(),
    binding: UserProfileBinding(),
  ),
  GetPage(
    name: "/homepage",
    page: () => const HomePage(),
    binding: HomePageBinding(),
  ),
  GetPage(
    name: "/orderpage",
    page: () => OrderPage(),
    binding: OrderPageBinding(),
  ),
  GetPage(
    name: "/detailpage",
    page: () => DetailPage(),
    binding: DetailPageBinding(),
  ),
  GetPage(
    name: "/settingpage",
    page: () => SettingPage(),
    binding: SettingPageBinding(),
  ),
  GetPage(
    name: "/registerseller",
    page: () => RegisterSeller(),
    binding: RegisterSellerBinding(),
  ),
  GetPage(
    name: "/registersellerdone",
    page: () => const RegisterSellerDone(),
  ),
  GetPage(
    name: "/checkoutpage",
    page: () => const ChekcoutPage(),
    binding: CheckoutPageBinding(),
  ),
];
