import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:rusconsign/utils/app_responsive.dart';
import 'package:rusconsign/utils/colors.dart';
import 'package:rusconsign/utils/text_style.dart';

class SettingWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final String toPage;

  const SettingWidget({
    Key? key,
    required this.icon,
    required this.text,
    required this.toPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppResponsive().screenHeight(context) * 0.05,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            elevation: 0,
            shape: const BeveledRectangleBorder()),
        onPressed: () {
          Get.toNamed(toPage);
        },
        child: Row(
          children: [
            Icon(icon, color: AppColors.description),
            const Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
            Expanded(
              child: Text(
                text,
                style: AppTextStyle().description(AppColors.description),
              ),
            ),
            const Icon(
              FeatherIcons.chevronRight,
              color: AppColors.description,
            )
          ],
        ),
      ),
    );
  }
}

class TabList extends StatefulWidget {
  const TabList({super.key});

  @override
  // ignore: library_private_types_in_public_api
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
    _borderColor2 = AppColors.nonActiveBar;
    _tabController.addListener(() {
      setState(() {
        if (_tabController.index == 0) {
          _borderColor1 = AppColors.activeIcon;
          _borderColor2 = AppColors.nonActiveBar;
        } else {
          _borderColor1 = AppColors.nonActiveBar;
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
    return Column(
      children: [
        TabBar(
          labelPadding: EdgeInsets.zero,
          controller: _tabController,
          labelColor: AppColors.activeIcon,
          unselectedLabelColor: AppColors.nonActiveIcon,
          indicator: const BoxDecoration(),
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
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(FeatherIcons.user),
                    SizedBox(
                        width: AppResponsive().screenWidth(context) * 0.01),
                    Text('pribadi'.tr)
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(
                  color: _borderColor2,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(3),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      FeatherIcons.shoppingBag,
                    ),
                    SizedBox(
                        width: AppResponsive().screenWidth(context) * 0.01),
                    Text('penjualan'.tr)
                  ],
                ),
              ),
            ),
          ],
        ),
        Container(
          padding: EdgeInsets.only(
              top: AppResponsive().screenHeight(context) * 0.0150),
          width: double.maxFinite,
          height: AppResponsive().screenHeight(context) * 0.50,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
          child: TabBarView(
            controller: _tabController,
            children: const [PribadiSection(), PenjualanSection()],
          ),
        ),
      ],
    );
  }
}

class PenjualanSection extends StatelessWidget {
  const PenjualanSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
            height: AppResponsive().screenHeight(context) * 0.25,
            child: SvgPicture.asset("assets/images/orang_mencet_hp.svg")),
        Text(
          'descResgisterPenjual'.tr,
          style: AppTextStyle().description(AppColors.description),
        ),
        SizedBox(
          height: AppResponsive().screenHeight(context) * 0.02,
        ),
        ElevatedButton(
          onPressed: () {
            Get.toNamed("/registerseller");
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.activeIcon,
              shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(2))),
          child: Text(
            'registerPenjualSekarang'.tr,
            style: AppTextStyle().description(AppColors.background),
          ),
        ),
      ],
    );
  }
}

class PribadiSection extends StatelessWidget {
  const PribadiSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: AppColors.cardIconFill,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            child: SettingWidget(
              icon: FeatherIcons.archive,
              text: 'pembelianPJ'.tr,
              toPage: "/orderpage",
            ),
          ),
          Container(
            decoration: const BoxDecoration(color: AppColors.cardIconFill),
            child: SettingWidget(
              icon: FeatherIcons.messageCircle,
              text: 'chat'.tr,
              toPage: "/detailpage",
            ),
          ),
          Container(
            decoration: const BoxDecoration(color: AppColors.cardIconFill),
            child: SettingWidget(
              icon: FeatherIcons.bell,
              text: 'notifikasi'.tr,
              toPage: "/notificationpage",
            ),
          ),
          Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                color: AppColors.cardIconFill),
            child: SettingWidget(
              icon: FeatherIcons.settings,
              text: 'pengaturan'.tr,
              toPage: "/settingpage",
            ),
          )
        ],
      ),
    );
  }
}
