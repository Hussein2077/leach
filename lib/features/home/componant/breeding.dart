import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:leach/core/resource_manager/asset_path.dart';
import 'package:leach/core/resource_manager/string_manager.dart';
import 'package:leach/core/utils/app_size.dart';
import 'package:leach/core/utils/methods.dart';
import 'package:leach/core/widgets/cutom_text.dart';
import 'package:leach/core/widgets/icon_with_matrial.dart';
import 'package:leach/core/widgets/leading_icon.dart';
import 'package:leach/features/home/componant/age_size_row.dart';

class BreedingScreen extends StatelessWidget {
  const BreedingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: Methods.instance.paddingCustom,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const LeadingIcon(),
            Expanded(child: ListView.builder(itemBuilder: (context, index) {
              return Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(AppSize.defaultSize! * 2),
                    ),
                    width: AppSize.defaultSize! * 35,
                    height: AppSize.defaultSize! * 51,
                    child: Stack(
                      children: [
                        Image.asset(
                          AssetPath.testPosts6,
                          fit: BoxFit.fill,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: AppSize.defaultSize! * 2,
                            right: AppSize.defaultSize! * 1.5,
                          ),
                          child: Align(
                              alignment: Alignment.topRight,
                              child: IconWithMaterial(
                                imagePath: AssetPath.chat,
                                width: AppSize.defaultSize! * 3.5,
                                height: AppSize.defaultSize! * 3.5,
                              )),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: AppSize.defaultSize! * 2.5,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppSize.defaultSize! * 1.5),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CustomText(
                              text: 'Kiwi',
                              fontSize: AppSize.defaultSize! * 4,
                              fontWeight: FontWeight.w700,
                            ),
                            const Spacer(),
                            IconWithMaterial(
                              imagePath: AssetPath.like,
                              width: AppSize.defaultSize! * 2.5,
                              height: AppSize.defaultSize! * 2.5,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: AppSize.defaultSize! * 0.5,
                        ),
                        Row(
                          children: [
                            Image.asset(
                              AssetPath.dogFace,
                              width: AppSize.defaultSize! * 2,
                              height: AppSize.defaultSize! * 2,
                            ),
                            SizedBox(
                              width: AppSize.defaultSize! * .5,
                            ),
                            CustomText(
                              text: 'Golden Retriever',
                              fontSize: AppSize.defaultSize! * 2,
                              fontWeight: FontWeight.w400,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: AppSize.defaultSize! * 1.5,
                        ),
                        const AgeSizeRow(),
                        SizedBox(
                          height: AppSize.defaultSize! *3,
                        ),

                      ],
                    ),
                  ),
                ],
              );
            })),
          ],
        ),
      ),
    );
  }
}
