import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:leach/core/resource_manager/asset_path.dart';
import 'package:leach/core/resource_manager/string_manager.dart';
import 'package:leach/core/utils/app_size.dart';
import 'package:leach/core/widgets/cutom_text.dart';
import 'package:leach/core/widgets/icon_with_matrial.dart';
import 'package:leach/core/widgets/large_botton.dart';
import 'package:leach/features/profile/presentation/widget/medals_abd_freinds.dart';
import 'package:leach/features/profile/presentation/widget/profile_app_bar.dart';
import 'package:leach/features/profile/presentation/widget/profile_user_row.dart';

class PersonalProfile extends StatelessWidget {
  const PersonalProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: AppSize.defaultSize! * 8,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSize.defaultSize! * 3.4),
          child: Column(
            children: [
              const ProfileAppBar(),
              SizedBox(
                height: AppSize.defaultSize! * 3,
              ),
              const ProfileUserRow(),
              SizedBox(
                height: AppSize.defaultSize! * 2,
              ),
              Divider(
                color: Colors.white,
                thickness: AppSize.defaultSize! * 0.2,
                indent: AppSize.defaultSize! * 2,
                endIndent: AppSize.defaultSize! * 2,
              ),
              SizedBox(
                height: AppSize.defaultSize! * 3,
              ),
              SizedBox(
                width: AppSize.screenWidth! * .7,
                child: CustomText(
                  text:
                      '''Pet parent to German Shepherd, Kiwi. Enjoys park walks and adventures with Kiwi.''',
                  fontSize: AppSize.defaultSize! * 1.5,
                  color: Colors.white,
                  maxLines: 6,
                  textAlign: TextAlign.start,
                ),
              ),
              const MedalsAbdFriends(),
            ],
          ),
        ),
        const Spacer(),
        Container(
            height: AppSize.screenHeight! * .35,
            width: AppSize.screenWidth!,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(AppSize.defaultSize! * 4),
                    topRight: Radius.circular(AppSize.defaultSize! * 4))),
            child: Stack(
              children: [
                GridView.builder(
                  
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3),
                    padding: EdgeInsets.all(AppSize.defaultSize!*2),
                    itemBuilder: (context, i) {
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius:
                              BorderRadius.circular(AppSize.defaultSize!),
                        ),
                        child: Image.asset(AssetPath.testPosts4),
                      );
                    }),
                Padding(
                  padding:   EdgeInsets.only(top:AppSize.defaultSize!*.5,right: AppSize.defaultSize!*2),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: IconWithMaterial(
                      imagePath: AssetPath.add,
                      width: AppSize.defaultSize!*4,
                      height: AppSize.defaultSize!*4,
                    ),
                  ),
                )
              ],
            )),
      ],
    );
  }
}
