import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:leach/core/resource_manager/asset_path.dart';
import 'package:leach/core/resource_manager/colors.dart';
import 'package:leach/core/resource_manager/string_manager.dart';
import 'package:leach/core/utils/app_size.dart';
import 'package:leach/core/widgets/background.dart';
import 'package:leach/features/home/home_screen.dart';
import 'package:leach/features/posts/posts_screen.dart';

import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({
    super.key,
  });

  static int mainIndex = 0;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        floatingActionButton: Material(
          elevation: 0,
          shape: const CircleBorder(),
          color: AppColors.primaryColor,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(
              width: AppSize.defaultSize! * 8,
              height: AppSize.defaultSize! * 8,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primaryColor,
              ),
              child: FloatingActionButton.extended(
                  onPressed: () {
                    setState(() {
                      selectedIndex = 4;
                    });
                  },
                  elevation: 0,
                  focusElevation: 0,
                  backgroundColor: AppColors.primaryColor,
                  shape: const CircleBorder(),
                  disabledElevation: 0,
                  label: Image.asset(
                    AssetPath.home,
                    width: AppSize.defaultSize! * 6,
                    height: AppSize.defaultSize! * 6,
                  )),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          color: AppColors.primaryColor,
          shape: const CircularNotchedRectangle(), //shape of notch
          notchMargin: -15,
          child: SizedBox(
            height: AppSize.defaultSize! * 10,
            child: Padding(
              padding: EdgeInsets.only(bottom: AppSize.defaultSize! * 3),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: IconButton(
                        focusColor: AppColors.greyColor,
                        hoverColor: AppColors.greyColor,
                        padding: EdgeInsets.zero,
                        highlightColor: Colors.transparent,
                        onPressed: () {
                          setState(() {
                            selectedIndex = 0;
                          });
                        },
                        icon: Image.asset(
                          AssetPath.posts,
                          color: selectedIndex == 0
                              ? Colors.grey
                              : null,

                        )),
                  ),
                  Center(
                    child: InkWell(
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () {
                          setState(() {
                            selectedIndex = 1;
                          });
                        },
                        child: Image.asset(
                          AssetPath.chat,
                          width: AppSize.defaultSize! * 4,
                          height: AppSize.defaultSize! * 4,
                        )),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  Center(
                    child: InkWell(
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () {
                          setState(() {
                            selectedIndex = 2;
                          });
                        },
                        child: Image.asset(
                          AssetPath.petProfile,
                          width: AppSize.defaultSize! * 4,
                          height: AppSize.defaultSize! * 4,
                        )),
                  ),
                  Center(
                    child: InkWell(
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () {
                          setState(() {
                            selectedIndex = 3;
                          });
                        },
                        child: Image.asset(
                          AssetPath.profile,
                          width: AppSize.defaultSize! * 4,
                          height: AppSize.defaultSize! * 4,
                        )),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: BackgroundScreen(image: AssetPath.homeBackground,child: getScreen(),),
      ),
    );
  }

  Widget getScreen() {
    if (selectedIndex == 0) {
      return  const PostsScreen();
    } else if (selectedIndex == 1) {
      return Container(
        color: Colors.red,
      );
    } else if (selectedIndex == 2) {
      return Container(
        color: Colors.cyan,
      );
    } else if (selectedIndex == 3) {
      return BackgroundScreen(image: AssetPath.homeBackground,
        child: Container(
          // color: Colors.amber,
        ),
      );
    } else {
      return HomeScreen();
    }
  }
}
