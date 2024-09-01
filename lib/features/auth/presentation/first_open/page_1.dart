import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:leach/core/resource_manager/asset_path.dart';
import 'package:leach/core/resource_manager/colors.dart';
import 'package:leach/core/resource_manager/routes.dart';
import 'package:leach/core/resource_manager/string_manager.dart';
import 'package:leach/core/utils/app_size.dart';
import 'package:leach/core/utils/methods.dart';
import 'package:leach/core/widgets/background.dart';
import 'package:leach/core/widgets/cutom_text.dart';
import 'package:leach/core/widgets/main_button.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    AppSize().init(context);
    return Scaffold(
      body: BackgroundScreen(
        image: AssetPath.mayaMP4,
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
                        '''Leash is a comprehensive pet care app designed to simplify the lives of pet owners by offering a wide range of services tailored to meet all pet-related needs. With its user-friendly interface, Leash ensures that pet owners can easily manage various aspects of their pets’ health and well-being.
                    ''',
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: AppSize.defaultSize! * 1.5,
                    maxLines: 7,
                    fontFamily: 'Gully',
                    textAlign: TextAlign.start,
                  ),
                  const Spacer(),
                  MainButton(
                    text: 'Get Started',
                    onTap: () {
                      Navigator.pushNamed(context, Routes.page2);
                    },
                    color: Colors.white,
                  ),
                  SizedBox(
                    height: AppSize.defaultSize! * 2,
                  ),
                  MainButton(
                    text: 'Skip',
                    onTap: () {
                      // Methods.instance.saveFirstOpen(false);
                      Navigator.pushNamed(context, Routes.welcomePage);
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
