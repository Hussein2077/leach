import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:leach/core/resource_manager/asset_path.dart';
import 'package:leach/core/resource_manager/colors.dart';
import 'package:leach/core/resource_manager/routes.dart';
import 'package:leach/core/resource_manager/string_manager.dart';
import 'package:leach/core/utils/app_size.dart';
import 'package:leach/core/widgets/available_training_specialist_row.dart';
import 'package:leach/core/widgets/cutom_text.dart';


class DoctorCard2 extends StatelessWidget {
  const DoctorCard2({super.key, this.onTap});
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.symmetric(
          vertical: AppSize.defaultSize!),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius:
          BorderRadius.circular(AppSize.defaultSize! * 4),
        ),
        elevation: 10,
        color: const Color.fromRGBO(246, 255, 255, 1),
        shadowColor: Colors.black,
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.all(AppSize.defaultSize! * .6),
            child: Column(
              children: [
                Padding(
                  padding:  EdgeInsets.only(top:AppSize.defaultSize! * 6,left: AppSize.defaultSize!*1.5),
                  child: Row(
                    children: [
                      Image.asset(
                        AssetPath.doctor,
                        scale: 1.3,
                      ),
                      Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: AppSize.defaultSize! * 2,
                            ),
                            CustomText(
                              text: "Dr. Ali Korkor",
                              fontSize: AppSize.defaultSize! * 3,
                              fontWeight: FontWeight.w500,
                              maxLines: 1,
                              textAlign: TextAlign.start,
                            ),
                          ]),
                    ],
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                      height: AppSize.defaultSize! * 3,
                    ),
                    const TextImageRow(
                      text:
                      '${StringManager.microchip}',
                      image: AssetPath.doctor2,

                    ),
                    SizedBox(
                        height: AppSize.defaultSize! * 3
                    ),
                    const TextImageRow(
                      text:
                      '${StringManager.address}:El Sheikh Zayed,  Waslet Dahshour',
                      image: AssetPath.address,
                    ),
                    SizedBox(
                        height: AppSize.defaultSize! * 3
                    ),
                    const TextImageRow(
                      text: '${StringManager.fees}:600 EGP',
                      image: AssetPath.fees,
                    ),
                    SizedBox(
                        height: AppSize.defaultSize! * 3
                    ),
                    const TextImageRow(
                      text: '${StringManager.date}:06/11/2024',
                      image: AssetPath.smallCalendar,
                    ),
                    SizedBox(
                        height: AppSize.defaultSize! * 3
                    ),
                    const TextImageRow(
                      text: '${StringManager.time}:11:00 AM',
                      image: AssetPath.clock,
                    ),
                    SizedBox(
                        height: AppSize.defaultSize! * 3
                    ),

                    const TextImageRow(
                      text: '${StringManager.phone}:2234567',
                      image: AssetPath.phone,
                    ),
                    SizedBox(
                        height: AppSize.defaultSize! * 7
                    ),
                    // Center(
                    //   child: MainButton(
                    //     text: StringManager.book.tr(),
                    //     fontSize: AppSize.defaultSize! *2.5,
                    //
                    //     onTap: () {
                    //       Navigator.pushNamed(context, Routes.addPetScreen);
                    //     },
                    //     textColor: Colors.white,
                    //   ),
                    // ),
                    // SizedBox(height: AppSize.defaultSize!*1.4,),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
