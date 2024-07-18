import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:leach/core/resource_manager/asset_path.dart';
import 'package:leach/core/resource_manager/colors.dart';
import 'package:leach/core/resource_manager/routes.dart';
import 'package:leach/core/resource_manager/string_manager.dart';
import 'package:leach/core/utils/app_size.dart';
import 'package:leach/core/widgets/column_with_text_field.dart';
import 'package:leach/core/widgets/cutom_text.dart';
import 'package:leach/core/widgets/main_button.dart';
import 'package:leach/features/auth/presentation/widgets/leading_with_icon.dart';
class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
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
                text: StringManager.resetPassword.tr(),
                fontSize: AppSize.defaultSize! * 4,
                fontWeight: FontWeight.w700,
              ),
              CustomText(
                text: StringManager.enterYourInformation.tr(),
                fontSize: AppSize.defaultSize! * 1.5,
                color: AppColors.greyColor,
              ),
              ColumnWithTextField(
                text: StringManager.enterPhone.tr(),
                hintText: StringManager.phoneNumber.tr(),
              ),
              SizedBox(
                height: AppSize.screenHeight! * .3,
              ),
              Center(
                child: MainButton(
                  text: StringManager.next.tr(),
                  onTap: () {
                    Navigator.pushNamed(context, Routes.otpCode);
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
