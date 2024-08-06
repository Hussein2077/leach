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



class SideBar extends StatelessWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(248,255,250,1),
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
          SideBarRow(image:AssetPath.editProfileIcon,text: StringManager.editProfile.tr(),onTap: () {
            Navigator.pushNamed(context, Routes.myPetProfile);
          },),
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
          SideBarRow(image:AssetPath.resetPasswordIcon,text: StringManager.resetPassword.tr(),onTap: () {
            Navigator.pushNamed(context, Routes.resetPasswordFromProfile);
          },),
          SizedBox(
            height: AppSize.defaultSize! * 0.7,
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
          SideBarRow(image:AssetPath.profilePrivacy,text: StringManager.accountPrivacy.tr(),onTap: () {
            Navigator.pushNamed(context, Routes.accountPrivacy);
          },),
          SizedBox(
            height: AppSize.defaultSize! * 0.7,
          ),
          Divider(
            color: Colors.black, //color of divider
            height: 5, //height spacing of divider
            thickness: 0.6, //thickness of divier line
            indent: AppSize.defaultSize! * 2.2, //spacing at the start of divider
            endIndent: AppSize.defaultSize! * 2.8, //spacing at the end of divider
          ) ,



          SizedBox(
            height: AppSize.defaultSize! * 3,
          ),
          SideBarRow(image:AssetPath.bellPlus,text: StringManager.subscriptionPlan.tr(),onTap: () {

          },),
          SizedBox(
            height: AppSize.defaultSize! * 0.7,
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
          SideBarRow(image:AssetPath.message,text: StringManager.activity.tr(),onTap: () {
            Navigator.pushNamed(context, Routes.activityAndHistory);
          }),
          SizedBox(
            height: AppSize.defaultSize! * 0.7,
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
          SideBarRow(image:AssetPath.bell,text: StringManager.notificationSettings.tr(),onTap: () {

          },),
          SizedBox(
            height: AppSize.defaultSize! * 0.7,
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
          SideBarRow(image:AssetPath.signOut,text: StringManager.signOut.tr(),onTap: () {

          },),
          SizedBox(
            height: AppSize.defaultSize! * 0.7,
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
          SideBarRow(image:AssetPath.x,text: StringManager.deleteAccount.tr(),onTap: () {
            Navigator.pushNamed(context, Routes.deleteAccount);
          }),
          SizedBox(
            height: AppSize.defaultSize! * 0.7,
          ),
          Divider(
            color: Colors.black, //color of divider
            height: 5, //height spacing of divider
            thickness: 0.6, //thickness of divier line
            indent: AppSize.defaultSize! * 2.2, //spacing at the start of divider
            endIndent: AppSize.defaultSize! * 2.8, //spacing at the end of divider
          ),


         ],
        ),
      ),
    );
    return const Placeholder();

  }
}
