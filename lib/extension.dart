import 'package:flutter/material.dart';

extension ListSpaceBetweenExtension on List<Widget> {
  List<Widget> withSpaceBetween({double? width, double? height}) => [
        if (isNotEmpty) this[0],
        for (int i = 1; i < length; i++) ...[
          SizedBox(width: width, height: height),
          this[i]
        ]
      ];
}

class AppColors {
  static const Color background = Color(0xFFFFFFFF);
  static const Color button1 = Color(0xFFFF3D3D);
  static const Color textbutton1 = Color(0xFFF5F5F5);
  static const Color button2 = Color(0xFF30475E);
  static const Color textbutton2 = Color(0xFFF5F5F5);
  static const Color titleline = Color(0xFF222831);
  static const Color hargasat = Color(0xFFFF3D3D);
  static const Color bintang = Color(0xFFFFDD55);
  static const Color produkdipilih = Color(0xFFFFCFCF);
  static const Color cardprodukdipilih = Color(0xFFFFDFDF);
  static const Color nonactivebar = Color(0xFFEDEDED);
  static const Color component = Color(0xFF9747FF);
}
