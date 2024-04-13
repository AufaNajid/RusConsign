import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rusconsign/HomePage/home_page.dart';
import 'package:rusconsign/splash/splash.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins'
      ),
      home: SplashScreen(),
    );
  }
}