import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:rusconsign/Page/cartPage/controller/cart_controller.dart';
import 'package:rusconsign/utils/colors.dart';
import 'package:rusconsign/utils/size_data.dart';
import 'package:rusconsign/utils/text_style.dart';

class AppBarCart extends StatelessWidget implements PreferredSizeWidget {
  const AppBarCart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartController controller = Get.find();

    return AppBar(
      elevation: null,
      surfaceTintColor: AppColors.background,
      backgroundColor: AppColors.background,
      title: Text(
        'keranjang'.tr,
        style: AppTextStyle().title(context, AppColors.titleLine),
      ),
      actions: [
        Obx(() {
          return IconButton(
            onPressed: controller.selectedItems.isNotEmpty
                ? () {
                    for (var index in controller.selectedItems) {
                      final idCart = controller.cartItems[index].cartsId;
                      controller.removeFromCart(idCart);
                    }
                  }
                : null,
            icon: Icon(
              FeatherIcons.trash,
              color: controller.selectedItems.isNotEmpty
                  ? AppColors.button1
                  : AppColors.nonActiveBar,
              size: SizeData.iconSize,
            ),
          );
        }),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
