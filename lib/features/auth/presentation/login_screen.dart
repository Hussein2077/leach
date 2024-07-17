import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:leach/core/resource_manager/colors.dart';
import 'package:leach/core/resource_manager/string_manager.dart';
import 'package:leach/core/utils/app_size.dart';
import 'package:leach/core/widgets/column_with_text_field.dart';
import 'package:leach/core/widgets/cutom_text.dart';
import 'package:leach/core/widgets/main_button.dart';
import 'package:leach/features/auth/presentation/widgets/leading_with_icon.dart';
import 'package:leach/features/auth/presentation/widgets/or_divider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController passwordController;

  @override
  void initState() {
    passwordController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    passwordController.dispose();

    super.dispose();
  }

  bool isVisible = true;

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
                text: StringManager.login.tr(),
                fontSize: AppSize.defaultSize! * 4,
                fontWeight: FontWeight.w700,
              ),
              CustomText(
                text: StringManager.loginToContinue.tr(),
                fontSize: AppSize.defaultSize! * 1.5,
                color: AppColors.greyColor,
              ),
              ColumnWithTextField(
                text: StringManager.emailOrPhoneNumber.tr(),
                hintText: StringManager.enterEmailOrPhoneNumber.tr(),
              ),
              StatefulBuilder(builder: (context, setState) {
                return ColumnWithTextField(
                  text: StringManager.password.tr(),
                  obscureText: isVisible,
                  hintText: StringManager.enterPassword.tr(),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        isVisible = !isVisible;
                      });
                    },
                    icon: Icon(
                      isVisible
                          ? Icons.visibility
                          : Icons.visibility_off_outlined,
                      color: AppColors.greyColor,
                      size: AppSize.defaultSize! * 2,
                    ),
                  ),
                );
              }),
              SizedBox(height: AppSize.defaultSize! * 1),
              Align(
                alignment: Alignment.centerRight,
                child: InkWell (
                  onTap: () {},
                  child: CustomText(
                    text: StringManager.forgotPassword.tr(),
                    fontSize: AppSize.defaultSize! * 1.5,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
              SizedBox(height: AppSize.defaultSize! * 3),
              MainButton(
                text: StringManager.login.tr(),
                onTap: () {},
                textColor: Colors.white,
              ),
              SizedBox(height: AppSize.defaultSize! * 3),
               const OrAndDivider(),

            ],
          ),
        ),
      ),
    );
  }
}
