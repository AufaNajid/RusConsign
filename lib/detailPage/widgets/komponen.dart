import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:rusconsign/extension.dart';


class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onBackPressed;

  const CustomAppBar({
    required this.title,
    this.onBackPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(FeatherIcons.chevronLeft),
        onPressed: onBackPressed,
        iconSize: 24,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}


class CardQuantity extends StatelessWidget {
  final String title;
  final Color fillColor;
  final Color textColor;
  const CardQuantity({Key? key, required this.title, required this.fillColor, required this.textColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: fillColor,
          borderRadius: BorderRadius.circular(5)),
      height: 27,
      width: 80,
      child:  Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.bold,
          color: textColor,
        ),
      ),
    );
  }
}

class BtnSeller extends StatelessWidget {
  final String title;
  final VoidCallback ontap;
  const BtnSeller({Key? key, required this.title, required this.ontap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: const Color(0xFF30475E),
            borderRadius:
            BorderRadius.circular(5)),
        height: 21,
        width: 70,
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 8,
            fontWeight: FontWeight.bold,
            color: Color(0xFFFFFFFF),
          ),
        ),
      ),
    );
  }
}

class SellerInfo extends StatelessWidget {
  final String title;
  final String jumlah;
  const SellerInfo({Key? key, required this.title, required this.jumlah}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 12,
      width: 90,
      child: Row(
        mainAxisAlignment:
        MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 8,
              fontWeight: FontWeight.w500,
              color: Color(0xFF30475E),
            ),
          ),
          Text(
            jumlah,
            style: const TextStyle(
              fontSize: 8,
              fontWeight: FontWeight.w500,
              color: Color(0xFFFF3D3D),
            ),
          ),
        ],
      ),
    );
  }
}



List<Map<String, dynamic>> metodeData = [
  {"nama": "Indomaret", "photo": "indomaret-topup.png"},
];

class CommentSection extends StatelessWidget {
  final String imagePath;
  final String name;
  final String date;
  final String desc;
  const CommentSection({Key? key, required this.imagePath, required this.name, required this.date, required this.desc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: const Color(0xFFF5F5F5),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                color: const Color(0xFF222831), width: 1.5)),
        child: Padding(
          padding: const EdgeInsets.only(
              left: 10, right: 10, bottom: 15, top: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipOval(
                child: Image.network(
                  imagePath, // Ganti dengan path gambar Anda
                  width:
                  40, // Sesuaikan dengan ukuran yang Anda inginkan
                  height: 40,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Text(
                      name,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF30475E),
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(
                          FeatherIcons.star,
                          color: Color(0xFF30475E),
                          size: 15,
                        ),
                        const Icon(
                          FeatherIcons.star,
                          color: Color(0xFF30475E),
                          size: 15,
                        ),
                        const Icon(
                          FeatherIcons.star,
                          color: Color(0xFF30475E),
                          size: 15,
                        ),
                        const Icon(
                          FeatherIcons.star,
                          color: Color(0xFF30475E),
                          size: 15,
                        ),
                        const Icon(
                          FeatherIcons.star,
                          color: Color(0xFF30475E),
                          size: 15,
                        ),
                      ].withSpaceBetween(width: 3),
                    ),
                     Text(
                      date,
                      style: const TextStyle(
                        fontSize: 8,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF30475E),
                      ),
                    ),
                     Text(
                       desc,
                      style: const TextStyle(
                        fontSize: 8,
                        fontWeight: FontWeight.w300,
                        color: Color(0xFF30475E),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              FeatherIcons.thumbsUp,
                              color: Color(0xFF30475E),
                              size: 20,
                            ),
                            const Text(
                              "200",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 8,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF30475E),
                              ),
                            ),
                          ].withSpaceBetween(width: 5),
                        ),
                        Row(
                          children: [
                            const Icon(
                              FeatherIcons.thumbsDown,
                              color: Color(0xFF30475E),
                              size: 20,
                            ),
                            const Text(
                              "200",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 8,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF30475E),
                              ),
                            ),
                          ].withSpaceBetween(width: 5),
                        )
                      ].withSpaceBetween(width: 10),
                    )
                  ].withSpaceBetween(height: 5),
                ),
              )
            ].withSpaceBetween(width: 10),
          ),
        ),
      ),
    );
  }
}
