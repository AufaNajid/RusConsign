import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:rusconsign/Page/userProfilePage/user_profile_controller.dart';
import 'package:rusconsign/Page/userProfilePage/widgets/component.dart';
import 'package:rusconsign/utils/extension.dart';
import '../../utils/colors.dart';
import '../../utils/text_style.dart';
import '../detailPage/widgets/komponen.dart';
import '../homePage/widgets/product_card.dart';

class UserProfilePage extends StatelessWidget {
  final indicat = Get.put(UserProfilePageController());
  UserProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Profil Pengguna",
        onBackPressed: () {
          Get.back();
        },
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: 90,
                  height: 90,
                  decoration: const ShapeDecoration(
                    image: DecorationImage(
                      image:
                          NetworkImage("https://via.placeholder.com/165x110"),
                      fit: BoxFit.fill,
                    ),
                    shape: CircleBorder(),
                  ),
                ),
              ),
              Text("Raihan Pace",
                  style: AppTextStyle().title(AppColors.titleLine)),
              Text("raihanmaulana084@gmail.com",
                  style: AppTextStyle().description(AppColors.description)),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomInfo(
                    icon: FeatherIcons.userCheck,
                    info: "Pengikut",
                    infoNumber: "182",
                  ),
                  CustomInfo(
                    icon: FeatherIcons.users,
                    info: "Jumlah Jasa",
                    infoNumber: "2",
                  ),
                  CustomInfo(
                    icon: FeatherIcons.box,
                    info: "Jumlah Produk",
                    infoNumber: "3",
                  ),
                  CustomInfo(
                    icon: FeatherIcons.star,
                    info: "Penilaian",
                    infoNumber: "4.5",
                  ),
                ],
              ),
              Text(
                "Halo semuanya, aku Raihan Pace. Disini kamu bisa membeli barang atau jasa yang saya berikan disini. kalau mau ketemu jangan sungkan, aku ada di sekitaran lingkungan SMK RUS kok.",
                style: AppTextStyle().textInfo(AppColors.description),
                maxLines: 5,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
              Column(
                children: [
                  MyButtonProfile(
                    onClick: () {},
                    text: "Chat Penjual",
                    prefixIcon: FeatherIcons.messageCircle,
                    backgroundColor: AppColors.hargaStat,
                    foregroundColor: AppColors.background,
                    textAlign: TextAlign.center,
                  ),
                  MyButtonProfile(
                    onClick: () {},
                    text: "Ikuti",
                    prefixIcon: FeatherIcons.userPlus,
                    backgroundColor: AppColors.hargaStat,
                    foregroundColor: AppColors.background,
                    textAlign: TextAlign.center,
                  ),
                ].withSpaceBetween(height: 10),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Halaman Produk dan Jasa',
                    style: AppTextStyle().subHeader(AppColors.titleLine),
                  ),
                  const SizedBox(height: 8),
                  const Row(
                    children: [
                      FilterButton(
                        text: 'Semua',
                        icon: FeatherIcons.alignJustify,
                        index: 0,
                      ),
                      Spacer(),
                      FilterButton(
                        text: 'Jasa',
                        icon: FeatherIcons.users,
                        index: 1,
                      ),
                      Spacer(),
                      FilterButton(
                        text: 'Produk',
                        icon: FeatherIcons.box,
                        index: 2,
                      )
                    ],
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          cursorColor: AppColors.hargaStat,
                          style: AppTextStyle()
                              .descriptionBold(AppColors.description),
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: AppColors.cardIconFill,
                            hintText: 'Cari jasa atau produk...',
                            hintStyle: AppTextStyle()
                                .description(AppColors.description),
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      const SizedBox(width: 12),
                      SizedBox(
                        width: 50,
                        height: 50,
                        child: Ink(
                          decoration: ShapeDecoration(
                            color: AppColors.cardIconFill,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              FeatherIcons.search,
                              color: AppColors.borderIcon,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Obx(
                    () {
                      if (indicat.selectedIndex == 1) {
                        return GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 10,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 8,
                            childAspectRatio: 0.8,
                          ),
                          itemBuilder: (BuildContext context, int index) {
                            return ProductCard(
                              imagePath: 'https://via.placeholder.com/165x110',
                              title: 'Judul Jasa $index',
                              price: 12000,
                              rating: (index % 5) + 1,
                            );
                          },
                        );
                      } else if (indicat.selectedIndex == 2) {
                        return GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 10,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 8,
                            childAspectRatio: 0.8,
                          ),
                          itemBuilder: (BuildContext context, int index) {
                            return ProductCard(
                              imagePath: 'https://via.placeholder.com/165x110',
                              title: 'Judul Produk $index',
                              price: 12000,
                              rating: (index % 5) + 1,
                            );
                          },
                        );
                      } else {
                        return GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 10,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 8,
                            childAspectRatio: 0.8,
                          ),
                          itemBuilder: (BuildContext context, int index) {
                            return ProductCard(
                              imagePath: 'https://via.placeholder.com/165x110',
                              title:
                                  'Product awdmidjnmaiud dhuawnduawndad ahuwduawydhaydh uahdnuawnduawyd $index',
                              price: 12000,
                              rating: (index % 5) + 1,
                            );
                          },
                        );
                      }
                    },
                  ),
                ],
              ),
            ].withSpaceBetween(height: 15),
          ),
        ),
      ),
    );
  }
}
