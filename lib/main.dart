import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rusconsign/HomePage/home_page.dart';

import 'authentication/page/register_page.dart';

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
      home: const RegisterPage(),
    );
  }
}