import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:rusconsign/homePage/home_page.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    PersistentTabController controller =
        PersistentTabController(initialIndex: 0);

    List<Widget> buildScreens() {
      return [
        HomePage(),
        HomePage(),
        HomePage(),
        HomePage(),
      ];
    }

    List<PersistentBottomNavBarItem> navbarItem() {
      return [
        PersistentBottomNavBarItem(
          icon: const Icon(FeatherIcons.home),
          inactiveColorPrimary: const Color(0xFF30475E),
          activeColorPrimary: const Color(0xFFFF3D3D),
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(FeatherIcons.heart),
          inactiveColorPrimary: const Color(0xFF30475E),
          activeColorPrimary: const Color(0xFFFF3D3D),
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(FeatherIcons.shoppingCart),
          inactiveColorPrimary: const Color(0xFF30475E),
          activeColorPrimary: const Color(0xFFFF3D3D),
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(FeatherIcons.user),
          inactiveColorPrimary: const Color(0xFF30475E),
          activeColorPrimary: const Color(0xFFFF3D3D),
        ),
      ];
    }

    return PersistentTabView(
      context,
      controller: controller,
      screens: buildScreens(),
      items: navbarItem(),
      confineInSafeArea: true,
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style6,
    );
  }
}