import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:leach/core/resource_manager/asset_path.dart';
import 'package:leach/core/resource_manager/colors.dart';
import 'package:leach/core/resource_manager/string_manager.dart';
import 'package:leach/core/utils/app_size.dart';
import 'package:leach/core/widgets/cutom_text.dart';
import 'package:leach/features/auth/presentation/widgets/leading_with_icon.dart';
import 'package:leach/features/home/widgets/doctor_card.dart';


class Doctors extends StatelessWidget {
  const Doctors({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                image: AssetPath.handIcon,
              ),
              CustomText(
                text: StringManager.availableSpecialists.tr(),
                fontSize: AppSize.defaultSize! * 4,
                fontWeight: FontWeight.w700,
                maxLines: 2,
                textAlign: TextAlign.start,
              ),
              CustomText(
                text: StringManager.selectPreferredVet.tr(),
                fontSize: AppSize.defaultSize! * 1.5,
                color: AppColors.greyColor,
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 3,
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) => DoctorCard(),
                shrinkWrap: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
