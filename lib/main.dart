import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rusconsign/HomePage/home_page.dart';
import 'package:rusconsign/splash/splash.dart';
import 'authentication/page/login_page.dart';
import 'authentication/page/register_page.dart';
import 'homePage/bindings/home_page_binding.dart';
import 'homePage/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Poppins'),
      initialRoute: "/login",
      getPages: [
        GetPage(name: "/login", page: () => const LoginPage()),
        GetPage(name: "/register", page: () => const RegisterPage()),
        GetPage(
            name: "/homepage",
            page: () => const HomePage(),
            binding: HomePageBinding()),
      ],
    );
  }
}