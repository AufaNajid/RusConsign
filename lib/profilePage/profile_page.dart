import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:rusconsign/profilePage/widgets/customappbar.dart';
import 'package:rusconsign/profilePage/widgets/customwidget.dart';
import 'package:rusconsign/utils/app_responsive.dart';
import 'package:rusconsign/utils/colors.dart';
import 'package:rusconsign/utils/text_style.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarProfile(title: "Profil"),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 90,
                height: 90,
                decoration: const ShapeDecoration(
                  image: DecorationImage(
                    image: NetworkImage("https://via.placeholder.com/165x110"),
                    fit: BoxFit.fill,
                  ),
                  shape: CircleBorder(),
                ),
              ),
            ),
            SizedBox(
              height: AppResponsive().screenHeight(context) * 0.02,
            ),
            Text("Raihan Pace",
                style: AppTextStyle().title(AppColors.titleLine)),
            Text("raihanmaulana084@gmail.com",
                style: AppTextStyle().description(AppColors.description)),
            SizedBox(
              height: AppResponsive().screenHeight(context) * 0.02,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomInfoWidget(
                  icon: FeatherIcons.userCheck,
                  info: "Pengikut",
                  infoNumber: "182",
                ),
                CustomInfoWidget(
                  icon: FeatherIcons.users,
                  info: "Jumlah Jasa",
                  infoNumber: "2",
                ),
                CustomInfoWidget(
                  icon: FeatherIcons.box,
                  info: "Jumlah Produk",
                  infoNumber: "3",
                ),
                CustomInfoWidget(
                  icon: FeatherIcons.star,
                  info: "Penilaian",
                  infoNumber: "4.5",
                ),
              ],
            ),
            SizedBox(
              height: AppResponsive().screenHeight(context) * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:30),
              child: Text(
                "Halo.. Selamat datang di profil saya. Kalian bisa melihat produk atau jasa yang saya berikan disini. Saya sendiiri juga termasuk siswa SMK RUS, jadi kalau mau ngobrol sama saya bisa ketemuan di sekolah",
                style: AppTextStyle().textInfo(AppColors.description),
                maxLines: 5,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(height: AppResponsive().screenHeight(context)*0.02),
            const TabList(),
          ],
        ),
      ),
    );
  }
}
