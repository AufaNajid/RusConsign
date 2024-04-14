import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:rusconsign/extension.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25, top: 20),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Color(0xFF222831),
                      size: 24,
                    ),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  const Text(
                    'Detail Produk',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF222831),
                    ),
                  ),
                ],
              ),
            ),
            const Image(
              image: AssetImage('assets/images/produk.png'),
              height: 325,
              width: 410,
            ),
            Padding(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: Color(0xFFFF3D3D),
                                  borderRadius: BorderRadius.circular(5)),
                              height: 27,
                              width: 80,
                              child: Text(
                                'Produk',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFFFFFFF),
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: Color(0xFFFFFFF),
                              ),
                              height: 27,
                              width: 80,
                              child: Text(
                                '20 Terjual',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF30475E),
                                ),
                              ),
                            )
                          ],
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            FeatherIcons.heart,
                            color: Color(0xFF30475E),
                            size: 24,
                          ),
                        ),
                      ],
                    ),
                    const Text(
                      'Gantungan Kunci (Key Chain) Boneka unik',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF222831),
                      ),
                    ),
                    const Text(
                      'Gantungan kunci boneka unik adalah aksesori kecil yang terdiri dari sebuah gantungan kunci yang biasanya terbuat dari logam atau plastik yang dilengkapi dengan sebuah boneka kecil yang menempel padanya. Boneka tersebut bisa berupa karakter kartun, hewan, buah, atau objek lainnya. Biasanya, gantungan kunci boneka unik memiliki berbagai bentuk dan warna yang menarik, serta sering kali memiliki sentuhan kreatif seperti aksen lucu, detail yang halus, atau desain yang menggemaskan.',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF30475E),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Rp 15.000',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFFF3D3D),
                          ),
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                FeatherIcons.star,
                                color: Color(0xFF30475E),
                                size: 24,
                              ),
                            ),
                            Text(
                              '4.0',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF30475E),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Divider(
                      color: Color(0xFF222831), // Atur warna garis
                      thickness: 1, // Atur ketebalan garis
                      height: 0, // Atur tinggi garis
                    ),
                    Container(
                      height: 40,
                      width: double.infinity,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            ClipOval(
                              child: Image.asset(
                                'assets/images/profil_toko.png', // Ganti dengan path gambar Anda
                                width:
                                    40, // Sesuaikan dengan ukuran yang Anda inginkan
                                height: 40,
                                fit: BoxFit
                                    .cover, // Atur agar gambar mengisi area dengan proporsi yang tepat
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Bagas Prasetya",
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF30475E),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                          color: Color(0xFF30475E),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      height: 21,
                                      width: 70,
                                      child: Text(
                                        'Chat Penjual',
                                        style: TextStyle(
                                          fontSize: 8,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFFFFFFFF),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                          color: Color(0xFF30475E),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      height: 21,
                                      width: 70,
                                      child: Text(
                                        'Lihat Toko',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 8,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFFFFFFFF),
                                        ),
                                      ),
                                    ),
                                  ].withSpaceBetween(width: 7),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: 12,
                                      width: 90,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            "Jumlah Produk",
                                            style: TextStyle(
                                              fontSize: 8,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xFF30475E),
                                            ),
                                          ),
                                          const Text(
                                            "2",
                                            style: TextStyle(
                                              fontSize: 8,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xFFFF3D3D),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: 12,
                                      width: 90,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            "Jumlah Jasa",
                                            style: TextStyle(
                                              fontSize: 8,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xFF30475E),
                                            ),
                                          ),
                                          const Text(
                                            "2",
                                            style: TextStyle(
                                              fontSize: 8,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xFFFF3D3D),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ].withSpaceBetween(width: 7),
                                ),
                                Row(
                                  children: [
                                    Container(
                                      height: 12,
                                      width: 90,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            "Penilaian",
                                            style: TextStyle(
                                              fontSize: 8,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xFF30475E),
                                            ),
                                          ),
                                          const Text(
                                            "4.5",
                                            style: TextStyle(
                                              fontSize: 8,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xFFFF3D3D),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: 12,
                                      width: 90,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            "Pengikut",
                                            style: TextStyle(
                                              fontSize: 8,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xFF30475E),
                                            ),
                                          ),
                                          const Text(
                                            "278",
                                            style: TextStyle(
                                              fontSize: 8,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xFFFF3D3D),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ].withSpaceBetween(width: 7),
                                )
                              ].withSpaceBetween(height: 12),
                            )
                          ].withSpaceBetween(width: 10),
                        ),
                      ),
                    ),
                    Divider(
                      color: Color(0xFF222831), // Atur warna garis
                      thickness: 1, // Atur ketebalan garis
                      height: 0, // Atur tinggi garis
                    ),
                    Container(
                      height: 40,
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Penilaian Produk",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF30475E),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "2 Ulasan",
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w300,
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
                              )
                            ].withSpaceBetween(height: 4),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          left: 10, right: 10, bottom: 15, top: 15),
                      height: 151,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Color(0xFFF5F5F5),
                          borderRadius: BorderRadius.circular(10),
                          border:
                              Border.all(color: Color(0xFF222831), width: 1.5)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipOval(
                            child: Image.asset(
                              'assets/images/profil_toko.png', // Ganti dengan path gambar Anda
                              width:
                                  40, // Sesuaikan dengan ukuran yang Anda inginkan
                              height: 40,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Muhammad Alfarezi",
                                style: TextStyle(
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
                                "2024-03-08 09:31",
                                style: TextStyle(
                                  fontSize: 8,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF30475E),
                                ),
                              ),
                              Text(
                                "Barangnya bagus, penjualnya juga ramah sekali.\nTapi ada bagian gantungan\nkunci yang rusak, mungkin bisa diperbaiki lagi bagi penjualnya...",
                                style: TextStyle(
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
                                      Text(
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
                                      Text(
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
                          )
                        ].withSpaceBetween(width: 10),
                      ),
                    )
                  ].withSpaceBetween(height: 10),
                ))
          ].withSpaceBetween(height: 15),
        ),
      )),
    );
  }
}
