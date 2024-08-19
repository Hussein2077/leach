import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:leach/core/resource_manager/asset_path.dart';
import 'package:leach/core/resource_manager/colors.dart';
import 'package:leach/core/resource_manager/string_manager.dart';
import 'package:leach/core/utils/app_size.dart';
import 'package:leach/core/widgets/column_with_text_field.dart';
import 'package:leach/core/widgets/custom_text_field.dart';
import 'package:leach/core/widgets/cutom_text.dart';
import 'package:leach/core/widgets/large_botton.dart';
import 'package:leach/core/widgets/leading_icon.dart';
import 'package:leach/core/widgets/main_button.dart';
import 'package:leach/features/auth/presentation/widgets/country_drop_down.dart';
import 'package:leach/features/auth/presentation/widgets/leading_with_icon.dart';


import '../widget/circular_checkbox.dart';

class CatBreed3 extends StatefulWidget {
  const CatBreed3({super.key});

  @override
  State<CatBreed3> createState() => _CatBreed3State();
}

class _CatBreed3State extends State<CatBreed3> {
  String? selectedTemperament;

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
            const LeadingWithIcon(
              image: AssetPath.catIcon,
              color: AppColors.primaryColor,
            ),
            CustomText(
              text: StringManager.catBreed.tr(),
              fontWeight: FontWeight.w700,
              fontSize: AppSize.defaultSize! * 4,
            ),
            CustomText(
              text: StringManager.selectTemperaments.tr(),
              fontSize: AppSize.defaultSize! * 1.5,
              color: AppColors.greyColor,
            ),
            SizedBox(height: AppSize.defaultSize! * 3),
            CustomText(
              text: StringManager.petTemperaments.tr(),
              fontSize: AppSize.defaultSize! * 2,
            ),
            SizedBox(height: AppSize.defaultSize! * 1),
            Column(
              children: [
                buildTemperamentCheckbox(StringManager.friendly.tr()),
                SizedBox(height: AppSize.defaultSize! * 2),
                buildTemperamentCheckbox(StringManager.calm.tr()),
                SizedBox(height: AppSize.defaultSize! * 2),
                buildTemperamentCheckbox(StringManager.playful.tr()),
                SizedBox(height: AppSize.defaultSize! * 2),
                buildTemperamentCheckbox(StringManager.aggressive.tr()),
              ],
            ),
            SizedBox(height: AppSize.defaultSize! * 3),
            const Spacer(),
            Center(
              child: MainButton(
                text: StringManager.save.tr(),
                onTap: () {
                  // Handle saving logic here
                },
                textColor: Colors.white,
              ),
            ),
            SizedBox(height: AppSize.defaultSize! * 2.5),
          ],
        ),
      ),
    );
  }

  Widget buildTemperamentCheckbox(String text) {
    return CircularCheckbox(
      onChanged: (isChecked) {
        setState(() {
          if (isChecked == true) {
            selectedTemperament = text;
          } else if (selectedTemperament == text) {
            selectedTemperament = null;
          }
        });
      },
      initialValue: selectedTemperament == text,
      text: text,
      selectedColor: AppColors.primaryColor, // Pass the blue color when selected
    );
  }
}
