import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:leach/core/resource_manager/asset_path.dart';
import 'package:leach/core/resource_manager/colors.dart';
import 'package:leach/core/resource_manager/routes.dart';
import 'package:leach/core/resource_manager/string_manager.dart';
import 'package:leach/core/utils/app_size.dart';
import 'package:leach/core/widgets/background.dart';
import 'package:leach/core/widgets/cutom_text.dart';
import 'package:leach/core/widgets/main_button.dart';

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    AppSize().init(context);
    return Scaffold(
      body: BackgroundScreen(
        image: AssetPath.maya1MP4,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: AppSize.screenHeight! * .57,
            width: AppSize.screenWidth!,
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(AppSize.defaultSize! * 2.5),
                topRight: Radius.circular(AppSize.defaultSize! * 2.5),
              ),
            ),
            child: Padding(
              padding:
              EdgeInsets.symmetric(horizontal: AppSize.defaultSize! * 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: AppSize.defaultSize! * 1,
                  ),
                  Image.asset(AssetPath.logoWhite),
                  SizedBox(
                    height: AppSize.defaultSize!,
                  ),
                  CustomText(
                    text:
                    '''Leash makes pet breeding easy and fun! Connect with other pet owners, track histories, and ensure healthy practices—all in one place. It’s the go-to app for responsible and joyful pet breeding!''',
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: AppSize.defaultSize! * 1.5,
                    maxLines: 7,
                    fontFamily: 'Gully',
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(
                    height: AppSize.defaultSize! * 2,
                  ),
                  Center(child: Image.asset(AssetPath.page3)),
                 const Spacer(),
                  MainButton(
                    text: 'Continue',
                    onTap: () {
                      Navigator.pushNamed(context, Routes.page4);
                    },
                    color: Colors.white,
                  ),
                  SizedBox(
                    height: AppSize.defaultSize! * 6,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
