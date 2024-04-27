import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:rusconsign/detailPage/widgets/komponen.dart';
import 'package:rusconsign/extension.dart';
import 'detail_page_controller.dart';

class DetailPage extends StatelessWidget {
  final indicator = Get.put(DetailPageController());
  DetailPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Detail Produk",
        onBackPressed: () {
          Get.back();
        },
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              "https://via.placeholder.com/165x110",
              fit: BoxFit.cover,
              height: 325,
              width: double.infinity,
            ),
            Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Row(
                          children: [
                            CardQuantity(
                                title: "produk",
                                fillColor: Color(0xFFFF3D3D),
                                textColor: Color(0xFFFFFFFF)),
                            CardQuantity(
                                title: "20 Terjual",
                                fillColor: Color(0xFFFFFFFF),
                                textColor: Color(0xFF30475E))
                          ],
                        ),
                        IconButton(
                          onPressed: () {
                            indicator.toggleLike();
                          },
                          icon: Obx(() => Icon(
                                indicator.isLiked.value
                                    ? FeatherIcons.heart
                                    : Icons.favorite,
                                color: indicator.isLiked.value
                                    ? const Color(0xFF30475E)
                                    : Colors.red,
                                size: 24,
                              )),
                        ),
                      ],
                    ),
                    customTextWidget(
                      'Lorem ipsum dolor sit amet',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF222831),
                      ),
                    ),
                    customTextWidget(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec odio. Praesent libero. Sed cursus ante dapibus diam. Sed nisi. Nulla quis sem at nibh elementum imperdiet. Duis sagittis ipsum. Praesent mauris. Fusce nec tellus sed augue semper porta. Mauris massa. Vestibulum lacinia arcu eget nulla. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.",
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF30475E),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        customTextWidget(
                          'Rp 15.000',
                          style: const TextStyle(
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
                            const Text(
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
                    const Divider(
                      color: Color(0xFF222831), // Atur warna garis
                      thickness: 1, // Atur ketebalan garis
                      height: 0, // Atur tinggi garis
                    ),
                    SizedBox(
                      height: 40,
                      width: double.infinity,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            ClipOval(
                              child: Image.network(
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSU5NotY59b9Il4DR4FAUdE6cDxIvYQTHdi2CLPuMmv_Q&s",
                                width: 40,
                                height: 40,
                                fit: BoxFit.cover,
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
                                    BtnSeller(
                                      title: "Chat Penjual",
                                      ontap: () {},
                                    ),
                                    BtnSeller(
                                      title: "Lihat Toko",
                                      ontap: () {},
                                    ),
                                  ].withSpaceBetween(width: 7),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    const SellerInfo(
                                        title: "Jumlah Produk", jumlah: "2"),
                                    const SellerInfo(
                                        title: "Jumlah Jasa", jumlah: "3"),
                                  ].withSpaceBetween(width: 7),
                                ),
                                Row(
                                  children: [
                                    const SellerInfo(
                                        title: "Penilaian", jumlah: "4.5"),
                                    const SellerInfo(
                                        title: "Pengikut", jumlah: "444"),
                                  ].withSpaceBetween(width: 7),
                                )
                              ].withSpaceBetween(height: 12),
                            )
                          ].withSpaceBetween(width: 10),
                        ),
                      ),
                    ),
                    const Divider(
                      color: Color(0xFF222831), // Atur warna garis
                      thickness: 1, // Atur ketebalan garis
                      height: 0, // Atur tinggi garis
                    ),
                    SizedBox(
                      height: 40,
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
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
                              const Text(
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
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return const CommentSection(
                            imagePath:
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSU5NotY59b9Il4DR4FAUdE6cDxIvYQTHdi2CLPuMmv_Q&s",
                            name: "lorem ipsum",
                            date: "date",
                            desc:
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec odio. Praesent libero. Sed cursus ante dapibus diam. Sed nisi. Nulla quis sem at nibh elementum imperdiet. Duis sagittis ipsum. Praesent mauris. Fusce nec tellus sed augue semper porta. Mauris massa. Vestibulum lacinia arcu eget nulla. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.");
                      },
                      itemCount: 5,
                    ),
                  ].withSpaceBetween(height: 10),
                ))
          ].withSpaceBetween(height: 15),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 6,
              offset: const Offset(0, -3), // changes position of shadow
            ),
          ],
        ),
        child: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: const Color(0xFFF5F5F5),
                    borderRadius: BorderRadius.circular(5)),
                child: const Icon(
                  FeatherIcons.shoppingCart,
                  size: 24,
                  color: Color(0xFF222831),
                ),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              label: '',
              icon: Padding(
                padding: const EdgeInsets.only(right: 30.0),
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: const Color(0xFF30475E),
                      borderRadius: BorderRadius.circular(5)),
                  child: const Text(
                    'Beli Sekarang',
                    style: TextStyle(
                      color: Colors.white, // Warna teks
                      fontWeight: FontWeight.bold, // Ketebalan teks
                    ),
                  ),
                ),
              ),
            ),
          ],
          onTap: (int index) {
            if (index == 0) {
            } else if (index == 1) {}
          },
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
        ),
      ),
    );
  }
}

Widget customTextWidget(
  String text, {
  TextStyle? style,
  TextAlign? textAlign,
}) {
  return Text(
    text,
    style: style, // Style teks yang bisa disesuaikan
    textAlign: textAlign, // Penyelarasan teks yang bisa disesuaikan
  );
}
