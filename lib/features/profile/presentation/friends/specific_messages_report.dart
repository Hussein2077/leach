import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:leach/core/resource_manager/routes.dart';
import 'package:leach/core/resource_manager/string_manager.dart';
import 'package:leach/core/utils/app_size.dart';
import 'package:leach/core/widgets/cutom_text.dart';
import 'package:leach/core/widgets/leading_icon.dart';
import 'package:leach/features/profile/presentation/side%20bar/side_bar_row.dart';



class SpecificMessagesReport extends StatelessWidget {
  const SpecificMessagesReport({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(248,255,250,1),
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
      SizedBox(width: AppSize.defaultSize! * 1.2,),

      Padding(
        padding: EdgeInsets.only(  left: AppSize.defaultSize! * 3.2,),
        child: CustomText(
          text: StringManager.selectaProblemToReport.tr(),
          fontSize: AppSize.defaultSize! * 2,

          maxLines: 1,
          textAlign: TextAlign.start,
        ),
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
            SideBarRow(text: StringManager.nudityOrSexualActivity.tr(),onTap: () {
              Navigator.pushNamed(context, Routes.submitReport);
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
            SideBarRow(text: StringManager.hateSpeechOrSymbols.tr(),onTap: () {
              Navigator.pushNamed(context, Routes.submitReport);

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
            SideBarRow(text: StringManager.scamOrFraud.tr(),onTap: () {
              Navigator.pushNamed(context, Routes.submitReport);
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
            SideBarRow(text: StringManager.bullyingOrHarassment.tr(),onTap: () {
              Navigator.pushNamed(context, Routes.submitReport);

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
            SideBarRow(text: StringManager.spam.tr(),onTap: () {
              Navigator.pushNamed(context, Routes.submitReport);
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
          ],
        ),
      ),
    );
    return const Placeholder();

  }
}
