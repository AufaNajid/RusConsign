import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:rusconsign/Page/profilePage/widgets/penjualan_section_tabbar.dart';
import 'package:rusconsign/Page/profilePage/widgets/pribadi_section_tabbar.dart';
import 'package:rusconsign/Page/registerSeller/controller/mitra_controller.dart';
import 'package:rusconsign/utils/app_responsive.dart';
import 'package:rusconsign/utils/colors.dart';
import 'package:rusconsign/utils/size_data.dart';
import 'package:rusconsign/utils/text_style.dart';

class TabList extends StatefulWidget {
  const TabList({Key? key}) : super(key: key);

  @override
  TabListState createState() => TabListState();
}

class TabListState extends State<TabList> with SingleTickerProviderStateMixin {
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
    final MitraController mitraController = Get.put(MitraController());
    mitraController.checkMitraStatus();
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
                    const Icon(
                      FeatherIcons.user,
                      size: SizeData.iconSize,
                    ),
                    SizedBox(
                        width: AppResponsive().screenWidth(context) * 0.01),
                    Text(
                      'pribadi'.tr,
                      style:
                          const TextStyle(fontSize: SizeData.fontSubHeaderSize),
                    )
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
                      size: SizeData.iconSize,
                    ),
                    SizedBox(
                        width: AppResponsive().screenWidth(context) * 0.01),
                    Text(
                      'penjualan'.tr,
                      style:
                          const TextStyle(fontSize: SizeData.fontSubHeaderSize),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Container(
          padding: EdgeInsets.only(
            top: AppResponsive().screenHeight(context) * 0.0150,
          ),
          width: double.maxFinite,
          height: AppResponsive().screenHeight(context) * 0.50,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
          child: Obx(
            () {
              if (mitraController.statumitra.value == "pending") {
                return TabBarView(
                  controller: _tabController,
                  children: [
                    const PribadiSection(),
                    Center(
                      child: SizedBox(
                        width: AppResponsive().screenWidth(context) * 0.8,
                        child: Text(
                          'tungguAdmin'.tr,
                          textAlign: TextAlign.center,
                          style: AppTextStyle()
                              .subHeader(context, AppColors.description),
                        ),
                      ),
                    ),
                  ],
                );
              } else if (mitraController.statumitra.value == "accepted" &&
                  mitraController.isAccepted.value == true) {
                return TabBarView(
                  controller: _tabController,
                  children: const [PribadiSection(), PenjualSectionTrue()],
                );
              } else {
                return TabBarView(
                  controller: _tabController,
                  children: const [PribadiSection(), PenjualanSectionFalse()],
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
