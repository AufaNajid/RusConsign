import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rusconsign/HomePage/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:rusconsign/authentication/page/login_page.dart';
import 'firebase_options.dart';

import 'authentication/page/register_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());

  await Firebase.initializeApp (
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
      home:  LoginPage(),
    );
  }
}