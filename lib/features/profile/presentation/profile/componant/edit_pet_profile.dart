import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:leach/core/resource_manager/asset_path.dart';
import 'package:leach/core/resource_manager/colors.dart';
import 'package:leach/core/resource_manager/string_manager.dart';
import 'package:leach/core/utils/app_size.dart';
import 'package:leach/core/widgets/check_box.dart';
import 'package:leach/core/widgets/column_with_text_field.dart';
import 'package:leach/core/widgets/custom_text_field.dart';
import 'package:leach/core/widgets/cutom_text.dart';
import 'package:leach/core/widgets/main_button.dart';
import 'package:leach/features/auth/presentation/widgets/leading_with_icon.dart';
import 'package:leach/features/profile/presentation/widget/size_row.dart';

class EditPetProfile extends StatelessWidget {
  const EditPetProfile({super.key});

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

                SizedBox(height: AppSize.defaultSize! * 2,width: AppSize.defaultSize! * 2,),

                LeadingWithIcon(image: AssetPath.petPawIcon,)
                ,
                Padding(
                  padding:  EdgeInsets.only(right: AppSize.defaultSize! * 2.5,),
                  child: Center(
                    child: InkWell(
                      child: CustomText(
                        text: StringManager.changePicture.tr(),
                        fontSize: AppSize.defaultSize! * 2,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: AppSize.defaultSize! * 2,),
                CustomText(
                  text:
                  StringManager.enterInformation.tr(),
                  fontSize: AppSize.defaultSize!   * 1.5,
                  color: Color.fromRGBO(112, 112, 112, 1),

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
                  height: AppSize.defaultSize! * 2,
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

                MainButton(text: StringManager.save. tr(),
                  onTap: (){

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
