import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:leach/core/resource_manager/asset_path.dart';
import 'package:leach/core/resource_manager/colors.dart';
import 'package:leach/core/resource_manager/enums.dart';
import 'package:leach/core/resource_manager/routes.dart';
import 'package:leach/core/resource_manager/string_manager.dart';
import 'package:leach/core/utils/app_size.dart';
import 'package:leach/core/utils/methods.dart';
import 'package:leach/core/widgets/cutom_text.dart';
import 'package:leach/core/widgets/large_botton.dart';
import 'package:leach/core/widgets/leading_icon.dart';
import 'package:leach/features/auth/presentation/widgets/leading_with_icon.dart';

class SelectHowTo extends StatelessWidget {
  const SelectHowTo({super.key});

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
                image: AssetPath.howToIcon,
              ),
              CustomText(
                text: StringManager.howTo.tr(),
                fontSize: AppSize.defaultSize! * 4,
                fontWeight: FontWeight.w700,
              ),
              Center(
                child: Column(
                  children: [
                    LargeButton(
                      text: StringManager.groomYourPet,
                      onPressed: (){
                        Navigator.pushNamed(context, Routes.typeOfPetScreen,arguments: TypeOfPetNavigator.groomingScreen);
                      },
                      child: Image.asset(
                        AssetPath.groom,
                        color: AppColors.primaryColor,

                      ),
                    ),
                    SizedBox(
                      height: AppSize.defaultSize! * 2,
                    ),
                    LargeButton(
                      onPressed: (){
                        Navigator.pushNamed(context, Routes.typeOfPetScreen,arguments: TypeOfPetNavigator.trainingScreen);
                      },
                      text: StringManager.trainYourPet,
                      child: Image.asset(
                        AssetPath.handPaw,
                        color: AppColors.primaryColor,
                      ),
                    ),

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
