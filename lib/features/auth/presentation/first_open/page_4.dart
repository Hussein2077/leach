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

class Page4 extends StatelessWidget {
  const Page4({super.key});

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
                        'Leash makes setting up pet playdates a breeze! Connect with local pet owners, schedule playdates, and let your pets socialize and have fun together. It’s a great way to keep your furry friends happy and active while making new pals!',
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
                  Center(child: Image.asset(AssetPath.page4)),
                  const Spacer(),
                  MainButton(
                    text: 'Continue',
                    onTap: () {
                      Navigator.pushNamed(context, Routes.page5);
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
