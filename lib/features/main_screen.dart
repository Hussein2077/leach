import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:leach/core/resource_manager/asset_path.dart';
import 'package:leach/core/resource_manager/colors.dart';
import 'package:leach/core/resource_manager/string_manager.dart';
import 'package:leach/core/utils/app_size.dart';

import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({
    super.key,
    required this.userID,
  });

  static int mainIndex = 0;
  final String userID;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late PersistentTabController _controller;

  List<Widget> _buildScreens() {
    return [

    ];
  }

  // List<PersistentBottomNavBarItem> _navBarsItems() {
  //   return [
  //     PersistentBottomNavBarItem(
  //       icon:Image.asset(AssetPath.home,
  //         width: AppSize.defaultSize! * 2,
  //         height: AppSize.defaultSize! * 2,
  //         color: AppColors.secondaryColor,
  //       ),
  //       inactiveIcon: Image.asset(
  //         AssetPath.home,
  //         width: AppSize.defaultSize! * 2.1,
  //         height: AppSize.defaultSize! * 2.1,
  //         color: Colors.white,
  //       ),
  //
  //       title: StringManager.home.tr(),
  //       textStyle: TextStyle(fontSize: AppSize.defaultSize! * 1.2),
  //       activeColorPrimary: AppColors.secondaryColor,
  //       inactiveColorPrimary: CupertinoColors.white,
  //     ),
  //     PersistentBottomNavBarItem(
  //       icon: Image.asset(
  //         AssetPath.application,
  //         width: AppSize.defaultSize! * 2,
  //         height: AppSize.defaultSize! * 2,
  //       ),
  //       title: StringManager.applications.tr(),
  //       inactiveIcon: Image.asset(
  //         AssetPath.application,
  //         width: AppSize.defaultSize! * 2,
  //         height: AppSize.defaultSize! * 2,
  //         color: Colors.white,
  //       ),
  //       textStyle: TextStyle(fontSize: AppSize.defaultSize! * 1.2),
  //       activeColorPrimary: AppColors.secondaryColor,
  //       inactiveColorPrimary: CupertinoColors.white,
  //     ),
  //     PersistentBottomNavBarItem(
  //       icon:Image.asset(AssetPath.company,
  //         width: AppSize.defaultSize! * 2,
  //         height: AppSize.defaultSize! * 2,
  //         color: AppColors.secondaryColor,
  //   ),
  //       inactiveIcon: Image.asset(
  //         AssetPath.company,
  //         width: AppSize.defaultSize! * 2,
  //         height: AppSize.defaultSize! * 2,
  //         color: Colors.white,
  //       ),
  //
  //       title: StringManager.companies.tr(),
  //       activeColorPrimary: AppColors.secondaryColor,
  //       inactiveColorPrimary: CupertinoColors.white,
  //       textStyle: TextStyle(fontSize: AppSize.defaultSize! * 1.2),
  //     ),
  //     PersistentBottomNavBarItem(
  //       icon:Image.asset(AssetPath.profile,
  //         width: AppSize.defaultSize! * 2,
  //         height: AppSize.defaultSize! * 2,
  //         color: AppColors.secondaryColor,
  //       ),
  //       inactiveIcon: Image.asset(
  //         AssetPath.profile,
  //         width: AppSize.defaultSize! * 2,
  //         height: AppSize.defaultSize! * 2,
  //         color: Colors.white,
  //       ),
  //       title: StringManager.profile.tr(),
  //       textStyle: TextStyle(fontSize: AppSize.defaultSize! * 1.2),
  //       activeColorPrimary: AppColors.secondaryColor,
  //       inactiveColorPrimary: CupertinoColors.white,
  //     ),
  //   ];
  // }

  @override
  void initState() {

    _controller = PersistentTabController(initialIndex: MainScreen.mainIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppSize().init(context);
    return Scaffold(
      // drawerScrimColor: AppColors.greyColor,
      body: PersistentTabView(
        context,
        navBarHeight: AppSize.defaultSize! * 5.5,
        controller: _controller,
        screens: _buildScreens(),
        // items: _navBarsItems(),


        // backgroundColor: AppColors.homeColor,

        handleAndroidBackButtonPress: true,

        resizeToAvoidBottomInset: true,
        stateManagement: true,
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(AppSize.defaultSize!),
          // colorBehindNavBar: AppColors.homeColor,
        ),

        navBarStyle:
            NavBarStyle.style1,  ),
    );
  }
}
