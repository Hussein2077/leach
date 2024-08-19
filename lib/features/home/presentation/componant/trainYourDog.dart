import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:leach/core/resource_manager/asset_path.dart';
import 'package:leach/core/resource_manager/colors.dart';
import 'package:leach/core/resource_manager/routes.dart';
import 'package:leach/core/resource_manager/string_manager.dart';
import 'package:leach/core/utils/app_size.dart';
import 'package:leach/core/utils/methods.dart';
import 'package:leach/core/widgets/cutom_text.dart';
import 'package:leach/core/widgets/large_botton.dart';
import 'package:leach/core/widgets/leading_icon.dart';
import 'package:leach/core/widgets/main_button.dart';
import 'package:leach/features/auth/presentation/widgets/leading_with_icon.dart';

class TrainYourDog extends StatelessWidget {
  const TrainYourDog({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: Methods.instance.paddingCustom,
        child: SingleChildScrollView(
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const LeadingWithIcon(
                image: AssetPath.handIcon,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(

                    AssetPath.dogSmall,
                    color: AppColors.primaryColor,

                  ),
                  SizedBox(width: AppSize.defaultSize!*2,),
                  CustomText(
                    text: StringManager.trainYourDog.tr(),
                    fontSize: AppSize.defaultSize! * 4,
                    fontWeight: FontWeight.w700,
                  ),
                ],
              ),
              Center(
                child: Column(
                  children: [
                   MainButton(text: 'Clicker Training', onTap: (){
                     Navigator.pushNamed(context, Routes.howTo);
                   },color: Color.fromRGBO(246, 255, 255, 1),),
                    SizedBox(
                      height: AppSize.defaultSize! * 2,
                    ),
                    MainButton(text: 'Crate Training', onTap: (){
                      Navigator.pushNamed(context, Routes.howTo);
                    },color: Color.fromRGBO(246, 255, 255, 1),),
                    SizedBox(
                      height: AppSize.defaultSize! * 2,
                    ),
                    MainButton(text: 'Potty Training', onTap: (){
                      Navigator.pushNamed(context, Routes.howTo);
                    },color: Color.fromRGBO(246, 255, 255, 1),),



                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
