import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import '../../../../utils/colors.dart';
import '../../setting/setting_view_m.dart';
import '../house/house_index_view_m.dart';
import '../house/house_order_view_m.dart';
import '../house/houser_serarch_view_m.dart';
import '../profile/student_profile_view_m.dart';

class StudentMainViewM extends StatefulWidget {
  const StudentMainViewM({Key? key}) : super(key: key);
  @override
  State<StudentMainViewM> createState() => _StudentMainViewMState();
}

class _StudentMainViewMState extends State<StudentMainViewM> {
  late PersistentTabController _controller;
  final globalKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 2);
  }

  List<Widget> _buildScreens() {
    return [
      const SettingViewM(),
      const StudentProfileViewM(),
      const HouseSearchViewM(),
      const HouseIndexViewM(),
      const HouseOrderViewM(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.settings),
        title: ("Setting".tr),
        activeColorPrimary: AppColors.mainColor,
        inactiveColorPrimary: AppColors.hintColor,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(
          CupertinoIcons.person_crop_square,
        ),
        title: ("Profile".tr),
        activeColorPrimary: AppColors.mainColor,
        inactiveColorPrimary: AppColors.hintColor,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(
          Icons.search,
        ),
        title: ("Search".tr),
        activeColorPrimary: AppColors.mainColor,
        inactiveColorPrimary: AppColors.hintColor,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.house),
        title: ("Houses".tr),
        activeColorPrimary: AppColors.mainColor,
        inactiveColorPrimary: AppColors.hintColor,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.add_home),
        title: ("Order".tr),
        activeColorPrimary: AppColors.mainColor,
        inactiveColorPrimary: AppColors.hintColor,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: globalKey,
        body: PersistentTabView(
          context,
          controller: _controller,
          screens: _buildScreens(),
          items: _navBarsItems(),
          confineInSafeArea: true,
          backgroundColor: Colors.white,
          handleAndroidBackButtonPress: true,
          resizeToAvoidBottomInset: true,
          stateManagement: true,
          hideNavigationBarWhenKeyboardShows: true,
          decoration: NavBarDecoration(
              borderRadius: BorderRadius.circular(6.0),
              colorBehindNavBar: Colors.white,
              boxShadow: [
                const BoxShadow(
                  color: AppColors.mainColor,
                  offset: Offset(
                    0.1,
                    0.1,
                  ),
                  blurRadius: 1.0,
                  spreadRadius: 1.0,
                )
              ]),
          popAllScreensOnTapOfSelectedTab: true,
          popActionScreens: PopActionScreensType.all,
          itemAnimationProperties: const ItemAnimationProperties(
            duration: Duration(milliseconds: 200),
            curve: Curves.ease,
          ),
          screenTransitionAnimation: const ScreenTransitionAnimation(
            animateTabTransition: true,
            curve: Curves.linear,
            duration: Duration(milliseconds: 200),
          ),
          navBarStyle: NavBarStyle.style9,
        ));
  }
}
