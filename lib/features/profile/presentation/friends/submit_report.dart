import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:leach/core/resource_manager/asset_path.dart';
import 'package:leach/core/resource_manager/routes.dart';
import 'package:leach/core/resource_manager/string_manager.dart';
import 'package:leach/core/utils/app_size.dart';
import 'package:leach/core/widgets/cutom_text.dart';
import 'package:leach/core/widgets/leading_icon.dart';
import 'package:leach/core/widgets/main_button.dart';

class SubmitReport extends StatelessWidget {
  const SubmitReport({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(248, 255, 250, 1),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: AppSize.defaultSize! * 2,
                right: AppSize.defaultSize! * 2,
                top: AppSize.defaultSize! * 6,
              ),
              child: LeadingIcon(),
            ),
            SizedBox(
              height: AppSize.defaultSize! * 3,
            ),
            SizedBox(
              width: AppSize.defaultSize! * 1.2,
            ),

            Padding(
              padding: EdgeInsets.only(
                left: AppSize.defaultSize! * 3.2,
              ),
              child: CustomText(
                text: StringManager.submitYourReport.tr(),
                fontSize: AppSize.defaultSize! * 2,
                maxLines: 2,
                textAlign: TextAlign.start,
              ),
            ),
            SizedBox(
              height: AppSize.defaultSize! * 0.4,
            ),
            Divider(
              color: Colors.black,
              //color of divider
              height: 5,
              //height spacing of divider
              thickness: 0.6,
              //thickness of divier line
              indent: AppSize.defaultSize! * 2.2,
              //spacing at the start of divider
              endIndent:
                  AppSize.defaultSize! * 2.8, //spacing at the end of divider
            ),
            Center(
              child: Container(
                width: AppSize.defaultSize! * 40,
                height: AppSize.defaultSize! * 40,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage(AssetPath.submitContainer),
                )),
                child: Padding(
                  padding:   EdgeInsets.only(top:   AppSize.defaultSize! * 18),
                  child: Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: AppSize.defaultSize! * 20,
                      child: CustomText(
                        text: StringManager.submitYourReport.tr(),
                        fontSize: AppSize.defaultSize! * 1.5,
                        maxLines: 5,
                        fontFamily: 'Gully',
                        color: Colors.white,


                      ),
                    ),
                  ),
                ),
              ),
            ),
            // Stack(
            //   alignment: Alignment.center,
            //     children:[Center(child: Image.asset(
            // AssetPath.submitContainer,width: AppSize.defaultSize! * 28,)),
            //     Padding(
            //       padding:  EdgeInsets.only(top: AppSize.defaultSize! * 15),
            //       child: CustomText(text: StringManager.submitYourReport.tr(),
            //         fontSize: AppSize.defaultSize! * 1.5,
            //         fontFamily: 'Gully',
            //         color: Colors.white,
            //       ),
            //     )
            //     ]) ,

            SizedBox(
              height: AppSize.defaultSize! * 18,
            ),
            Center(
              child: MainButton(
                  text: StringManager.submitReport.tr(),
                  color: Color.fromRGBO(68, 82, 255, 1),
                  textColor: Colors.white,
                  onTap: () {
                    Navigator.pushNamed(context, Routes.reportView);
                  }),
            ),
          ],
        ),
      ),
    );
    return const Placeholder();
  }
}
