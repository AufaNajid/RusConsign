import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rusconsign/routes/routes.dart';

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
      getPages: routes
    );
  }
}
