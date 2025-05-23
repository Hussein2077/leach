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
import 'package:leach/features/auth/presentation/widgets/pin_text_field.dart';
class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  bool isVisiblePassword = false;
  bool isVisibleConfirmPassword = false;
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
              StatefulBuilder(builder: (context, setState) {
                return ColumnWithTextField(
                  text: StringManager.newPassword.tr(),
                  obscureText: isVisiblePassword,
                  hintText: StringManager.enterNewPassword.tr(),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        isVisiblePassword = !isVisiblePassword;
                      });
                    },
                    icon: Icon(
                      isVisiblePassword
                          ? Icons.visibility
                          : Icons.visibility_off_outlined,
                      color: AppColors.greyColor,
                      size: AppSize.defaultSize! * 2,
                    ),
                  ),
                );
              }),
              StatefulBuilder(builder: (context, setState) {
                return ColumnWithTextField(
                  text: StringManager.confirmPassword.tr(),
                  obscureText: isVisibleConfirmPassword,
                  hintText: StringManager.enterConfirmPassword.tr(),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        isVisibleConfirmPassword = !isVisibleConfirmPassword;
                      });
                    },
                    icon: Icon(
                      isVisibleConfirmPassword
                          ? Icons.visibility
                          : Icons.visibility_off_outlined,
                      color: AppColors.greyColor,
                      size: AppSize.defaultSize! * 2,
                    ),
                  ),
                );
              }),
              SizedBox(
                height: AppSize.screenHeight! * .2,
              ),
              Center(
                child: MainButton(
                  text: StringManager.next.tr(),
                  onTap: () {},
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
