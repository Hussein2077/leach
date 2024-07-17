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

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    AppSize().init(context);
    return Scaffold(
      body: BackgroundScreen(
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
                    height: AppSize.defaultSize! * 10,
                  ),
                  Image.asset(AssetPath.logoWhite),
                  SizedBox(
                    height: AppSize.defaultSize!,
                  ),
                  CustomText(
                    text: StringManager.petJourney.tr(),
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: AppSize.defaultSize! * 2.5,
                    maxLines: 2,
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(
                    height: AppSize.defaultSize! * 4,
                  ),
                  Center(
                    child: CustomText(
                      text: StringManager.terms.tr(),
                      color: Colors.white,
                      fontSize: AppSize.defaultSize! * .9,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: AppSize.defaultSize!  *.5 ,
                  ),
                  MainButton(
                    text: StringManager.login.tr(),
                    onTap: () {
                      Navigator.pushNamed(context, Routes.login);
                    },
                    color: Colors.white,
                  ) , SizedBox(
                    height: AppSize.defaultSize! *2,
                  ),
                  MainButton(
                    text: StringManager.register.tr(),
                    onTap: () {},
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
