import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:leach/core/resource_manager/asset_path.dart';
import 'package:leach/core/resource_manager/colors.dart';
import 'package:leach/core/resource_manager/routes.dart';
import 'package:leach/core/resource_manager/string_manager.dart';
import 'package:leach/core/utils/app_size.dart';
import 'package:leach/core/widgets/background.dart';
import 'package:leach/core/widgets/cutom_text.dart';
import 'package:leach/core/widgets/icon_with_matrial.dart';
import 'package:leach/core/widgets/large_botton.dart';
import 'package:leach/core/widgets/leading_icon.dart';
import 'package:leach/features/profile/presentation/widget/medals_abd_freinds.dart';
import 'package:leach/features/profile/presentation/widget/profile_app_bar.dart';
import 'package:leach/features/profile/presentation/widget/profile_user_row.dart';
import 'package:leach/features/profile/presentation/widget/side_bar_row.dart';

import 'widgets/posts_container.dart';

class MyPetProfile extends StatelessWidget {
  const MyPetProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundScreen(
          image: AssetPath.homeBackground3,
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(

                padding: EdgeInsets.only(
                  left: AppSize.defaultSize! * 2,
                  right: AppSize.defaultSize! * 2,
                  top: AppSize.defaultSize! * 6,
                ),
                child:   LeadingIcon(
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: AppSize.defaultSize! * 3,
              ),
              Spacer(flex: 3,),

              InkWell(
                onTap: (){
                  // lesa
                  Navigator.pushNamed(context, Routes.editProfile);
                },
                child: Padding(
                  padding:  EdgeInsets.only(left:AppSize.defaultSize! * 2),
                  child: Align(alignment: Alignment.center,child: Image.asset(AssetPath.profileIcon)),
                ),
              ),

              Align(
                alignment: Alignment.center,
                child: CustomText(

                  text: StringManager.myProfile.tr(),
                  fontSize: AppSize.defaultSize! * 4,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height:AppSize.defaultSize! * 2),
              InkWell(
                onTap: (){
                  // lesa
                  Navigator.pushNamed(context, Routes.editPetProfile);

                },
                child: Padding(
                  padding:  EdgeInsets.only(left: AppSize.defaultSize! * 2),
                  child: Align(alignment:Alignment.center,child: Image.asset(AssetPath.petPawIcon)),
                ),
              ),

              Align(
                alignment: Alignment.center,
                child: CustomText(

                  text: StringManager.petProfile.tr(),
                  fontSize: AppSize.defaultSize! * 4,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Spacer(flex: 8,),


            ],
          )
      ),
    );
  }
}
