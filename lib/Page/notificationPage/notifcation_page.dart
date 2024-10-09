import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:rusconsign/Page/notificationPage/widgets/notification_card.dart';
import 'package:rusconsign/utils/colors.dart';
import 'package:rusconsign/utils/size_data.dart';
import 'package:rusconsign/utils/text_style.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            FeatherIcons.chevronLeft,
            color: AppColors.borderIcon,
            size: SizeData.iconSize,
          ),
        ),
        title: Text(
          'notifikasi'.tr,
          style: AppTextStyle().title(context, AppColors.titleLine),
        ),
        centerTitle: true,
        backgroundColor: AppColors.background,
        surfaceTintColor: AppColors.background,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              FeatherIcons.trash2,
              color: AppColors.button1,
              size: SizeData.iconSize,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return NotificationCard(
              imagePath: 'https://via.placeholder.com/50x50',
              title: 'bnudnuswhudawd fgdfdfdfdf',
              desc:
                  'mndinadinaidnikakwmdiawdjaw dnadaw da wdiknawidaw diandiawdiawdawdada diamndadnad adawndjawd diandiandjawd',
              date: DateTime.now(),
            );
          },
        ),
      ),
    );
  }
}
