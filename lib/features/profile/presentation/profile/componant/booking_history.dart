import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:leach/core/resource_manager/asset_path.dart';
import 'package:leach/core/resource_manager/string_manager.dart';
import 'package:leach/core/utils/app_size.dart';
import 'package:leach/core/widgets/cutom_text.dart';
import 'package:leach/core/widgets/leading_icon.dart';
import 'package:leach/features/profile/presentation/profile/widgets/doctor_card2.dart';

class BookingHistory extends StatelessWidget {
  const BookingHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(68,82, 255, 1),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(

            top: AppSize.defaultSize! * 6,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:  EdgeInsets.only(bottom: AppSize.defaultSize! * 3,left: AppSize.defaultSize! * 2),
                child: LeadingIcon(color: Colors.white,),
              ),

              Padding(
                padding:  EdgeInsets.only(left:AppSize.defaultSize! * 3),
                child: Row(
                  children: [
                    Image.asset( AssetPath.smallWhiteCalendar),
                    CustomText(
                      color: Colors.white,
                      text: StringManager.bookingHistory.tr(),
                      fontSize: AppSize.defaultSize! * 2,
                      fontWeight: FontWeight.w600,

                      maxLines: 2,
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ),

              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 3,
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) => const DoctorCard2(),
                shrinkWrap: true,
              ),

            ],
          ),
        ),
      ),
    );
  }
}
