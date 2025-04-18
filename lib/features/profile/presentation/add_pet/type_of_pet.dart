import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:leach/core/resource_manager/asset_path.dart';
import 'package:leach/core/resource_manager/colors.dart';
import 'package:leach/core/resource_manager/enums.dart';
import 'package:leach/core/resource_manager/routes.dart';
import 'package:leach/core/resource_manager/string_manager.dart';
import 'package:leach/core/utils/app_size.dart';
import 'package:leach/core/widgets/cutom_text.dart';
import 'package:leach/core/widgets/large_botton.dart';
import 'package:leach/core/widgets/leading_icon.dart';
import 'package:leach/features/home/presentation/componant/trainYourDog.dart';

class TypeOfPetScreen extends StatelessWidget {
  const TypeOfPetScreen({super.key, required this.typeOfPetNavigator});

  final TypeOfPetNavigator typeOfPetNavigator;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          left: AppSize.defaultSize! * 2,
          right: AppSize.defaultSize! * 2,
          top: AppSize.defaultSize! * 6,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const LeadingIcon(
              color: AppColors.primaryColor,
            ),
            SizedBox(
              height: AppSize.defaultSize! * 10,
            ),
            Center(
              child: Column(
                children: [
                  CustomText(
                    text: StringManager.typeOfPet.tr(),
                    fontWeight: FontWeight.w700,
                    fontSize: AppSize.defaultSize! * 4,
                  ),
                  SizedBox(
                    height: AppSize.defaultSize! * 3,
                  ),
                  LargeButton(
                      text: StringManager.dog.tr(),
                      onPressed: () {
                        switch (typeOfPetNavigator) {
                          case TypeOfPetNavigator.dogBread:
                            Navigator.pushNamed(context, Routes.dogBread);
                          case TypeOfPetNavigator.breadingScreen:
                            Navigator.pushNamed(context, Routes.breedingScreen,
                                arguments: "DOG");
                          case TypeOfPetNavigator.groomingScreen:
                            Navigator.pushNamed(context, Routes.trainYourDog,
                                arguments: TrainParamRoute(
                                  petType: "DOG",
                                  category: "GROOM",
                                ));
                          case TypeOfPetNavigator.trainingScreen:
                            Navigator.pushNamed(context, Routes.trainYourDog,
                                arguments: TrainParamRoute(
                                  petType: "DOG",
                                  category: "TRAIN",
                                ));
                        }
                      },
                      child: Image.asset(AssetPath.dog)),
                  SizedBox(
                    height: AppSize.defaultSize! * 3,
                  ),
                  LargeButton(
                      text: StringManager.cat.tr(),
                      onPressed: () {
                        switch (typeOfPetNavigator) {
                          case TypeOfPetNavigator.dogBread:
                            Navigator.pushNamed(context, Routes.catBread);
                          case TypeOfPetNavigator.breadingScreen:
                            Navigator.pushNamed(context, Routes.breedingScreen,
                                arguments: "CAT");
                          case TypeOfPetNavigator.groomingScreen:
                            Navigator.pushNamed(context, Routes.trainYourDog,
                                arguments: TrainParamRoute(
                                  petType: "CAT",
                                  category: "GROOM",
                                ));
                          case TypeOfPetNavigator.trainingScreen:
                            Navigator.pushNamed(context, Routes.trainYourDog,
                                arguments: TrainParamRoute(
                                  petType: "CAT",
                                  category: "TRAIN",
                                ));
                        }
                      },
                      child: Image.asset(AssetPath.cat)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
