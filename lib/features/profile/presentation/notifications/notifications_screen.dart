import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:leach/core/resource_manager/asset_path.dart';
import 'package:leach/core/resource_manager/routes.dart';
import 'package:leach/core/resource_manager/string_manager.dart';
import 'package:leach/core/utils/app_size.dart';
import 'package:leach/core/widgets/background.dart';
import 'package:leach/core/widgets/cutom_text.dart';
import 'package:leach/core/widgets/leading_icon.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: BackgroundScreen(
        image: AssetPath.homeBackground,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSize.defaultSize! * 3.4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: AppSize.defaultSize! * 8,
              ),
              Row(
                children: [
                  const LeadingIcon(
                    color: Colors.white,
                  ),
                  const Spacer(),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.notifications,
                        size: AppSize.defaultSize! * 3.5,
                        color: Colors.white,
                      ),
                  ),
                ],
              ),

              SizedBox(
                height: AppSize.defaultSize! * 2,
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: AppSize.defaultSize! * 3),
                child: Text(
                  StringManager.notifications.tr(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: AppSize.defaultSize! * 3,
                      fontWeight: FontWeight.normal
                  ),
                ),
              ),
              Container(
                width: AppSize.screenWidth,
                height: 1,
                color: Colors.white,
              ),

              Padding(
                padding: EdgeInsets.symmetric(vertical: AppSize.defaultSize! * 3),
                child: InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, Routes.friendRequests);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            AssetPath.pet2Leg,
                            width: AppSize.defaultSize! * 1.5,
                            height: AppSize.defaultSize! * 2,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: AppSize.defaultSize! * 3,
                          ),
                          CustomText(
                              text: StringManager.friendRequests.tr(),
                              fontSize: AppSize.defaultSize! * 2.5,
                              color: Colors.white,
                              fontWeight: FontWeight.normal
                          ),
                        ],
                      ),

                      Transform.rotate(
                        angle: 3.14,
                        child: Image.asset(AssetPath.leadingIcon,color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
