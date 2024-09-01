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

class Page5 extends StatelessWidget {
  const Page5({super.key});

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
                  const Spacer(),
                  MainButton(
                    text: 'Now lets get started!',
                    onTap: () {
                      Methods.instance.saveFirstOpen(false);
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
