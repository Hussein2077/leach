import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leach/core/resource_manager/asset_path.dart';
import 'package:leach/core/resource_manager/colors.dart';
import 'package:leach/core/resource_manager/routes.dart';
import 'package:leach/core/resource_manager/string_manager.dart';
import 'package:leach/core/utils/app_size.dart';
import 'package:leach/core/widgets/column_with_text_field.dart';
import 'package:leach/core/widgets/cutom_text.dart';
import 'package:leach/core/widgets/loading_widget.dart';
import 'package:leach/core/widgets/main_button.dart';
import 'package:leach/core/widgets/snack_bar.dart';
import 'package:leach/features/auth/presentation/controller/login_bloc/login_with_email_and_password_bloc.dart';
import 'package:leach/features/auth/presentation/controller/login_bloc/login_with_email_and_password_events.dart';
import 'package:leach/features/auth/presentation/controller/login_bloc/login_with_email_and_password_states.dart';
import 'package:leach/features/auth/presentation/widgets/leading_with_icon.dart';
import 'package:leach/features/auth/presentation/widgets/or_divider.dart';
import 'package:leach/features/auth/presentation/widgets/social_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController passwordController;
  late TextEditingController phoneOrEmailController;

  @override
  void initState() {
    passwordController = TextEditingController();
    phoneOrEmailController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    passwordController.dispose();
    phoneOrEmailController.dispose();
    LoadingOverlay().hide();
    super.dispose();
  }

  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginWithEmailAndPasswordBloc,
        LoginWithEmailAndPasswordState>(
      listener: (context, state) {
        if (state is LoginWithEmailAndPasswordSuccessMessageState) {
          LoadingOverlay().hide();
          Navigator.pushNamedAndRemoveUntil(
            context,
            Routes.main,
            (route) => false,
          );
        } else if (state is LoginWithEmailAndPasswordErrorMessageState) {
          LoadingOverlay().hide();
          errorSnackBar(context, state.errorMessage);
        } else if (state is LoginWithEmailAndPasswordLoadingState) {
          LoadingOverlay().show(context);
        }
      },
      child: Scaffold(
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
                  fontSize: AppSize.defaultSize! * 1.8,
                  color: AppColors.greyColor,
                ),
                ColumnWithTextField(
                  text: StringManager.emailOrPhoneNumber.tr(),
                  hintText: StringManager.enterEmailOrPhoneNumber.tr(),
                  controller: phoneOrEmailController,
                ),
                StatefulBuilder(builder: (context, setState) {
                  return ColumnWithTextField(
                    text: StringManager.password.tr(),
                    obscureText: isVisible,
                    controller: passwordController,
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
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, Routes.forgotPasswordScreen);
                    },
                    child: CustomText(
                      text: StringManager.forgotPassword.tr(),
                      fontSize: AppSize.defaultSize! * 1.8,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
                SizedBox(height: AppSize.defaultSize! * 3),
                Center(
                  child: MainButton(
                    text: StringManager.login.tr(),
                    onTap: () {
                      if (passwordController.text.isEmpty ||
                          phoneOrEmailController.text.isEmpty) {
                        errorSnackBar(context,
                            StringManager.enterEmailOrPhoneNumber.tr());
                      } else if (passwordController.text.length < 6) {
                        errorSnackBar(context,
                            'Password must be at least 6 characters long');
                      } else {
                        BlocProvider.of<LoginWithEmailAndPasswordBloc>(context)
                            .add(LoginWithEmailAndPasswordEvent(
                          phoneOrEmail: phoneOrEmailController.text,
                          password: passwordController.text,
                        ));
                      }
                    },
                    textColor: Colors.white,
                  ),
                ),
                SizedBox(height: AppSize.defaultSize! * 3),
                const OrAndDivider(),
                SizedBox(height: AppSize.defaultSize! * 1.5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomElevatedButton(
                      assetPath: AssetPath.google,
                      onPressed: () {},
                    ),
                    CustomElevatedButton(
                      assetPath: AssetPath.apple,
                      onPressed: () {},
                    ),
                  ],
                ),
                SizedBox(height: AppSize.defaultSize! * 3),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
