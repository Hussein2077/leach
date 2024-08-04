import 'package:flutter/material.dart';
import 'package:leach/core/resource_manager/colors.dart';
import 'package:leach/core/utils/app_size.dart';
import 'package:leach/core/widgets/cutom_text.dart';

class ChatDetailsItem extends StatelessWidget {
  const ChatDetailsItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: AppSize.defaultSize! * 21,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                    AppSize.defaultSize! * 1.5),
                color: AppColors.primaryColor,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: AppSize.defaultSize!*.5,
                    horizontal: AppSize.defaultSize!  ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomText(
                      text: 'Hi, I want to breed my dog.',
                      color: Colors.white,
                      maxLines: 10, fontFamily: 'Gully',
                    ),
                    Row(
                      mainAxisAlignment:
                      MainAxisAlignment.end,
                      children: [
                        CustomText(
                          text: '10:00 AM  ',
                          color: Colors.white,
                          fontFamily: 'Gully',
                          fontSize: AppSize.defaultSize!,
                        ),
                        Icon(
                          Icons.check,
                          color: Colors.white,
                          size: AppSize.defaultSize! * 1.3,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: AppSize.defaultSize! * 2,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Material(
              elevation: 3,
              borderRadius: BorderRadius.circular(
                  AppSize.defaultSize! * 1.5),
              child: Container(
                width: AppSize.defaultSize! * 21,
                height: AppSize.defaultSize! * 5.3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                      AppSize.defaultSize! * 1.5),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: AppSize.defaultSize!*.5,
                      horizontal: AppSize.defaultSize!  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomText(
                        text: 'Hi, I want to breed my dog.',
                        color: AppColors.primaryColor,
                        maxLines: 10, fontFamily: 'Gully',
                      ),
                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment.end,
                        children: [
                          CustomText(
                            text: '10:00 AM  ',
                            color: AppColors.primaryColor,
                            fontFamily: 'Gully',
                            fontSize: AppSize.defaultSize!,
                          ),
                          Icon(
                            Icons.check,
                            color: AppColors.primaryColor,
                            size: AppSize.defaultSize! * 1.3,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: AppSize.defaultSize! * 2,
        ),
      ],
    );
  }
}
