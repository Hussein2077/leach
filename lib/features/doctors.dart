
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:leach/core/resource_manager/asset_path.dart';
import 'package:leach/core/resource_manager/colors.dart';
import 'package:leach/core/resource_manager/string_manager.dart';
import 'package:leach/core/utils/app_size.dart';
import 'package:leach/core/widgets/cutom_text.dart';
import 'package:leach/features/auth/presentation/widgets/leading_with_icon.dart';

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
              LeadingWithIcon(),
              CustomText(
                text: StringManager.availableSpecialists.tr(),
                fontSize: AppSize.defaultSize! * 4,
                fontWeight: FontWeight.w700,
                maxLines: 2,textAlign: TextAlign.start,
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                elevation: 10,
                color: Colors.white,
                shadowColor: Colors.black,
                child: Container(
                  width:  AppSize.screenWidth! * .9,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Image.asset(AssetPath.doctor),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: "Dr. Ali Korkor",
                                fontSize: AppSize.defaultSize! *3,
                                fontWeight: FontWeight.w700,
                                maxLines: 2,textAlign: TextAlign.start,
                              ),
                              CustomText(
                                text: StringManager.microchip.tr(),
                                fontSize: AppSize.defaultSize! * 2,
                                fontWeight: FontWeight.w700,
                                maxLines: 2,textAlign: TextAlign.start,
                              ),
                              Material(
                                elevation: 10,
                                borderRadius:BorderRadius.circular(20.0),

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
                          Row(

                         children: [
                           Material(
                             elevation: 10,
borderRadius: BorderRadius.circular(20),

color: Colors.white,

                             child: Padding(
                               padding: const EdgeInsets.all(8.0),
                               child: Image.asset(AssetPath.doctor2),
                             ),

                                                 ),
                           CustomText(
                             text: StringManager.microchip.tr(),
                             fontSize: AppSize.defaultSize! * 2,
                             fontWeight: FontWeight.w700,
                             maxLines: 2,textAlign: TextAlign.start,
                           ),

                         ],
                          ),


                        ],


                      ),




                    ],

                  ),

                ),


              ),
            ],

          ),
        ),
      ),
    );
  }
}
