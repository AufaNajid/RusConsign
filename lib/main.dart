import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rusconsign/detailPage/detail_page.dart';
import 'package:rusconsign/splash/splash.dart';
import 'authentication/page/login_page.dart';
import 'authentication/page/register_page.dart';
import 'homePage/home_page_binding.dart';
import 'homePage/home_page.dart';
import 'splash/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Poppins', useMaterial3: true),
      initialRoute: "/splash",
      getPages: [
        GetPage(name: "/splash", page: () => const SplashScreen()),
        GetPage(name: "/login", page: () => const LoginPage()),
        GetPage(name: "/register", page: () => const RegisterPage()),
        GetPage(name: "/detailpage", page: () => const DetailPage()),
        GetPage(
            name: "/homepage",
            page: () => const HomePage(),
            binding: HomePageBinding()),
      ],
    );
  }
}
