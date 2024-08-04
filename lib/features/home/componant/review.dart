import 'package:flutter/material.dart';
import 'package:leach/core/resource_manager/asset_path.dart';
import 'package:leach/core/resource_manager/colors.dart';
import 'package:leach/core/resource_manager/routes.dart';
import 'package:leach/core/resource_manager/string_manager.dart';
import 'package:leach/core/utils/app_size.dart';
import 'package:leach/core/widgets/background.dart';
import 'package:leach/core/widgets/cutom_text.dart';
import 'package:leach/core/widgets/leading_icon.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:leach/core/widgets/available_training_specialist_row.dart';
import 'package:leach/core/widgets/main_button.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundScreen(
        image: AssetPath.homeBackground2,
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: AppSize.defaultSize! * 5,
                      left: AppSize.defaultSize! * 3.6,
                      right: AppSize.defaultSize! * 3.6),
                  child: Row(
                    children: [
                      const LeadingIcon(
                        color: Colors.white,
                      ),
                      const Spacer(),
                      Image.asset(
                        AssetPath.calender,
                        color: Colors.white,
                        width: AppSize.defaultSize! * 3,
                        height: AppSize.defaultSize! * 3,
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: AppSize.screenHeight! * .65,
                    width: AppSize.screenWidth!,
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(AppSize.defaultSize! * 4),
                            topRight:
                                Radius.circular(AppSize.defaultSize! * 4))),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: AppSize.defaultSize! * 3),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              AssetPath.addPet,
                              color: AppColors.primaryColor,
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  AssetPath.doctor,
                                  scale: 1.3,
                                ),
                                CustomText(
                                  text: "Dr. Ali Korkor",
                                  fontSize: AppSize.defaultSize! * 3,
                                  fontWeight: FontWeight.w700,
                                  maxLines: 1,
                                  textAlign: TextAlign.start,
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: AppSize.defaultSize!,
                                ),
                                const TextImageRow(
                                  text: 'Microchip',
                                  image: AssetPath.doctor2,
                                ),
                                SizedBox(height: AppSize.defaultSize! * 3),
                                const TextImageRow(
                                  text:
                                      '${StringManager.address}:El Sheikh Zayed',
                                  image: AssetPath.address,
                                ),
                                SizedBox(height: AppSize.defaultSize! * 3),
                                const TextImageRow(
                                  text: '${StringManager.fees}:600 EGP',
                                  image: AssetPath.fees,
                                ),
                                SizedBox(height: AppSize.defaultSize! * 3),
                                const TextImageRow(
                                  text: '${StringManager.date}:600 EGP',
                                  image: AssetPath.calender,
                                ),
                                SizedBox(height: AppSize.defaultSize! * 3),
                                const TextImageRow(
                                  text: '${StringManager.time}:600 EGP',
                                  image: AssetPath.clock,
                                ),
                                SizedBox(height: AppSize.defaultSize! * 3),
                                const TextImageRow(
                                  text: '${StringManager.phone}:2234567',
                                  image: AssetPath.phone,
                                ),
                                SizedBox(height: AppSize.defaultSize! * 3),
                                Center(
                                  child: MainButton(
                                    text: StringManager.confirmAppointment.tr(),
                                    onTap: () {
                                      Navigator.pushNamed(context, Routes.cashOrCredit);
                                    },
                                    textColor: Colors.white,
                                  ),
                                ),
                                SizedBox(height: AppSize.defaultSize! * 3),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
