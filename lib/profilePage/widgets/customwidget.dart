import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:rusconsign/profilePage/profile_page_controller.dart';
import 'package:rusconsign/utils/app_responsive.dart';
import 'package:rusconsign/utils/colors.dart';
import 'package:rusconsign/utils/text_style.dart';

class CustomInfoWidget extends StatelessWidget {
  final IconData icon;
  final String info;
  final String infoNumber;

  const CustomInfoWidget({
    required this.icon,
    required this.info,
    required this.infoNumber,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          width: 55,
          height: 55,
          decoration: const ShapeDecoration(
            color: Color(0xFFF5F5F5),
            shape: OvalBorder(),
          ),
          child: Icon(icon),
        ),
        Text(
          info,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Color(0xFF30475E),
            fontSize: 11,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
            height: 0,
          ),
        ),
        Text(
          infoNumber,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Color(0xFFFF3C3C),
            fontSize: 11,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
            height: 0,
          ),
        )
      ],
    );
  }
}

class SectionButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final int index;

  const SectionButton({
    Key? key,
    required this.text,
    required this.icon,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SectionController sectionButtonController = Get.find();

    return Obx(() => OutlinedButton.icon(
          style: ButtonStyle(
            side: MaterialStateProperty.all(BorderSide(
              color: sectionButtonController.selectedIndex == index
                  ? const Color(0xFFFF3C3C)
                  : const Color(0xFFECECEC),
            )),
            shape: MaterialStateProperty.all<OutlinedBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
            ),
          ),
          icon: Icon(
            icon,
            color: sectionButtonController.selectedIndex == index
                ? const Color(0xFFFF3C3C)
                : const Color(0xFF30475E),
          ),
          label: Text(
            text,
            style: TextStyle(
              color: sectionButtonController.selectedIndex == index
                  ? const Color(0xFFFF3C3C)
                  : const Color(0xFF30475E),
              fontSize: 13,
            ),
          ),
          onPressed: () {
            if (sectionButtonController.selectedIndex != index) {
              sectionButtonController.setSelectedFilter(index);
              if (index == 0) {
                sectionButtonController
                    .setSelectedSection(const SectionPribadi());
              } else if (index == 1) {
                sectionButtonController.setSelectedSection(const Placeholder());
              }
            }
          },
        ));
  }
}

class SectionPribadi extends StatelessWidget {
  const SectionPribadi({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SettingWidget(icon: FeatherIcons.archive, text: "Penjualan"),
        SettingWidget(icon: FeatherIcons.messageCircle, text: "Penjualan"),
      ],
    );
  }
}

class SettingWidget extends StatelessWidget {
  final IconData icon;
  final String text;

  const SettingWidget({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        Text(
          text,
          style: AppTextStyle().description(AppColors.description),
        ),
        const Icon(FeatherIcons.chevronRight)
      ],
    );
  }
}

class TabList extends StatefulWidget {
  @override
  _TabListState createState() => _TabListState();
}

class _TabListState extends State<TabList> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late Color _borderColor1;
  late Color _borderColor2;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _borderColor1 = AppColors.activeIcon;
    _borderColor2 = AppColors.nonActiveIcon;
    _tabController.addListener(() {
      setState(() {
        if (_tabController.index == 0) {
          _borderColor1 = AppColors.activeIcon;
          _borderColor2 = AppColors.nonActiveIcon;
        } else {
          _borderColor1 = AppColors.nonActiveIcon;
          _borderColor2 = AppColors.activeIcon;
        }
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
Widget build(BuildContext context) {
  return Container(
    width: double.infinity,
    child: Column(
      children: [
        TabBar(
          labelPadding: EdgeInsets.zero,
          controller: _tabController,
          labelColor: AppColors.activeIcon,
          unselectedLabelColor: AppColors.nonActiveIcon,
          indicator: BoxDecoration(color: AppColors.bintang),
          dividerColor: AppColors.background,
          tabs: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(
                  color: _borderColor1,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(3),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Icon(FeatherIcons.activity), Text("data")],
              ),
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(
                  // Warna border saat tidak dipilih
                  color: _borderColor2,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(3),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Icon(FeatherIcons.airplay), Text("data2")],
              ),
            ),
          ],
        ),

        Container(
          width: double.maxFinite,
          height: 300,
          child: TabBarView(
            controller: _tabController,
            children: [
              Container(
                color: AppColors.cardIconFill,
                child: Column(
                  children: [
                    SettingWidget(icon: FeatherIcons.archive, text: "Pembelian Produk/Jasa"),
                    SettingWidget(icon: FeatherIcons.messageCircle, text: "Chat"),
                    SettingWidget(icon: FeatherIcons.bell, text: "Notifikasi"),
                    SettingWidget(icon: FeatherIcons.settings, text: "Pengaturan")
                  ],
                ),
              ),
              Text("data")
            ],
          ),
        ),
      ],
    ),
  );
}}