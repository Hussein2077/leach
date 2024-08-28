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

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    AppSize().init(context);
    return Scaffold(
      body: BackgroundScreen(
        image: AssetPath.vistaMP4,
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
                        '''Leash makes it easy to create fun pet profiles and keep all their info in one place. Looking to adopt? Leash connects you with pets in need of a home, making adoption a breeze. It’s the perfect app for pet lovers!''',
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
                  Center(child: Image.asset(AssetPath.page2)),
                const Spacer(),
                  MainButton(
                    text: 'Continue',
                    onTap: () {
                      Navigator.pushNamed(context, Routes.page3);
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
