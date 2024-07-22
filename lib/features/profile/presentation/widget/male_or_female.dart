import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:leach/core/resource_manager/colors.dart';
import 'package:leach/core/resource_manager/string_manager.dart';
import 'package:leach/core/utils/app_size.dart';
import 'package:leach/core/widgets/cutom_text.dart';
import 'package:leach/core/widgets/main_button.dart';

class MaleOrFemale extends StatefulWidget {
  const MaleOrFemale({super.key});

  @override
  State<MaleOrFemale> createState() => _MaleOrFemaleState();
}

class _MaleOrFemaleState extends State<MaleOrFemale> {
  bool isMale = true;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        InkWell(
          onTap: () {
            isMale = true;
            setState(() {});
          },
          borderRadius: BorderRadius.circular(AppSize.defaultSize! * 2),
          focusColor: AppColors.primaryColor,
          child: Container(
            width: AppSize.defaultSize! * 17.4,
            height: AppSize.defaultSize! * 6.5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppSize.defaultSize! * 2.5),
              color: isMale ? AppColors.primaryColor : Colors.white,
            ),
            child: Center(
              child: CustomText(
                text: StringManager.male.tr(),
                color: isMale ? Colors.white : AppColors.greyColor,
                fontSize: AppSize.defaultSize! * 2,
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            isMale = false;
            setState(() {});
          },
          borderRadius: BorderRadius.circular(AppSize.defaultSize! * 2),
          focusColor: AppColors.primaryColor,
          child: Container(
            width: AppSize.defaultSize! * 17.4,
            height: AppSize.defaultSize! * 6.5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppSize.defaultSize! * 2.5),
              color: isMale ? Colors.white : AppColors.primaryColor,
            ),
            child: Center(
              child: CustomText(
                text: StringManager.female.tr(),
                color: !isMale ? Colors.white : AppColors.greyColor,
                fontSize: AppSize.defaultSize! * 2,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
