import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:leach/core/resource_manager/asset_path.dart';
import 'package:leach/core/resource_manager/colors.dart';
import 'package:leach/core/resource_manager/routes.dart';
import 'package:leach/core/resource_manager/string_manager.dart';
import 'package:leach/core/utils/app_size.dart';
import 'package:leach/core/widgets/check_box.dart';
import 'package:leach/core/widgets/column_with_text_field.dart';
import 'package:leach/core/widgets/custom_text_field.dart';
import 'package:leach/core/widgets/cutom_text.dart';
import 'package:leach/core/widgets/large_botton.dart';
import 'package:leach/core/widgets/leading_icon.dart';
import 'package:leach/core/widgets/main_button.dart';
import 'package:leach/features/auth/presentation/widgets/country_drop_down.dart';
import 'package:leach/features/auth/presentation/widgets/leading_with_icon.dart';
import 'package:leach/features/profile/presentation/widget/male_or_female.dart';
import 'package:leach/features/profile/presentation/widget/size_row.dart';

class DogBread extends StatelessWidget {
  const DogBread({super.key});

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
                const LeadingWithIcon(
                  image: AssetPath.dogIcon,
                  color: AppColors.primaryColor,
                ),
                CustomText(
                  text: StringManager.dogBreed.tr(),
                  fontWeight: FontWeight.w700,
                  fontSize: AppSize.defaultSize! * 4,
                ),
                CustomText(
                  text: StringManager.enterPersonalInformation.tr(),
                  fontSize: AppSize.defaultSize! * 1.5,
                  color: AppColors.greyColor,
                ),
                ColumnWithTextField(
                  text: StringManager.dogBreed.tr(),
                  child: CountryDropDown(
                    text: StringManager.selectYourDogsBreed.tr(),
                  ),
                ),
                SizedBox(
                  height: AppSize.defaultSize! * 3,
                ),
                Row(
                  children: [
                    CircularCheckbox(
                      text: StringManager.pureBred.tr(),
                    ),
                    CircularCheckbox(
                      text: StringManager.mixedBreed.tr(),
                    ),
                  ],
                ),
                SizedBox(
                  height: AppSize.defaultSize! * .5,
                ),
                ColumnWithTextField(
                  text: StringManager.secondBreed.tr(),
                  child: CountryDropDown(
                    text: StringManager.selectYourCatsSecondBreed.tr(),
                  ),
                ),
                SizedBox(
                  height: AppSize.defaultSize! * .5,
                ),
                ColumnWithTextField(
                  text: StringManager.typeAgeAndWeightOfDog.tr(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomTextField(
                        width: AppSize.screenWidth! * 0.42,
                        hintText: StringManager.age.tr(),
                      ),

                      CustomTextField(
                        width: AppSize.screenWidth! * 0.42,
                        hintText: StringManager.weightKg.tr(),
                      ),
                    ],
                  ),
                ),
                ColumnWithTextField(
                  text: StringManager.gender.tr(),
                  child:const MaleOrFemale(),
                ),
                ColumnWithTextField(
                  text: StringManager.size.tr(),
                  child:   const SizeRow(isDog: true,),
                ),
                ColumnWithTextField(
                  text: StringManager.breedingExperience.tr(),
                  child: Row(
                    children: [
                      CircularCheckbox(
                        text: StringManager.yes.tr(),
                      ),
                      CircularCheckbox(
                        text: StringManager.no.tr(),
                      ),
                    ],
                  ),
                ),SizedBox(
                  height: AppSize.defaultSize! * 2.5,
                ),
                InkWell(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: StringManager.addAPicture.tr(),
                        fontSize: AppSize.defaultSize! * 2,
                        color: AppColors.primaryColor,
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Image.asset(AssetPath.cameraIcon.toString()))
                    ],
                  ),
                ),  SizedBox(
                  height: AppSize.defaultSize! * 2.5,
                ),
                InkWell(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: StringManager.addPictureOfMedicalPassport.tr(),
                        fontSize: AppSize.defaultSize! * 2,
                        color: AppColors.primaryColor,
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Image.asset(AssetPath.cameraIcon.toString()))
                    ],
                  ),
                ),
                SizedBox(
                  height: AppSize.defaultSize! *2,
                ),
                MainButton(text: StringManager.next . tr(),
                  onTap: (){
                      Navigator.pushNamed(context,  Routes.dogBreed2);
                  },
                  textColor: Colors.white,
                ),
                SizedBox(
                  height: AppSize.defaultSize! * 2.5,
                ),
              ],
            ),
          ),
        ));
  }
}
