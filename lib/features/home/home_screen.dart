import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leach/core/resource_manager/asset_path.dart';
import 'package:leach/core/resource_manager/enums.dart';
import 'package:leach/core/resource_manager/routes.dart';
import 'package:leach/core/resource_manager/string_manager.dart';
import 'package:leach/core/utils/app_size.dart';
import 'package:leach/core/widgets/background.dart';
import 'package:leach/core/widgets/cutom_text.dart';
import 'package:leach/core/widgets/large_botton.dart';
import 'package:leach/features/main_screen_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<Function()> onPressed;

  @override
  void initState() {
    onPressed = [
      () {
        context.read<MainScreenBloc>().add(const ChangeTabEvent(0));
      },
      () {
        Navigator.pushNamed(context, Routes.typeOfPetScreen, arguments: TypeOfPetNavigator.breadingScreen);
      },
      () {
        Navigator.pushNamed(context, Routes.bookingScreen);
      },
      () {
        Navigator.pushNamed(context, Routes.selectHowTo);
      },
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundScreen(
        image: AssetPath.homeBackground2,
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: AppSize.defaultSize! * 5,
                      left: AppSize.defaultSize! * 3.6,
                      right: AppSize.defaultSize! * 3.6),
                  child: Row(
                    children: [
                      SizedBox(
                        width: AppSize.screenWidth! * .5,
                        child: CustomText(
                          text: '${StringManager.welcome}, Hussein',
                          fontWeight: FontWeight.w700,
                          maxLines: 2,
                          textAlign: TextAlign.start,
                          fontSize: AppSize.defaultSize! * 3.8,
                          color: Colors.white,
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.notifications,
                            size: AppSize.defaultSize! * 3.5,
                            color: Colors.white,
                          )),
                      IconButton(
                          onPressed: () {
                            Navigator.pushNamed(context, Routes.sidebar);
                          },
                          icon: Image.asset(
                            AssetPath.menu,
                            width: AppSize.defaultSize! * 3.5,
                            height: AppSize.defaultSize! * 3.5,
                          )),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: AppSize.screenHeight! * .6,
                    width: AppSize.screenWidth!,
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(AppSize.defaultSize! * 4),
                            topRight:
                                Radius.circular(AppSize.defaultSize! * 4))),
                    child: ListView.builder(
                        itemCount: StringManager.listOfPosts.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(
                              top: AppSize.defaultSize! * 3,
                              left: AppSize.defaultSize! * 7,
                              right: AppSize.defaultSize! * 7,
                            ),
                            child: LargeButton(
                              text: StringManager.listOfPosts[index].tr(),
                              child: null,
                              onPressed: onPressed[index],
                            ),
                          );
                        }),
                  ),
                )
              ],
            ),

          ],
        ),
      ),
    );
  }
}
