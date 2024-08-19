import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:leach/core/resource_manager/asset_path.dart';
import 'package:leach/core/resource_manager/string_manager.dart';
import 'package:leach/core/utils/app_size.dart';
import 'package:leach/core/widgets/cutom_text.dart';
class AgeSizeRow extends StatelessWidget {
  final String age;
  final String weight;
  final String gender;
  final String size;
  const AgeSizeRow({super.key, required this.age, required this.weight, required this.gender, required this.size});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            SvgPicture.asset(
              AssetPath.years,
              width: AppSize.defaultSize! * 2.5,
              height: AppSize.defaultSize! * 2.5,
            ),
            CustomText(
              text: StringManager.age.tr(),
              fontSize: AppSize.defaultSize! * 2,
            ),
            SizedBox(
              height: AppSize.defaultSize! * 0.5,
            ),
            CustomText(
              text: '$age yrs',
              fontSize: AppSize.defaultSize! * 1.5,
            ),
          ],
        ),
        Column(
          children: [
            SvgPicture.asset(
              AssetPath.weight,
              width: AppSize.defaultSize! * 2.5,
              height: AppSize.defaultSize! * 2.5,
            ),
            CustomText(
              text: StringManager.weight.tr(),
              fontSize: AppSize.defaultSize! * 2,
            ),
            SizedBox(
              height: AppSize.defaultSize! * 0.5,
            ),
            CustomText(
              text: '$weight kg',
              fontSize: AppSize.defaultSize! * 1.5,
            ),
          ],
        ),
        Column(
          children: [
            SvgPicture.asset(
              AssetPath.gender,
              width: AppSize.defaultSize! * 2.5,
              height: AppSize.defaultSize! * 2.5,
            ),
            CustomText(
              text: StringManager.gender.tr(),
              fontSize: AppSize.defaultSize! * 2,
            ),
            SizedBox(
              height: AppSize.defaultSize! * 0.5,
            ),
            CustomText(
              text: gender,
              fontSize: AppSize.defaultSize! * 1.5,
            ),
          ],
        ),
        Column(
          children: [
            Image.asset(AssetPath.sCat, width: AppSize.defaultSize! * 2.5,
              height: AppSize.defaultSize! * 2.5,),
            CustomText(
              text:  StringManager.size.tr(),
              fontSize: AppSize.defaultSize! * 2,
            ),
            SizedBox(
              height: AppSize.defaultSize! * 0.5,
            ),
            CustomText(
              text: size,
              fontSize: AppSize.defaultSize! * 1.5,
            ),
          ],
        ),
      ],
    );
  }
}
