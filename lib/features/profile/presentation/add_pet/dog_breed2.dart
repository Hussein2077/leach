import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:leach/core/resource_manager/asset_path.dart';
import 'package:leach/core/resource_manager/colors.dart';
import 'package:leach/core/resource_manager/routes.dart';
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
import 'package:leach/features/profile/presentation/widget/male_or_female.dart';
import 'package:leach/features/profile/presentation/widget/size_row.dart';
import '../widget/circular_checkbox.dart';

class DogBreed2 extends StatefulWidget {
  const DogBreed2({super.key});

  @override
  State<DogBreed2> createState() => _DogBreed2State();
}

class _DogBreed2State extends State<DogBreed2> {
  final Map<String, bool> _breedingStates = {
    'Yes': false,
    'No': false,
  };

  final Map<String, bool> _adoptionStates = {
    'Yes': false,
    'No': false,
  };

  final Map<String, bool> _playDatesStates = {
    'Yes': false,
    'No': false,
  };

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
              image: AssetPath.dogIcon,
              color: AppColors.primaryColor,
            ),
            CustomText(
              text: StringManager.dogBreed.tr(),
              fontWeight: FontWeight.w700,
              fontSize: AppSize.defaultSize! * 4,
            ),
            CustomText(
              text: StringManager.selectYesOrNO.tr(),
              fontSize: AppSize.defaultSize! * 1.5,
              color: AppColors.greyColor,
            ),
            SizedBox(height: AppSize.defaultSize! * 3),
            CustomText(
              text: StringManager.availableForBreeding.tr(),
              fontSize: AppSize.defaultSize! * 2,
            ),
            SizedBox(height: AppSize.defaultSize! * 1),
            Row(

              children: [
                buildTemperamentCheckbox('Breeding', 'Yes'),
                SizedBox(width: AppSize.defaultSize! * 13),
                buildTemperamentCheckbox('Breeding', 'No'),
              ],
            ),
            SizedBox(height: AppSize.defaultSize! * 3),
            CustomText(
              text: StringManager.availableForAdoption.tr(),
              fontSize: AppSize.defaultSize! * 2,
            ),
            SizedBox(height: AppSize.defaultSize! * 1),
            Row(
              children: [
                buildTemperamentCheckbox('Adoption', 'Yes'),
                SizedBox(width: AppSize.defaultSize! * 13),
                buildTemperamentCheckbox('Adoption', 'No'),
              ],
            ),
            SizedBox(height: AppSize.defaultSize! * 0.5),
            SizedBox(height: AppSize.defaultSize! * 3),
            CustomText(
              text: StringManager.availableForPlayDates.tr(),
              fontSize: AppSize.defaultSize! * 2,
            ),
            SizedBox(height: AppSize.defaultSize! * 1),
            Row(
              children: [
                buildTemperamentCheckbox('PlayDates', 'Yes'),
                SizedBox(width: AppSize.defaultSize! * 13),
                buildTemperamentCheckbox('PlayDates', 'No'),
              ],
            ),
            Spacer(),
            Center(
              child: MainButton(
                text: StringManager.next.tr(),
                onTap: () {
                  Navigator.pushNamed(context, Routes.dogBreed3);
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

  Widget buildTemperamentCheckbox(String category, String value) {
    final statesMap = {
      'Breeding': _breedingStates,
      'Adoption': _adoptionStates,
      'PlayDates': _playDatesStates,
    };

    return CircularCheckbox(
      onChanged: (isChecked) {
        setState(() {
          final categoryStates = statesMap[category];
          if (categoryStates != null) {
            categoryStates.forEach((key, _) {
              categoryStates[key] = key == value ? isChecked ?? false : false;
            });
          }
        });
      },
      initialValue: statesMap[category]?[value] ?? false,
      text: value,
    );
  }
}
