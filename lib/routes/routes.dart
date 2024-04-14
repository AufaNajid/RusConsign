import 'package:get/get.dart';
import 'package:rusconsign/menu.dart';

import '../authentication/page/login_page.dart';
import '../authentication/page/register_page.dart';
import '../homePage/home_page.dart';
import '../homePage/home_page_binding.dart';
import '../splash/splash.dart';

List<GetPage> routes = [
  GetPage(name: "/splash", page: () => const SplashScreen()),
  GetPage(name: "/login", page: () => const LoginPage()),
  GetPage(name: "/register", page: () => const RegisterPage()),
  GetPage(name: "/menu", page: () => const Menu()),
  GetPage(
      name: "/homepage",
      page: () => HomePage(),
      binding: HomePageBinding()),
];
