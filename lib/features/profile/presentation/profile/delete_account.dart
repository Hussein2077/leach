import 'dart:ui';
import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:leach/core/resource_manager/asset_path.dart';
import 'package:leach/core/resource_manager/colors.dart';
import 'package:leach/core/resource_manager/routes.dart';
import 'package:leach/core/resource_manager/string_manager.dart';
import 'package:leach/core/utils/app_size.dart';
import 'package:leach/core/widgets/cutom_text.dart';
import 'package:leach/core/widgets/icon_with_matrial.dart';
import 'package:leach/core/widgets/large_botton.dart';
import 'package:leach/core/widgets/leading_icon.dart';
import 'package:leach/features/profile/presentation/widget/medals_abd_freinds.dart';
import 'package:leach/features/profile/presentation/widget/profile_app_bar.dart';
import 'package:leach/features/profile/presentation/widget/profile_user_row.dart';
import 'package:leach/features/profile/presentation/widget/side_bar_row.dart';



class DeleteAccount extends StatelessWidget {
  const DeleteAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Padding(

              padding: EdgeInsets.only(
                left: AppSize.defaultSize! * 2,
                right: AppSize.defaultSize! * 2,
                top: AppSize.defaultSize! * 6,
              ),
              child: LeadingIcon(),
            ),
            SizedBox(
              height: AppSize.defaultSize! * 3,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(  left: AppSize.defaultSize! * 2.2,),
                  child: Image.asset(AssetPath.x,),
                ),
                SizedBox(width: AppSize.defaultSize! * 1.2,),
                CustomText(
                  text: StringManager.deleteAccount.tr(),
                  fontSize: AppSize.defaultSize! * 2,

                  maxLines: 1,
                  
                  textAlign: TextAlign.start,
                ),
                Spacer(),
              ],
            ),
            SizedBox(
              height: AppSize.defaultSize! * 0.4,
            ),
            Divider(
              color: Colors.black, //color of divider
              height: 5, //height spacing of divider
              thickness: 0.6, //thickness of divier line
              indent: AppSize.defaultSize! * 2.2, //spacing at the start of divider
              endIndent: AppSize.defaultSize! * 2.8, //spacing at the end of divider
            ),


            SizedBox(
              height: AppSize.defaultSize! * 3,
            ),
            

         Stack(
           children: [
             Image.asset(AssetPath.blueContainer,

             )
           ],


         )



          ],
        ),
      ),
    );
    return const Placeholder();

  }
}
