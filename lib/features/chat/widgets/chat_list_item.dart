import 'package:flutter/material.dart';
import 'package:leach/core/resource_manager/asset_path.dart';
import 'package:leach/core/resource_manager/colors.dart';
import 'package:leach/core/utils/app_size.dart';
import 'package:leach/core/widgets/cutom_text.dart';
import 'package:leach/core/widgets/icon_with_matrial.dart';

class ChatListItem extends StatelessWidget {
  const ChatListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:   EdgeInsets.symmetric(horizontal:   AppSize.defaultSize! ),
      child: Column(
        children: [
          const Divider(
            color: AppColors.greyColor,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: AppSize.defaultSize! * 1),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconWithMaterial(
                  imagePath: AssetPath.profile,
                  color: AppColors.primaryColor,
                  color2: Colors.white,
                  width: AppSize.defaultSize! * 3.8,
                  height: AppSize.defaultSize! * 3.8,
                  elevation: 5,
                ),
                SizedBox(
                  width: AppSize.defaultSize!,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                        text: "Ahmed Ali",
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w600,
                        textAlign: TextAlign.start,
                        fontSize: AppSize.defaultSize! * 1.8),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.check,
                          color: AppColors.greyColor,
                          size: AppSize.defaultSize! * 1.3,
                        ),
                        SizedBox(
                          width: AppSize.defaultSize! * .5,
                        ),
                        SizedBox(
                          width: AppSize.screenWidth! * .5,
                          child: CustomText(
                              text: "Hi, I want to breed my dog.",
                              color: AppColors.greyColor,
                              maxLines: 1,
                              fontFamily: 'Gully',
                              textAlign: TextAlign.start,
                              fontSize: AppSize.defaultSize! * 1.4),
                        ),
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                CustomText(
                    text: "10:30",
                    color: AppColors.greyColor,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Gully',
                    fontSize: AppSize.defaultSize!),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
