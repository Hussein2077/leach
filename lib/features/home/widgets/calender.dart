import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:leach/core/resource_manager/asset_path.dart';
import 'package:leach/core/resource_manager/colors.dart';
import 'package:leach/core/resource_manager/routes.dart';
import 'package:leach/core/resource_manager/string_manager.dart';
import 'package:leach/core/utils/app_size.dart';
import 'package:leach/core/utils/methods.dart';
import 'package:leach/core/widgets/cutom_text.dart';
import 'package:leach/core/widgets/leading_icon.dart';
import 'package:leach/core/widgets/main_button.dart';
import 'package:leach/features/home/widgets/calender_widget.dart';
import 'package:leach/features/home/widgets/times.dart';
import 'package:table_calendar/table_calendar.dart';

class CalenderScreen extends StatefulWidget {
  const CalenderScreen({super.key});

  @override
  State<CalenderScreen> createState() => _CalenderScreenState();
}

class _CalenderScreenState extends State<CalenderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: Methods.instance.paddingCustom,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  LeadingIcon(),
                  Spacer(),
                  Image.asset(
                    AssetPath.petProfile,
                    color: AppColors.primaryColor,
                    width: AppSize.defaultSize! * 3,
                    height: AppSize.defaultSize! * 3,
                  ),
                ],
              ),
              SizedBox(
                height: AppSize.defaultSize! * 3,
              ),
              CustomText(
                text: StringManager.booking.tr(),
                fontSize: AppSize.defaultSize! * 4,
                fontWeight: FontWeight.w700,
              ),
              CustomText(
                text: StringManager.selectDate.tr(),
                fontSize: AppSize.defaultSize! * 1.5,
                color: AppColors.greyColor,
              ),
              const CalenderWidget(),
              SizedBox(
                height: AppSize.defaultSize! * 7,
              ),
              CustomText(
                text: StringManager.selectTime.tr(),
                fontSize: AppSize.defaultSize! * 1.5,
                color: AppColors.greyColor,
              ),
              const Times(),
              SizedBox(
                height: AppSize.defaultSize! * 3,
              ),
              Center(
                child: MainButton(
                  text: StringManager.next.tr(),
                  onTap: () {
                    Navigator.pushNamed(context, Routes.reviewScreen);
                  },
                  textColor: Colors.white,
                ),
              ),
              SizedBox(
                height: AppSize.defaultSize! * 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
