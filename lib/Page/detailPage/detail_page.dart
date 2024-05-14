import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:rusconsign/page/detailPage/widgets/komponen.dart';
import 'package:rusconsign/utils/colors.dart';
import 'package:rusconsign/utils/text_style.dart';
import '../../utils/app_responsive.dart';
import 'detail_page_controller.dart';

class DetailPage extends StatelessWidget {
  final contoller = Get.put(DetailPageController());
  DetailPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background,
        surfaceTintColor: Colors.white,
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
          'detailProduk'.tr,
          style: AppTextStyle().title(AppColors.titleLine),
        ),
        centerTitle: true,
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
              height: AppResponsive().screenHeight(context) * 0.35,
              width: double.infinity,
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: AppResponsive().screenWidth(context) * 0.2,
                            height: 30,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(4),
                              child: Material(
                                color: AppColors.button1,
                                child: Center(
                                  child: Text(
                                    'produk'.tr,
                                    style: AppTextStyle()
                                        .descriptionBold(AppColors.textButton1),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            '20 ${'terjual'.tr}',
                            style: AppTextStyle()
                                .descriptionBold(AppColors.description),
                          )
                        ],
                      ),
                      SizedBox(
                        width: 40,
                        height: 40,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(6),
                          child: Material(
                            color: AppColors.cardIconFill,
                            child: Obx(
                              () => GestureDetector(
                                onTap: () {
                                  contoller.toggleFavorite();
                                },
                                child: Icon(
                                  contoller.isFavorite.value
                                      ? Icons.favorite_rounded
                                      : Icons.favorite_border_rounded,
                                  color: contoller.isFavorite.value
                                      ? AppColors.button1
                                      : AppColors.description,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Lorem Ipsum Dolor sit amet",
                        style: AppTextStyle().title(AppColors.titleLine),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec odio. Praesent libero. Sed cursus ante dapibus diam. Sed nisi. Nulla quis sem at nibh elementum imperdiet. Duis sagittis ipsum. Praesent mauris. Fusce nec tellus sed augue semper porta. Mauris massa. Vestibulum lacinia arcu eget nulla. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.",
                        style:
                            AppTextStyle().description(AppColors.description),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Rp ' '15000',
                        style: AppTextStyle().title(AppColors.hargaStat),
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          const Stack(
                            alignment: Alignment.center,
                            children: [
                              Icon(
                                Icons.star,
                                color: AppColors.bintang,
                                size: 22,
                              ),
                              Icon(
                                Icons.star_border_rounded,
                                color: AppColors.borderIcon,
                                size: 24,
                              ),
                            ],
                          ),
                          const SizedBox(width: 6),
                          Text(
                            '4.0',
                            style:
                                AppTextStyle().subHeader(AppColors.description),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Divider(
                    color: AppColors.titleLine,
                    thickness: 1,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 40,
                        height: 40,
                        child: Column(
                          children: [
                            ClipOval(
                              child: Image.network(
                                'https://via.placeholder.com/40x40',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Bagas Prasetyo',
                            style:
                                AppTextStyle().description(AppColors.titleLine),
                          ),
                          const SizedBox(height: 4),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 80,
                                height: 30,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ButtonStyle(
                                    padding: const MaterialStatePropertyAll(
                                        EdgeInsets.zero),
                                    elevation:
                                        const MaterialStatePropertyAll(0),
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                    ),
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            AppColors.button2),
                                  ),
                                  child: Text(
                                    'chatPenjual'.tr,
                                    style: AppTextStyle()
                                        .textInfoBold(AppColors.textButton2),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 4),
                              SizedBox(
                                width: 80,
                                height: 30,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ButtonStyle(
                                    padding: const MaterialStatePropertyAll(
                                        EdgeInsets.zero),
                                    elevation:
                                        const MaterialStatePropertyAll(0),
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                    ),
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            AppColors.button2),
                                  ),
                                  child: Text(
                                    'lihatToko'.tr,
                                    style: AppTextStyle()
                                        .textInfoBold(AppColors.textButton2),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 90,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'jumlahProduk'.tr,
                                  style: AppTextStyle()
                                      .textInfo(AppColors.titleLine),
                                ),
                                const Spacer(),
                                Text(
                                  '2',
                                  style: AppTextStyle()
                                      .textInfoBold(AppColors.hargaStat),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            width: 90,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'penilaian'.tr,
                                  style: AppTextStyle()
                                      .textInfo(AppColors.titleLine),
                                ),
                                const Spacer(),
                                Text(
                                  '4.5',
                                  style: AppTextStyle()
                                      .textInfoBold(AppColors.hargaStat),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 90,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'jumlahJasa'.tr,
                                  style: AppTextStyle()
                                      .textInfo(AppColors.titleLine),
                                ),
                                const Spacer(),
                                Text(
                                  '5',
                                  style: AppTextStyle()
                                      .textInfoBold(AppColors.hargaStat),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            width: 90,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'pengikut'.tr,
                                  style: AppTextStyle()
                                      .textInfo(AppColors.titleLine),
                                ),
                                const Spacer(),
                                Text(
                                  '287',
                                  style: AppTextStyle()
                                      .textInfoBold(AppColors.hargaStat),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Divider(
                    color: AppColors.titleLine,
                    thickness: 1,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'penilaianProduk'.tr,
                        style: AppTextStyle().subHeader(AppColors.titleLine),
                      ),
                      const Spacer(),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'ulasan'.tr,
                            style: AppTextStyle()
                                .description(AppColors.description),
                          ),
                          RatingBar.builder(
                            ignoreGestures: true,
                            unratedColor: AppColors.nonActiveBar,
                            itemSize: 20,
                            maxRating: 5.0,
                            initialRating: 4.5,
                            minRating: 0.0,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemBuilder: (context, _) => const Stack(
                              alignment: Alignment.center,
                              children: [
                                Icon(
                                  Icons.star,
                                  color: AppColors.bintang,
                                  size: 18,
                                ),
                                Icon(
                                  Icons.star_border_rounded,
                                  color: AppColors.borderIcon,
                                  size: 20,
                                ),
                              ],
                            ),
                            onRatingUpdate: (rating) {},
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
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
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding:
            const EdgeInsets.only(left: 40, right: 40, top: 15, bottom: 15),
        height: AppResponsive().screenHeight(context) * 0.090,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.background,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 6,
              offset: const Offset(0, -3), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F5F5),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const Icon(
                  FeatherIcons.shoppingCart,
                  size: 24,
                  color: AppColors.titleLine,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.toNamed("/checkoutpage");
              },
              child: Container(
                alignment: Alignment.center,
                padding:
                    const EdgeInsets.symmetric(horizontal: 55, vertical: 10),
                decoration: BoxDecoration(
                  color: AppColors.description,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text('Beli Sekarang',
                    style: AppTextStyle().subHeader(AppColors.textButton2)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
