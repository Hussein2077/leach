import 'package:flutter/material.dart';
import 'package:leach/core/resource_manager/colors.dart';
import 'package:leach/core/resource_manager/string_manager.dart';
import 'package:leach/core/utils/app_size.dart';
import 'package:leach/core/widgets/cutom_text.dart';
class OrAndDivider extends StatelessWidget {
  const OrAndDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        const Expanded(
          child: Divider(
            color: AppColors.greyColor,
            thickness: 1,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSize.defaultSize! * 7),
          child:  CustomText(
            fontSize: AppSize.defaultSize! * 1.7,
            text: StringManager.orLoginWith,
            color: AppColors.greyColor,
          ),
        ),
        const Expanded(
          child: Divider(
            color: AppColors.greyColor,
            thickness: 1,
          ),
        ),
      ],
    );
  }
}
