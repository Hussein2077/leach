import 'dart:developer';

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
import 'package:leach/core/widgets/snack_bar.dart';
import 'package:leach/features/home/data/models/vendor.dart';
import 'package:leach/features/home/presentation/componant/review.dart';
import 'package:leach/features/home/presentation/widgets/calender_widget.dart';
import 'package:leach/features/home/presentation/widgets/times.dart';


class CalenderScreen extends StatefulWidget {
  const CalenderScreen({super.key, required this.vendor});
final Vendor vendor;
  @override
  State<CalenderScreen> createState() => _CalenderScreenState();
}

class _CalenderScreenState extends State<CalenderScreen> {
  String selectedDate =  DateTime.now().toString().substring(0, 10);
  String selectedTime = "";
  @override
  Widget build(BuildContext context) {
    log('${selectedDate}selectedDate');
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
              Row(
                children: [
                  const LeadingIcon(),
                  const Spacer(),
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
                CalenderWidget(
                  onDaySelected:  ( day,  focusDay) {
                    setState(() {
                      selectedDate = day.toString();
                     });
                    print(day);
                    print(focusDay);
                  }
                ),
              SizedBox(
                height: AppSize.defaultSize! * 7,
              ),
              CustomText(
                text: StringManager.selectTime.tr(),
                fontSize: AppSize.defaultSize! * 1.5,
                color: AppColors.greyColor,
              ),
                Times(
                  onTap: (time) {
                    setState(() {
                      selectedTime = time ;
                    }) ;
                  },
                ),
              SizedBox(
                height: AppSize.defaultSize! * 3,
              ),
              Center(
                child: MainButton(
                  text: StringManager.next.tr(),
                  onTap: () {
                  if (selectedDate == "" || selectedTime == "") {
                    errorSnackBar(context, 'Please select date and time');
                  }
                  else {
                    Navigator.pushNamed(context, Routes.reviewScreen,arguments: ReviewParams (
                      date: selectedDate,
                      time: selectedTime,
                      vendor: widget.vendor ,
                    ));
                  }
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
