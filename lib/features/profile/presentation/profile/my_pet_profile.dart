import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:leach/core/models/profile_data_model.dart';
import 'package:leach/core/resource_manager/asset_path.dart';
import 'package:leach/core/resource_manager/routes.dart';
import 'package:leach/core/resource_manager/string_manager.dart';
import 'package:leach/core/utils/app_size.dart';
import 'package:leach/core/widgets/background.dart';
import 'package:leach/core/widgets/cutom_text.dart';
import 'package:leach/core/widgets/leading_icon.dart';


class MyPetProfile extends StatelessWidget {
  const MyPetProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundScreen(
          image: AssetPath.homeBackground3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: AppSize.defaultSize! * 2,
                  right: AppSize.defaultSize! * 2,
                  top: AppSize.defaultSize! * 6,
                ),
                child: const LeadingIcon(
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: AppSize.defaultSize! * 3,
              ),
              const Spacer(
                flex: 3,
              ),
              InkWell(
                onTap: () {
                  // lesa
                  Navigator.pushNamed(context, Routes.editProfile);
                },
                child: Padding(
                  padding: EdgeInsets.only(left: AppSize.defaultSize! * 2),
                  child: Align(
                      alignment: Alignment.center,
                      child: Image.asset(AssetPath.profileIcon)),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: CustomText(
                  text: StringManager.myProfile.tr(),
                  fontSize: AppSize.defaultSize! * 4,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: AppSize.defaultSize! * 2),
              InkWell(
                onTap: () {
                  // lesa
                  Navigator.pushNamed(context, Routes.editPetProfile,
                      arguments: UserModel.getInstance().pets![0]);
                },
                child: Padding(
                  padding: EdgeInsets.only(left: AppSize.defaultSize! * 2),
                  child: Align(
                      alignment: Alignment.center,
                      child: Image.asset(AssetPath.petPawIcon)),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: CustomText(
                  text: StringManager.petProfile.tr(),
                  fontSize: AppSize.defaultSize! * 4,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Spacer(
                flex: 8,
              ),
            ],
          )),
    );
  }
}
