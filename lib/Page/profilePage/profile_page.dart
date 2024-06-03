import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:rusconsign/Page/profilePage/widgets/tab_bar_profile.dart';
import 'package:rusconsign/Page/profilePage/widgets/profile_info_card.dart';
import 'package:rusconsign/Page/profilePage/widgets/customappbar.dart';
import 'package:rusconsign/Page/registerSeller/controller/mitra_controller.dart';
import 'package:rusconsign/authentication/controllers/auth_login_controller.dart';
import 'package:rusconsign/utils/colors.dart';
import 'package:rusconsign/utils/extension.dart';
import 'package:rusconsign/utils/text_style.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  Future<void> refreshData() async {
    final MitraController controller = Get.find<MitraController>();
    await controller.initStatusMitra();
  }

  @override
  Widget build(BuildContext context) {
    final AuthLoginController dataProfile = Get.put(AuthLoginController());
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBarProfile(title: 'profil'.tr),
      body: RefreshIndicator(
        color: AppColors.hargaStat,
        backgroundColor: AppColors.cardIconFill,
        strokeWidth: RefreshProgressIndicator.defaultStrokeWidth,
        onRefresh: () => Future.delayed(
          const Duration(seconds: 2),
          refreshData,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
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
                  Text(
                    dataProfile.dataUsername.value,
                    style: AppTextStyle().title(AppColors.titleLine),
                  ),
                  Text(
                    dataProfile.dataEmail.value,
                    style: AppTextStyle().description(AppColors.description),
                  ),
                ].withSpaceBetween(height: 5),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ProfileInfoCard(
                          icon: FeatherIcons.userCheck,
                          title: 'pengikut'.tr,
                          data: "182",
                        ),
                        ProfileInfoCard(
                          icon: FeatherIcons.users,
                          title: 'jumlahJasa'.tr,
                          data: "2",
                        ),
                        ProfileInfoCard(
                          icon: FeatherIcons.box,
                          title: 'jumlahProduk'.tr,
                          data: "3",
                        ),
                        ProfileInfoCard(
                          icon: FeatherIcons.star,
                          title: 'penilaian'.tr,
                          data: "4.5",
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: Text(
                      "Halo.. Selamat datang di profil saya. Kalian bisa melihat produk atau jasa yang saya berikan disini. Saya sendiiri juga termasuk siswa SMK RUS, jadi kalau mau ngobrol sama saya bisa ketemuan di sekolah",
                      style: AppTextStyle().textInfo(AppColors.description),
                      maxLines: 5,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ].withSpaceBetween(height: 10),
              ),
              const TabList(),
            ].withSpaceBetween(height: 20),
          ),
        ),
      ),
    );
  }
}
