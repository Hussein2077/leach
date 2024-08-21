import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:leach/core/resource_manager/asset_path.dart';
import 'package:leach/core/resource_manager/colors.dart';
import 'package:leach/core/resource_manager/string_manager.dart';
import 'package:leach/core/utils/app_size.dart';
import 'package:leach/core/widgets/cutom_text.dart';
import 'package:leach/core/widgets/icon_with_matrial.dart';
import 'package:leach/core/widgets/leading_icon.dart';
import 'package:leach/features/home/data/models/how_toModel.dart';

class UpperStack extends StatelessWidget {
  const UpperStack({super.key, required this.howToModel});

  final HowToModel howToModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(
        children: [
          Image.asset(
            AssetPath.curved,
            width: AppSize.screenWidth,
            fit: BoxFit.fitWidth,
          ),
          Positioned(
            top: AppSize.defaultSize! * 7,
            left: AppSize.defaultSize! * 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const LeadingIcon(
                  color: Colors.white,
                ),
                SizedBox(
                  width: AppSize.defaultSize! * 6,
                ),
                Image.asset(
                  AssetPath.dog,
                  color: Colors.white,
                  width: AppSize.defaultSize! * 4,
                  height: AppSize.defaultSize! * 4,
                ),
                SizedBox(
                  width: AppSize.defaultSize! * 2,
                ),
                CustomText(
                  text: howToModel.title,
                  color: Colors.white,
                  fontSize: AppSize.defaultSize! * 4,
                )
              ],
            ),
          ),
          Positioned(
            top: AppSize.defaultSize! * 15,
            left: AppSize.defaultSize! * 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          AssetPath.howTo,
                        ),
                        fit: BoxFit.fitWidth),
                  ),
                  width: AppSize.screenWidth! * .95,
                  height: AppSize.defaultSize! * 8,
                  child: Center(
                    child: Column(
                      children: [
                        CustomText(
                            text: StringManager.difficultyLevel.tr(),
                            fontSize: AppSize.defaultSize! * 2),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(5, (index) {
                            return Row(
                              children: [
                                IconWithMaterial(
                                  imagePath: AssetPath.rate,
                                  color: index < howToModel.difficultyLevel
                                      ? AppColors.primaryColor
                                      : Colors.white,
                                  color2: index < howToModel.difficultyLevel
                                      ? Colors.white
                                      : AppColors.greyColor,
                                ),
                                if (index < 4)
                                  const SizedBox(
                                    width: 2,
                                  ),
                              ],
                            );
                          }),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: AppSize.defaultSize!,
                ),
                SizedBox(
                  width: AppSize.screenWidth! * .8,
                  child: CustomText(
                    text: howToModel.description,
                    fontSize: AppSize.defaultSize! * 1.5,
                    fontFamily: 'Gully',
                    color: Colors.white,
                    maxLines: 5,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
