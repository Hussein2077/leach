import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:leach/core/resource_manager/colors.dart';
import 'package:leach/core/resource_manager/routes.dart';
import 'package:leach/core/resource_manager/string_manager.dart';
import 'package:leach/core/utils/app_size.dart';
import 'package:leach/core/widgets/column_with_text_field.dart';
import 'package:leach/core/widgets/cutom_text.dart';
import 'package:leach/core/widgets/main_button.dart';
import 'package:leach/features/auth/presentation/widgets/country_drop_down.dart';
import 'package:leach/features/auth/presentation/widgets/leading_with_icon.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isVisiblePassword = false;
  bool isVisibleConfirmPassword = false;

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
              const LeadingWithIcon(),
              CustomText(
                text: StringManager.register.tr(),
                fontSize: AppSize.defaultSize! * 4,
                fontWeight: FontWeight.w700,
              ),
              CustomText(
                text: StringManager.enterPersonalInformation.tr(),
                fontSize: AppSize.defaultSize! * 1.5,
                color: AppColors.greyColor,
              ),
              ColumnWithTextField(
                text: StringManager.username.tr(),
                hintText: StringManager.enterUsername.tr(),
              ),
              ColumnWithTextField(
                text: StringManager.email.tr(),
                hintText: StringManager.enterEmail.tr(),
              ),
              ColumnWithTextField(
                text: StringManager.phoneNumber.tr(),
                hintText: StringManager.enterPhone.tr(),
              ),
              StatefulBuilder(builder: (context, setState) {
                return ColumnWithTextField(
                  text: StringManager.password.tr(),
                  obscureText: isVisiblePassword,
                  hintText: StringManager.enterPassword.tr(),
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
              ColumnWithTextField(
                text: StringManager.country.tr(),
                child: const CountryDropDown(),
              ),
              ColumnWithTextField(
                text: StringManager.city.tr(),
                child: CountryDropDown(text: StringManager.selectYourCity .tr() ,),
              ),
              SizedBox(height: AppSize.defaultSize! * 3),
              Center(
                child: MainButton(
                  text: StringManager.register.tr(),
                  onTap: () {
                    Navigator.pushNamed(context, Routes.addPetScreen);
                  },
                  textColor: Colors.white,
                ),
              ),
              SizedBox(height: AppSize.defaultSize! * 3),
            ],
          ),
        ),
      ),
    );
  }
}
