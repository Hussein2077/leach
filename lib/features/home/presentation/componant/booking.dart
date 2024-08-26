import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:leach/core/resource_manager/asset_path.dart';
import 'package:leach/core/resource_manager/colors.dart';
import 'package:leach/core/resource_manager/routes.dart';
import 'package:leach/core/resource_manager/string_manager.dart';
import 'package:leach/core/utils/app_size.dart';
import 'package:leach/core/utils/enums.dart';
import 'package:leach/core/utils/methods.dart';
import 'package:leach/core/widgets/cutom_text.dart';
import 'package:leach/core/widgets/large_botton.dart';
import 'package:leach/core/widgets/leading_icon.dart';
import 'package:leach/features/auth/presentation/widgets/leading_with_icon.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: EdgeInsets.only(
          left: AppSize.defaultSize! * 2,
          right: AppSize.defaultSize! * 2,
          top: AppSize.defaultSize! * 6,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const LeadingWithIcon(
                image: AssetPath.calender2,
              ),
              CustomText(
                text: StringManager.booking.tr(),
                fontSize: AppSize.defaultSize! * 4,
                fontWeight: FontWeight.w700,
              ),
              Center(
                child: Column(
                  children: [
                    LargeButton(
                      text: StringManager.veternarians,
                      onPressed: (){
                        Navigator.pushNamed(context, Routes.doctor,arguments: TypeOfVendor.vet);
                      },
                      child: Image.asset(
                        AssetPath.petProfile,
                        color: AppColors.primaryColor,

                      ),
                    ),
                    SizedBox(
                      height: AppSize.defaultSize! * 2,
                    ),
                    LargeButton(
                      text: StringManager.groomYourPet,
                      child: Image.asset(
                        AssetPath.petProfile,
                        color: AppColors.primaryColor,
                      ),
                      onPressed: (){
                        Navigator.pushNamed(context, Routes.doctor,arguments: TypeOfVendor.grooming);
                      },
                    ),
                    SizedBox(
                      height: AppSize.defaultSize! * 2,
                    ),
                    LargeButton(
                      text: StringManager.trainingCenters,
                      onPressed:  (){
                        Navigator.pushNamed(context, Routes.doctor,arguments: TypeOfVendor.training);
                      },
                      child: Image.asset(
                        AssetPath.petProfile,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
