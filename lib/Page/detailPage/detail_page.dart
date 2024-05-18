import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:rusconsign/Page/detailPage/widgets/comment_card.dart';
import 'package:rusconsign/utils/colors.dart';
import 'package:rusconsign/utils/extension.dart';
import 'package:rusconsign/utils/text_style.dart';
import '../../utils/app_responsive.dart';
import 'detail_page_controller.dart';

class DetailPage extends StatelessWidget {
  final controller = Get.put(DetailPageController());
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
                          Text(
                            '20 ${'terjual'.tr}',
                            style: AppTextStyle()
                                .descriptionBold(AppColors.description),
                          )
                        ].withSpaceBetween(width: 10),
                      ),
                      const Spacer(),
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
                                  controller.toggleFavorite();
                                },
                                child: Icon(
                                  controller.isFavorite.value
                                      ? Icons.favorite_rounded
                                      : Icons.favorite_border_rounded,
                                  color: controller.isFavorite.value
                                      ? AppColors.hargaStat
                                      : AppColors.borderIcon,
                                      size: 24,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Lorem Ipsum Dolor sit amet",
                        style: AppTextStyle().title(AppColors.titleLine),
                      ),
                      Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec odio. Praesent libero. Sed cursus ante dapibus diam. Sed nisi. Nulla quis sem at nibh elementum imperdiet. Duis sagittis ipsum. Praesent mauris. Fusce nec tellus sed augue semper porta. Mauris massa. Vestibulum lacinia arcu eget nulla. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.",
                        style:
                            AppTextStyle().description(AppColors.description),
                      ),
                    ].withSpaceBetween(height: 10),
                  ),
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
                          Text(
                            '4.0',
                            style:
                                AppTextStyle().subHeader(AppColors.description),
                          ),
                        ].withSpaceBetween(width: 5),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Divider(
                        color: AppColors.titleLine,
                        thickness: 1,
                      ),
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
                                        shape: MaterialStatePropertyAll(
                                          RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(4),
                                          ),
                                        ),
                                        backgroundColor:
                                            const MaterialStatePropertyAll(
                                                AppColors.button2),
                                      ),
                                      child: Text(
                                        'chatPenjual'.tr,
                                        style: AppTextStyle()
                                            .textInfoBold(AppColors.textButton2),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 80,
                                    height: 30,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Get.toNamed('/userprofilepage');
                                      },
                                      style: ButtonStyle(
                                        padding: const MaterialStatePropertyAll(
                                            EdgeInsets.zero),
                                        elevation:
                                            const MaterialStatePropertyAll(0),
                                        shape: MaterialStatePropertyAll(
                                          RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(4),
                                          ),
                                        ),
                                        backgroundColor:
                                            const MaterialStatePropertyAll(
                                                AppColors.button2),
                                      ),
                                      child: Text(
                                        'lihatToko'.tr,
                                        style: AppTextStyle()
                                            .textInfoBold(AppColors.textButton2),
                                      ),
                                    ),
                                  ),
                                ].withSpaceBetween(width: 5),
                              )
                            ],
                          ),
                          Expanded(
                            child: Row(
                              children: [
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
                                  ].withSpaceBetween(height: 20),
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
                                  ].withSpaceBetween(height: 20),
                                ),
                              ],
                            ),
                          ),
                        ].withSpaceBetween(width: 8),
                      ),
                      const Divider(
                        color: AppColors.titleLine,
                        thickness: 1,
                      ),
                    ].withSpaceBetween(height: 10),
                  ),
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
                        ].withSpaceBetween(height: 5),
                      )
                    ],
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return CommentCard(
                        imagePath: 'https://via.placeholder.com/40x40',
                        username: 'Muhammad Alfarezi',
                        rating: 4.0,
                        date: DateTime.now(),
                        desc:
                            'mndinadinaidn uwbndbwdnuiwd iwndiwdnw iwdbwd iwdnujwjdb iwdbuiwnduiw ijjdaosfmeai kakwmdiawdjaw dnadaw da wdiknawidaw diandiawdi awdawdada diamnd adnad adawndjawd diandi andjawd',
                        like: 142,
                        disLike: 12,
                        onliked: () {
                          controller.toggleThumbsUp();
                        },
                        ondisliked: () {
                          controller.toggleThumbsDown();
                        },
                      );
                    },
                  ),
                ].withSpaceBetween(height: 15),
              ),
            ),
          ].withSpaceBetween(height: 15),
        ),
      ),
      bottomNavigationBar: SizedBox(
        width: double.infinity,
        height: AppResponsive().screenHeight(context) * 0.08,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 50,
                height: 50,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Material(
                    color: AppColors.cardIconFill,
                    child: Obx(
                      () => GestureDetector(
                        onTap: () {
                          controller.toggleAddcart();
                        },
                        child: Icon(
                          controller.isAddCart.value
                              ? BootstrapIcons.cart_check_fill
                              : BootstrapIcons.cart,
                          color: controller.isAddCart.value
                              ? AppColors.hargaStat
                              : AppColors.borderIcon,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const Spacer(),
              SizedBox(
                width: AppResponsive().screenWidth(context) * 0.7,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed('/checkoutpage');
                  },
                  style: ButtonStyle(
                    padding: const MaterialStatePropertyAll(EdgeInsets.zero),
                    elevation: const MaterialStatePropertyAll(0),
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    backgroundColor:
                        const MaterialStatePropertyAll(AppColors.button2),
                  ),
                  child: Text(
                    'beliSekarang'.tr,
                    style: AppTextStyle().subHeader(AppColors.textButton2),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
