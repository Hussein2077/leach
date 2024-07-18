import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:leach/core/resource_manager/colors.dart';
import 'package:leach/core/resource_manager/routes.dart';
import 'package:leach/core/resource_manager/string_manager.dart';
import 'package:leach/core/utils/app_size.dart';
import 'package:leach/core/widgets/cutom_text.dart';
import 'package:leach/core/widgets/main_button.dart';
import 'package:leach/features/auth/presentation/widgets/leading_with_icon.dart';
import 'package:leach/features/auth/presentation/widgets/pin_text_field.dart';
class CodeScreen extends StatefulWidget {
  const CodeScreen({super.key});

  @override
  State<CodeScreen> createState() => _CodeScreenState();
}

class _CodeScreenState extends State<CodeScreen> {
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
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
              const LeadingWithIcon(),
              CustomText(
                text: StringManager.code.tr(),
                fontSize: AppSize.defaultSize! * 4,
                fontWeight: FontWeight.w700,
              ),
              CustomText(
                text: StringManager.enterVerificationCode.tr(),
                fontSize: AppSize.defaultSize! * 1.5,
                color: AppColors.greyColor,
              ), SizedBox(
                height: AppSize.defaultSize! * 11,
              ),
              const CustomPinCodeTextField(),
              SizedBox(
                height: AppSize.screenHeight! * .2,
              ),
              Center(
                child: MainButton(
                  text: StringManager.next.tr(),
                  onTap: () {
                    Navigator.pushNamed(context, Routes.resetPassword);
                  },
                  textColor: Colors.white,
                ),
              ),
              SizedBox(
                height: AppSize.defaultSize! * 5.8,
              ),

            ],
          ),
        ),
      ),
    );
  }
}
