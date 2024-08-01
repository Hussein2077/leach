
import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:leach/core/resource_manager/asset_path.dart';
import 'package:leach/core/resource_manager/colors.dart';
import 'package:leach/core/resource_manager/routes.dart';
import 'package:leach/core/resource_manager/string_manager.dart';
import 'package:leach/core/utils/app_size.dart';
import 'package:leach/core/widgets/cutom_text.dart';
import 'package:leach/core/widgets/main_button.dart';
import 'package:leach/features/auth/presentation/widgets/leading_with_icon.dart';

import '../core/widgets/available_training_specialist_row.dart';

class Doctors extends StatelessWidget {
  const Doctors({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            left: AppSize.defaultSize! * 2,
            right: AppSize.defaultSize! * 2,
            top: AppSize.defaultSize! * 6,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const LeadingWithIcon(image: AssetPath.handIcon,),
              CustomText(
                text: StringManager.availableSpecialists.tr(),
                fontSize: AppSize.defaultSize! * 4,
                fontWeight: FontWeight.w700,
                maxLines: 2,textAlign: TextAlign.start,
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 3,
                itemBuilder: (context, index) => Padding(
                  padding:   EdgeInsets.symmetric(vertical: AppSize.defaultSize! * 1.5),

                  child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppSize.defaultSize! * 4),
                  ),
                  elevation: 10,
                  color: const Color.fromRGBO(246, 255, 255, 1),
                  shadowColor: Colors.black,
                  child: SizedBox(
                    width:  AppSize.screenWidth! * .9,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Image.asset(AssetPath.doctor,scale: 1.3,),
                            Column(

                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: AppSize.defaultSize!*3,),
                                  CustomText(
                                    text: "Dr. Ali Korkor",
                                    fontSize: AppSize.defaultSize! *3,
                                    fontWeight: FontWeight.w700,
                                    maxLines: 2,textAlign: TextAlign.start,
                                  ),
                                  CustomText(
                                    text: StringManager.microchip.tr(),
                                    fontSize: AppSize.defaultSize! * 2,

                                    maxLines: 2,textAlign: TextAlign.start,
                                  ),
                                  Material(
                                    elevation: 10,
                                    borderRadius:BorderRadius.circular(20.0),
                                    color:const Color.fromRGBO(246, 255, 255, 1),
                                    child: SizedBox(

                                      width:  AppSize.screenWidth! * .2,
                                      height:AppSize.defaultSize!* 2,
                                      child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          physics: const NeverScrollableScrollPhysics(),
                                          itemCount: 5,
                                          itemBuilder: (context,i){
                                            return   Icon(
                                              Icons.star,
                                              color: AppColors.primaryColor,
                                              size:AppSize.defaultSize!*1.6,

                                            );
                                          }),



                                    ),
                                  ),

                                ]

                            ),


                          ],
                        ),

                        Column(


                          children: [
                            SizedBox(height: AppSize.defaultSize!*3.3,),
                            TextImageRow(text: '${StringManager.veterinarian} in Microchip Implantation', image: AssetPath.doctor2,),
                            SizedBox(height: AppSize.defaultSize!*3.3,),
                            TextImageRow(text: '${StringManager.address}:El Sheikh Zayed,  Waslet Dahshour', image: AssetPath.address,),
                            SizedBox(height: AppSize.defaultSize!*3.3,),
                            TextImageRow(text: '${StringManager.fees}:600 EGP', image: AssetPath.fees,),
                            SizedBox(height: AppSize.defaultSize!*3.3,),
                            TextImageRow(text: '${StringManager.phone}:2234567', image: AssetPath.phone,),
                            SizedBox(height: AppSize.defaultSize!*3.3,),
                            // Center(
                            //   child: MainButton(
                            //     text: StringManager.book.tr(),
                            //     fontSize: AppSize.defaultSize! *2.5,
                            //
                            //     onTap: () {
                            //       Navigator.pushNamed(context, Routes.addPetScreen);
                            //     },
                            //     textColor: Colors.white,
                            //   ),
                            // ),
                            // SizedBox(height: AppSize.defaultSize!*1.4,),



                          ],


                        ),




                      ],

                    ),

                  ),


                                ),
                ),   shrinkWrap: true,),

            ],

          ),
        ),
      ),
    );
  }
}
