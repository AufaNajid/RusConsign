import 'package:get/get.dart';
import 'package:rusconsign/Page/qrisPage/qris_payment_binding.dart';
import 'package:rusconsign/Page/registerSeller/register_seller_binding.dart';
import 'package:rusconsign/Page/qrisPage/qris_payment_page.dart';
import 'package:rusconsign/Page/userProfilePage/user_profile_binding.dart';
import 'package:rusconsign/Page/userProfilePage/user_profile_page.dart';
import 'package:rusconsign/authentication/auth_binding.dart';
import 'package:rusconsign/page/locationPage/location_page.dart';
import 'package:rusconsign/page/checkoutPage/checkout_page.dart';
import '../page/notificationPage/notifcation_page.dart';
import '../authentication/page/forgot_password_page.dart';
import 'package:rusconsign/page/registerSeller/register_seller_done.dart';
import 'package:rusconsign/page/registerSeller/register_seller_waiting.dart';
import '../authentication/page/login_page.dart';
import '../authentication/page/register_page.dart';
import '../menu.dart';
import '../page/chatPage/chat_cust_seller_page.dart';
import '../page/chatPage/chatlist_page.dart';
import '../page/detailPage/detail_page.dart';
import '../page/detailPage/detail_page_binding.dart';
import '../page/diskonPage/diskon_page.dart';
import '../page/favoritePage/favorite_page.dart';
import '../page/homePage/home_page.dart';
import '../page/homePage/home_page_binding.dart';
import '../page/orderPage/order_page.dart';
import '../page/orderPage/order_page_binding.dart';
import '../page/profilePage/profile_page.dart';
import '../page/registerSeller/register_seller.dart';
import '../page/settingPage/setting_page.dart';
import '../page/settingPage/setting_page_binding.dart';
import '../page/splash/splash.dart';

List<GetPage> routes = [
  GetPage(name: "/splash", page: () => const SplashScreen()),
  GetPage(name: "/menu", page: () => const Menu()),
  GetPage(name: "/favoritepage", page: () => const FavoritePage()),
  GetPage(name: "/chatlist", page: () => const ChatListPage()),
  GetPage(name: "/chatpage", page: () => const ChatPage()),
  GetPage(name: "/profilepage", page: () => const ProfilePage()),
  GetPage(name: "/diskonpage", page: () => const DiskonPage()),
  GetPage(name: "/notificationpage", page: () => const NotificationPage()),
  GetPage(name: "/registerseller", page: () => const RegisterSeller()),
  GetPage(name: "/registerseller", page: () => const RegisterSeller()),
  GetPage(name: "/waitingadmin", page: () => const RegisterSellerWaiting()),
  GetPage(name: "/registersellerdone", page: () => const RegisterSellerDone()),
  GetPage(name: "/locationpage", page: () => const LocationPage()),
  GetPage(name: "/checkoutpage", page: () => const ChekcoutPage()),
    GetPage(name: "/waitingadmin", page: () => const RegisterSellerWaiting()),
  GetPage(
      name: "/qrispayment",
      page: () => const QrisPaymentPage(),
      binding: QrPaymentBinding()),
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
    name: "/forgotpasswordpage",
    page: () => const ForgotPasswordPage(),
    binding: AuthBinding(),
  ),
  GetPage(
      name: "/userprofilepage",
      page: () => UserProfilePage(),
      binding: UserProfileBinding()),
  GetPage(
    name: "/homepage",
    page: () => HomePage(),
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
      binding: DetailPageBinding()),
  GetPage(
      name: "/settingpage",
      page: () => SettingPage(),
      binding: SettingPageBinding()),
  GetPage(
      name: "/registerseller",
      page: () => const RegisterSeller(),
      binding: RegisterSellerBinding()),
  GetPage(
    name: "/registersellerdone",
    page: () => const RegisterSellerDone(),
  )
];
