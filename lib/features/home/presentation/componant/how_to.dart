import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:leach/core/resource_manager/asset_path.dart';
import 'package:leach/core/resource_manager/colors.dart';
import 'package:leach/core/resource_manager/string_manager.dart';
import 'package:leach/core/utils/app_size.dart';
import 'package:leach/core/widgets/cutom_text.dart';
import 'package:leach/features/home/presentation/widgets/upper_stack.dart';

class HowTo extends StatelessWidget {
  const HowTo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const UpperStack(),
            Column(
              children: [
                CustomText(
                  text: StringManager.steps.tr(),
                  fontSize: AppSize.defaultSize! * 4,
                  fontWeight: FontWeight.bold,
                ),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: 5,
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: AppSize.defaultSize! * 1),
                        child: Column(
                          children: [
                            Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: AppSize.defaultSize! * 3,
                                    height: AppSize.defaultSize! * 3,
                                    child: Material(
                                      color: AppColors.primaryColor,
                                      elevation: 10,
                                      shape: const CircleBorder(),
                                      child: Padding(
                                          padding: EdgeInsets.all(
                                              AppSize.defaultSize! * .5),
                                          child: Center(
                                              child: CustomText(
                                            text: '${index + 1}',
                                            color: Colors.white,
                                            fontSize:
                                                AppSize.defaultSize! * 1.5,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Gully',
                                          ))),
                                    ),
                                  ),
                                  SizedBox(
                                    width: AppSize.screenWidth! * .8,
                                    child: CustomText(
                                      text:
                                          '''Clicker training uses a clicker to mark desired behaviors, making learning quick and enjoyable for animals. It’s an effective positive reinforcement method.''',
                                      fontSize: AppSize.defaultSize! * 1.5,
                                      fontFamily: 'Gully',
                                      maxLines: 5,
                                    ),
                                  ),
                                ]),
                            SizedBox(
                              height: AppSize.defaultSize! * 2,
                            ),
                            Image.asset(
                              AssetPath.testPosts2,
                              height: AppSize.defaultSize! * 20,
                              width: AppSize.screenWidth!,
                              fit: BoxFit.fitWidth,
                            )
                          ],
                        ),
                      );
                    }),
              ],
            ),
            Container(
              width: AppSize.screenWidth,
              height: AppSize.screenHeight! * .6,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    AssetPath.withVista,
                  ),
                  fit: BoxFit.fill,
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: AppSize.defaultSize! * 12,
                  ),
                  CustomText(
                    text: StringManager.tips.tr(),
                    fontSize: AppSize.defaultSize! * 4,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  Expanded(
                    child: ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: 5,

                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: AppSize.defaultSize! * 1),
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: AppSize.defaultSize! * 3,
                                    height: AppSize.defaultSize! * 3,
                                    child: const Material(
                                      color: Colors.white,
                                      elevation: 10,
                                      shape: CircleBorder(),
                                    ),
                                  ),
                                  SizedBox(
                                    width: AppSize.screenWidth! * .8,
                                    child: CustomText(
                                      text:
                                          '''Clicker training uses a clicker to mark desired behaviors, making learning quick and enjoyable for animals. It’s an effective positive reinforcement method.''',
                                      fontSize: AppSize.defaultSize! * 1.5,
                                      fontFamily: 'Gully',
                                      maxLines: 5,
                                      color: Colors.white,
                                    ),
                                  ),
                                ]),
                          );
                        }),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
