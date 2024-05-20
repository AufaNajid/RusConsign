import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:rusconsign/Page/cartPage/cart_page.dart';
import 'package:rusconsign/page/favoritePage/favorite_page.dart';
import 'package:rusconsign/page/homePage/home_page.dart';
import 'package:rusconsign/page/profilePage/profile_page.dart';
import 'package:rusconsign/utils/app_responsive.dart';
import 'package:rusconsign/utils/colors.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    PersistentTabController controller =
        PersistentTabController(initialIndex: 0);

    List<Widget> buildScreens() {
      return [
        HomePage(),
        const FavoritePage(),
        const CartPage(),
        const ProfilePage(),
      ];
    }

    List<PersistentBottomNavBarItem> navbarItem() {
      return [
        PersistentBottomNavBarItem(
          icon: const Icon(FeatherIcons.home),
          inactiveColorPrimary: AppColors.nonActiveIcon,
          activeColorPrimary: AppColors.activeIcon,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(FeatherIcons.heart),
          inactiveColorPrimary: AppColors.nonActiveIcon,
          activeColorPrimary: AppColors.activeIcon,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(FeatherIcons.shoppingCart),
          inactiveColorPrimary: AppColors.nonActiveIcon,
          activeColorPrimary: AppColors.activeIcon,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(FeatherIcons.user),
          inactiveColorPrimary: AppColors.nonActiveIcon,
          activeColorPrimary: AppColors.activeIcon,
        ),
      ];
    }

    return PersistentTabView(
      context,
      controller: controller,
      screens: buildScreens(),
      items: navbarItem(),
      confineInSafeArea: true,
      backgroundColor: AppColors.background,
      navBarHeight: AppResponsive().screenHeight(context) * 0.065,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      navBarStyle: NavBarStyle.style6,
    );
  }
}