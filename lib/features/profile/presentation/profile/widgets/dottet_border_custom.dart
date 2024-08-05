import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:leach/core/resource_manager/asset_path.dart';
import 'package:leach/core/resource_manager/colors.dart';
import 'package:leach/core/resource_manager/string_manager.dart';
import 'package:leach/core/utils/app_size.dart';
import 'package:leach/core/utils/methods.dart';
import 'package:leach/core/widgets/cutom_text.dart';
import 'package:leach/core/widgets/icon_with_matrial.dart';
import 'package:leach/core/widgets/leading_icon.dart';
import 'package:dotted_border/dotted_border.dart';
class DottedBorderCustom extends StatelessWidget {
  const DottedBorderCustom({super.key, this.text, this.onTap});
final String? text;
final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return DottedBorder(
        borderType: BorderType.RRect,
        radius: Radius.circular(AppSize.defaultSize! * 5),
        dashPattern: [
          AppSize.defaultSize! * 2,
          AppSize.defaultSize! * 5,
        ],
        strokeCap: StrokeCap.square,
        color: AppColors.greyColor.withOpacity(.8),
        padding: EdgeInsets.all(AppSize.defaultSize!),
        child: ClipRRect(
          borderRadius: BorderRadius.all(
              Radius.circular(AppSize.defaultSize! * 1.2)),
          child: Container(
            height: AppSize.defaultSize! * 36,
            width: AppSize.defaultSize! * 35,
            color: Colors.transparent,
            child: IconButton(
              onPressed: onTap ,
              icon: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconWithMaterial(
                    color: Colors.white,
                    imagePath: AssetPath.add,
                    height: AppSize.defaultSize! * 5,
                    width: AppSize.defaultSize! * 5,
                    color2: AppColors.greyColor,
                  ),
                  CustomText(
                    text:text?? StringManager.newPost.tr(),
                    color: AppColors.primaryColor,
                    fontSize: AppSize.defaultSize! * 3,
                    fontWeight: FontWeight.w700,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
