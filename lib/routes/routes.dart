import 'package:get/get.dart';
import 'package:rusconsign/authentication/page/forgotpassword_page.dart';
import 'package:rusconsign/chatPage/chat-cust-seller_page.dart';
import 'package:rusconsign/chatPage/chatlist_page.dart';
import 'package:rusconsign/detailPage/detail_page.dart';
import 'package:rusconsign/detailPage/detail_page_binding.dart';
import 'package:rusconsign/favoritePage/favorite_page.dart';
import 'package:rusconsign/diskonPage/diskon_page.dart';
import 'package:rusconsign/menu.dart';
import 'package:rusconsign/notificationPage/notifcation_page.dart';
import 'package:rusconsign/profilePage/profile_page.dart';
import 'package:rusconsign/settingPage/setting_page.dart';
import 'package:rusconsign/settingPage/setting_page_binding.dart';
import '../authentication/page/login_page.dart';
import '../authentication/page/register_page.dart';
import '../homePage/home_page.dart';
import '../homePage/home_page_binding.dart';
import '../splash/splash.dart';

List<GetPage> routes = [
  GetPage(name: "/splash", page: () => const SplashScreen()),
  GetPage(name: "/login", page: () => LoginPage()),
  GetPage(name: "/register", page: () => RegisterPage()),
  GetPage(name: "/menu", page: () => const Menu()),
  GetPage(name: "/favoritepage", page: () => const FavoritePage()),
  GetPage(name: "/forgotpasswordpage", page: () => const ForgotPasswordPage()),
  GetPage(name: "/chatlist", page: () => const ChatListPage()),
  GetPage(name: "/chatpage", page: () => const ChatPage()),
  GetPage(name: "/profilepage", page: () => const ProfilePage()),
  GetPage(name: "/diskonpage", page: () => const DiskonPage()),
  GetPage(name: "/notificationpage", page: () => const NotificationPage()),
  GetPage(
      name: "/homepage", page: () => HomePage(), binding: HomePageBinding()),
  GetPage(
      name: "/detailpage",
      page: () => DetailPage(),
      binding: DetailPageBinding()),
  GetPage(
      name: "/settingpage",
      page: () => SettingPage(),
      binding: SettingPageBinding()),
];
