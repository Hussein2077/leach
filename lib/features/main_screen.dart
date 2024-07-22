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
        floatingActionButton: Container(
          width: AppSize.defaultSize! * 8,
          height:   AppSize.defaultSize! * 8,
          decoration:   BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.primaryColor,
          ),

          child: FloatingActionButton.extended(
              onPressed: () {
                setState(() {
                  selectedIndex = 0;
                });
              },
              backgroundColor: AppColors.primaryColor,
              shape: const CircleBorder(),
              label: const Icon(
                CupertinoIcons.house_fill,
                color: Colors.white,
              )),
        ),
        floatingActionButtonLocation:
        FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          //bottom navigation bar on scaffold
          color: const Color.fromRGBO(149, 225, 140, 0.6627450980392157),
          shape: const CircularNotchedRectangle(), //shape of notch
          notchMargin:
          10,
          child: SizedBox(
            height: 53,
            child: Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: InkWell(
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        setState(() {
                          selectedIndex = 0;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            CupertinoIcons.house_fill,

                          ),
                          Text(
                            "الرئيسية",
                            style: TextStyle( fontSize: 12),
                          ),
                        ],
                      ),
                    ),
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.sensors,

                            size: 25,
                          ),
                          Text(
                            "البث المباشر",

                          ),
                        ],
                      ),
                    ),
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.favorite,

                          ),
                          Text(
                            "المفضلة",

                          ),
                        ],
                      ),
                    ),
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.person,

                            size: 25,
                          ),
                          Text(
                            "الحساب",

                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: getScreen(),
      ),
    );
  }

  Widget getScreen() {
    if (selectedIndex == 0) {
      return SizedBox();
    } else if (selectedIndex == 1) {
      return SizedBox(
      );
    } else if (selectedIndex == 2) {
      return SizedBox();
    } else {
      return SizedBox();
    }
  }
}
