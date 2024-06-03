import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:rusconsign/Page/settingPage/setting_controller.dart";

class AppColors {
  static final SettingController darkMode = Get.find();

  static Color background = darkMode.isDarkModeSwitched.value
      ? const Color(0xFF222831)
      : const Color(0xFFFFFFFF);
  static const Color button1 = Color(0xFFFF3D3D);
  static const Color textButton1 = Color(0xFFF5F5F5);
  static Color button2 = darkMode.isDarkModeSwitched.value
      ? const Color(0xFFE1E1E1)
      : const Color(0xFF30475E);
  static Color textButton2 = darkMode.isDarkModeSwitched.value
      ? const Color(0xFF30475E)
      : const Color(0xFFF5F5F5);
  static Color titleLine = darkMode.isDarkModeSwitched.value
      ? const Color(0xFFFFFFFF)
      : const Color(0xFF222831);
  static const Color hargaStat = Color(0xFFFF3D3D);
  static Color description = darkMode.isDarkModeSwitched.value
      ? const Color(0xFFF5F5F5)
      : const Color(0xFF30475E);
  static Color nonActiveIcon = darkMode.isDarkModeSwitched.value
      ? const Color(0xFFF5F5F5)
      : const Color(0xFF30475E);
  static const Color activeIcon = Color(0xFFFF3D3D);
  static const Color activeIconType = Color(0xFFF5F5F5);
  static Color borderIcon = darkMode.isDarkModeSwitched.value
      ? const Color(0xFFE1E1E1)
      : const Color(0xFF222831);
  static const Color bintang = Color(0xFFFFDD55);
  static Color cardIconFill = darkMode.isDarkModeSwitched.value
      ? const Color(0xFF253341)
      : const Color(0xFFF5F5F5);
  static Color produkDipilih = darkMode.isDarkModeSwitched.value
      ? const Color(0xFF532F2F)
      : const Color(0xFFFFCFCF);
  static Color cardProdukDipilih = darkMode.isDarkModeSwitched.value
      ? const Color(0xFF6B4848)
      : const Color(0xFFFFDFDF);
  static Color cardProdukTidakDipilih = darkMode.isDarkModeSwitched.value
      ? const Color(0xFF313E50)
      : const Color(0xFFE1E1E1);
  static Color nonActiveBar = darkMode.isDarkModeSwitched.value
      ? const Color(0xFF3C4756)
      : const Color(0xFFE1E1E1);
  static const Color error = Color.fromARGB(255, 182, 61, 45);
  static const Color success = Color.fromARGB(255, 91, 206, 63);
}
