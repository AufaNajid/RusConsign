import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:rusconsign/Page/userProfilePage/user_profile_controller.dart';
import 'package:rusconsign/Page/userProfilePage/widgets/button_icon_widget.dart';
import 'package:rusconsign/Page/userProfilePage/widgets/filter_button.dart';
import 'package:rusconsign/Page/userProfilePage/widgets/profile_info_card.dart';
import '../../utils/colors.dart';
import '../../utils/text_style.dart';
import '../homePage/widgets/product_card.dart';

class UserProfilePage extends StatelessWidget {
  final controller = Get.put(UserProfilePageController());
  UserProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        surfaceTintColor: AppColors.background,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            FeatherIcons.chevronLeft,
            color: AppColors.borderIcon,
          ),
        ),
        title: Text(
          'profilPengguna'.tr,
          style: AppTextStyle().title(AppColors.titleLine),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(
                width: 90,
                height: 90,
                child: ClipOval(
                  child: Image.network(
                    'https://via.placeholder.com/90x90',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Text(
                'Raihan Maulana',
                style: AppTextStyle().title(AppColors.titleLine),
              ),
              const SizedBox(height: 5),
              Text(
                'raihanmaulana084@gmail.com',
                style: AppTextStyle().description(AppColors.description),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ProfileInfoCard(
                    icon: FeatherIcons.userCheck,
                    title: 'pengikut'.tr,
                    data: '287',
                  ),
                  ProfileInfoCard(
                    icon: FeatherIcons.users,
                    title: 'jumlahJasa'.tr,
                    data: '287',
                  ),
                  ProfileInfoCard(
                    icon: FeatherIcons.box,
                    title: 'jumlahProduk'.tr,
                    data: '287',
                  ),
                  ProfileInfoCard(
                    icon: FeatherIcons.star,
                    title: 'penilaian'.tr,
                    data: '287',
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  textAlign: TextAlign.center,
                  'afenuihidhiad andiad idanduand oawkdne vknma coijcjcinadin acnincanc inanic iadiand adiandoandiandiand adianndiandianidad iadniandinadina diandiandianda diandiandia',
                  style: AppTextStyle().textInfo(AppColors.description),
                ),
              ),
              const SizedBox(height: 20),
              ButtonIconWidget(
                icon: FeatherIcons.messageCircle,
                title: 'chatPenjual'.tr,
              ),
              const SizedBox(height: 10),
              ButtonIconWidget(
                icon: FeatherIcons.userPlus,
                title: 'ikuti'.tr,
              ),
              const SizedBox(height: 20),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'halamanP&J'.tr,
                    style: AppTextStyle().subHeader(AppColors.titleLine),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      FilterButton(
                        text: 'semua'.tr,
                        icon: FeatherIcons.alignJustify,
                        index: 0,
                      ),
                      const Spacer(),
                      FilterButton(
                        text: 'jasa'.tr,
                        icon: FeatherIcons.users,
                        index: 1,
                      ),
                      const Spacer(),
                      FilterButton(
                        text: 'produk'.tr,
                        icon: FeatherIcons.box,
                        index: 2,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
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
                            hintText: 'cari'.tr,
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
                      if (controller.selectedIndex == 1) {
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
                      } else if (controller.selectedIndex == 2) {
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
                  const SizedBox(height: 5),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
