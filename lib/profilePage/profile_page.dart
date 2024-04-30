import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:rusconsign/profilePage/profile_page_controller.dart';
import 'package:rusconsign/profilePage/widgets/customappbar.dart';
import 'package:rusconsign/profilePage/widgets/customtext.dart';
import 'package:rusconsign/profilePage/widgets/customwidget.dart';

class ProfilePage extends StatelessWidget {
  final indicator = Get.put(SectionController());
  ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarProfile(title: "Profil"),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 90,
                height: 90,
                decoration: ShapeDecoration(
                  image: DecorationImage(
                    image: NetworkImage("https://via.placeholder.com/165x110"),
                    fit: BoxFit.fill,
                  ),
                  shape: OvalBorder(),
                ),
              ),
            ),
            CustomAccountUsername(username: "Raihan Pace"),
            CustomDescription(description: "raihanmaulana084@gmail.com"),
            Row(
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
                    infoNumber: "2"),
                CustomInfoWidget(
                    icon: FeatherIcons.box,
                    info: "Jumlah Produk",
                    infoNumber: "3"),
                CustomInfoWidget(
                    icon: FeatherIcons.star,
                    info: "Penilaian",
                    infoNumber: "4.5")
              ],
            ),
            CustomInfoText(
                info:
                    "Halo.. Selamat datang di profil saya. Kalian bisa melihat produk atau jasa yang saya berikan disini. Saya sendiiri juga termasuk siswa SMK RUS, jadi kalau mau ngobrol sama saya bisa ketemuan di sekolah"),
            TabList()
          ],
        ),
      ),
    );
  }
}
