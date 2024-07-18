import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:leach/core/resource_manager/asset_path.dart';
import 'package:leach/core/resource_manager/colors.dart';
import 'package:leach/core/resource_manager/routes.dart';
import 'package:leach/core/resource_manager/string_manager.dart';
import 'package:leach/core/utils/app_size.dart';
import 'package:leach/core/widgets/background.dart';
import 'package:leach/core/widgets/cutom_text.dart';
import 'package:leach/core/widgets/large_botton.dart';
import 'package:leach/core/widgets/leading_icon.dart';
import 'package:leach/features/auth/presentation/widgets/leading_with_icon.dart';

class AddPetScreen extends StatelessWidget {
  const AddPetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundScreen(
        image: AssetPath.welcomeImage3,
        child: Padding(
          padding: EdgeInsets.only(
            left: AppSize.defaultSize! * 2,
            right: AppSize.defaultSize! * 2,
            top: AppSize.defaultSize! * 6,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const LeadingWithIcon(
                withIcon: false,
                color: Colors.white,
              ),
              SizedBox(
                height: AppSize.screenHeight! * .4,
              ),
              Center(
                child: LargeButton(
                  text: StringManager.addPet.tr(),
                  child: Icon(
                    Icons.add,
                    color: AppColors.primaryColor,
                    size: AppSize.defaultSize! * 8,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.TypeOfPetScreen);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
