import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:rusconsign/detailPage/widgets/komponen.dart';
import 'package:rusconsign/utils/colors.dart';
import 'package:rusconsign/utils/extension.dart';
import 'package:rusconsign/utils/text_style.dart';
import '../utils/app_responsive.dart';
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
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              "https://via.placeholder.com/165x110",
              fit: BoxFit.cover,
              height: AppResponsive().screenHeight(context) * 0.420,
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
                                fillColor: AppColors.hargaStat,
                                textColor: AppColors.background),
                            CardQuantity(
                                title: "20 Terjual",
                                fillColor: AppColors.background,
                                textColor: AppColors.description)
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
                                    ? AppColors.description
                                    : Colors.red,
                                size: 24,
                              )),
                        ),
                      ],
                    ),
                    Text(
                      "Lorem Ipsum Dolor sit amet",
                      style: AppTextStyle().title(AppColors.titleLine),
                    ),
                    Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec odio. Praesent libero. Sed cursus ante dapibus diam. Sed nisi. Nulla quis sem at nibh elementum imperdiet. Duis sagittis ipsum. Praesent mauris. Fusce nec tellus sed augue semper porta. Mauris massa. Vestibulum lacinia arcu eget nulla. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.",
                      style: AppTextStyle().description(AppColors.description),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Rp 15.000",
                          style: AppTextStyle().title(AppColors.hargaStat),
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                FeatherIcons.star,
                                color: AppColors.description,
                                size: 20,
                              ),
                            ),
                            Text(
                              '4.0',
                              textAlign: TextAlign.center,
                              style: AppTextStyle()
                                  .textInfoBold(AppColors.description),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Divider(
                      color: AppColors.titleLine, // Atur warna garis
                      thickness: 1, // Atur ketebalan garis
                      height: 0, // Atur tinggi garis
                    ),
                    SizedBox(
                      height: AppResponsive().screenHeight(context) * 0.050,
                      width: double.infinity,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            ClipOval(
                              child: Image.network(
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSU5NotY59b9Il4DR4FAUdE6cDxIvYQTHdi2CLPuMmv_Q&s",
                                width: AppResponsive().screenWidth(context) *
                                    0.110,
                                height: AppResponsive().screenHeight(context) *
                                    0.060,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Bagas Prasetya",
                                    style: AppTextStyle()
                                        .textInfo(AppColors.titleLine)),
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
                      color: AppColors.titleLine, // Atur warna garis
                      thickness: 1, // Atur ketebalan garis
                      height: 0, // Atur tinggi garis
                    ),
                    SizedBox(
                      height: AppResponsive().screenHeight(context) * 0.050,
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Penilaian Produk",
                              style:
                                  AppTextStyle().header(AppColors.description)),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text("2 Ulasan",
                                  style: AppTextStyle()
                                      .description(AppColors.description)),
                              Row(
                                children: [
                                  const Icon(
                                    FeatherIcons.star,
                                    color: AppColors.description,
                                    size: 15,
                                  ),
                                  const Icon(
                                    FeatherIcons.star,
                                    color: AppColors.description,
                                    size: 15,
                                  ),
                                  const Icon(
                                    FeatherIcons.star,
                                    color: AppColors.description,
                                    size: 15,
                                  ),
                                  const Icon(
                                    FeatherIcons.star,
                                    color: AppColors.description,
                                    size: 15,
                                  ),
                                  const Icon(
                                    FeatherIcons.star,
                                    color: AppColors.description,
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
                  color: AppColors.titleLine,
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
                      color: AppColors.description,
                      borderRadius: BorderRadius.circular(5)),
                  child: const Text(
                    'Beli Sekarang',
                    style: TextStyle(
                      color: AppColors.background, // Warna teks
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
    style: style,
    textAlign: textAlign,
  );
}
