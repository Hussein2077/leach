import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leach/core/resource_manager/asset_path.dart';
import 'package:leach/core/resource_manager/colors.dart';
import 'package:leach/core/resource_manager/string_manager.dart';
import 'package:leach/core/utils/app_size.dart';
import 'package:leach/core/utils/enums.dart';
import 'package:leach/core/widgets/cached_network_image.dart';
import 'package:leach/core/widgets/cutom_text.dart';
import 'package:leach/core/widgets/loading_widget.dart';
import 'package:leach/features/home/data/models/how_toModel.dart';
import 'package:leach/features/home/presentation/manager/how_to/bloc.dart';
import 'package:leach/features/home/presentation/manager/how_to/event.dart';
import 'package:leach/features/home/presentation/manager/how_to/state.dart';
import 'package:leach/features/home/presentation/widgets/upper_stack.dart';

class HowTo extends StatefulWidget {
  const HowTo({super.key, required this.howToModel});

  final HowToModel howToModel;

  @override
  State<HowTo> createState() => _HowToState();
}

class _HowToState extends State<HowTo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            UpperStack(
              howToModel: widget.howToModel,
            ),
            Column(
              children: [
                CustomText(
                  text: StringManager.steps.tr(),
                  fontSize: AppSize.defaultSize! * 4,
                  fontWeight: FontWeight.bold,
                ),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: widget.howToModel.steps.length,
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: AppSize.defaultSize! * 1),
                        child: Column(
                          children: [
                            Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
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
                                    width: AppSize.defaultSize!,
                                  ),
                                  SizedBox(
                                    width: AppSize.screenWidth! * .8,
                                    child: CustomText(
                                      text: widget.howToModel.steps[index].text,
                                      fontSize: AppSize.defaultSize! * 1.5,
                                      fontFamily: 'Gully',
                                      textAlign: TextAlign.start,
                                      maxLines: 5,
                                    ),
                                  ),
                                ]),
                            SizedBox(
                              height: AppSize.defaultSize! * 2,
                            ),
                            CachedNetworkCustom(
                              url: widget.howToModel.steps[index].picture,
                              height: AppSize.defaultSize! * 20,
                              width: AppSize.screenWidth!,
                              fit: BoxFit.fitWidth,
                            ),
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
                        itemCount: widget.howToModel.tips.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: AppSize.defaultSize! * 1),
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
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
                                    width: AppSize.defaultSize!,
                                  ),
                                  SizedBox(
                                    width: AppSize.screenWidth! * .8,
                                    child: CustomText(
                                      text: widget.howToModel.tips[index].text,
                                      fontSize: AppSize.defaultSize! * 1.5,
                                      fontFamily: 'Gully',
                                      textAlign: TextAlign.start,
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
