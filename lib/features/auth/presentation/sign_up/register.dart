import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leach/core/resource_manager/colors.dart';
import 'package:leach/core/resource_manager/routes.dart';
import 'package:leach/core/resource_manager/string_manager.dart';
import 'package:leach/core/utils/app_size.dart';
import 'package:leach/core/widgets/column_with_text_field.dart';
import 'package:leach/core/widgets/cutom_text.dart';
import 'package:leach/core/widgets/loading_widget.dart';
import 'package:leach/core/widgets/main_button.dart';
import 'package:leach/core/widgets/snack_bar.dart';
import 'package:leach/features/auth/presentation/controller/sign_up_bloc/sign_up_with_email_and_password_bloc.dart';
import 'package:leach/features/auth/presentation/controller/sign_up_bloc/sign_up_with_email_and_password_events.dart';
import 'package:leach/features/auth/presentation/controller/sign_up_bloc/sign_up_with_email_and_password_states.dart';
import 'package:leach/features/auth/presentation/sign_up/validator.dart';
import 'package:leach/features/auth/presentation/widgets/country_drop_down.dart';
import 'package:leach/features/auth/presentation/widgets/leading_with_icon.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isVisiblePassword = true;
  bool isVisibleConfirmPassword = true;

  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  late TextEditingController nameController;
  late TextEditingController usernameController;

  late TextEditingController phoneController;
  String? area;
  String? city;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    nameController = TextEditingController();
    usernameController = TextEditingController();
    phoneController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    nameController.dispose();
    usernameController.dispose();
    phoneController.dispose();
    LoadingOverlay().hide();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpWithEmailAndPasswordBloc,
        SignUpWithEmailAndPasswordState>(
      listener: (context, state) {
        if (state is SignUpWithEmailAndPasswordSuccessMessageState) {
          LoadingOverlay().hide();
          Navigator.pushNamedAndRemoveUntil(
            context,
            Routes.addPetScreen,
            arguments: false,
            (route) => false,
          );
        } else if (state is SignUpWithEmailAndPasswordErrorMessageState) {
          LoadingOverlay().hide();
          errorSnackBar(context, state.errorMessage);
        } else if (state is SignUpWithEmailAndPasswordLoadingState) {
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
                  text: StringManager.name.tr(),
                  hintText: StringManager.name.tr(),
                  controller: nameController,
                ),
                ColumnWithTextField(
                  text: StringManager.username.tr(),
                  hintText: StringManager.enterUsername.tr(),
                  controller: usernameController,
                ),
                ColumnWithTextField(
                  text: StringManager.email.tr(),
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  hintText: StringManager.enterEmail.tr(),
                ),
                ColumnWithTextField(
                  text: StringManager.phoneNumber.tr(),
                  keyboardType: TextInputType.phone,
                  hintText: StringManager.enterPhone.tr(),
                  controller: phoneController,
                ),
                StatefulBuilder(builder: (context, setState) {
                  return ColumnWithTextField(
                    text: StringManager.password.tr(),
                    controller: passwordController,
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
                    controller: confirmPasswordController,
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
                StatefulBuilder(builder: (context, setState) {
                  return ColumnWithTextField(
                    text: StringManager.city.tr(),
                    child: CountryDropDown(
                      countryOrCity: StringManager.citiesInEgypt,
                      onChanged: (String? value) {
                        setState(() {
                          city = value;
                        });
                      },
                      hint: StringManager.selectYourCity.tr(),
                    ),
                  );
                }),
                StatefulBuilder(builder: (context, setState) {
                  return ColumnWithTextField(
                    text: StringManager.area.tr(),
                    child: CountryDropDown(
                      countryOrCity: const ['6 Of October'],
                      onChanged: (String? value) {
                        setState(() {
                          area = value;
                        });
                      },
                    ),
                  );
                }),
                SizedBox(height: AppSize.defaultSize! * 3),
                Center(
                  child: MainButton(
                    text: StringManager.register.tr(),
                    onTap: () {
                      final errorMessage = validateSignUpForm(
                        name: nameController.text,
                        userName: usernameController.text,
                        email: emailController.text,
                        phone: phoneController.text,
                        password: passwordController.text,
                        confirmPassword: confirmPasswordController.text,
                        country: area ?? "",
                        city: city ?? "",
                      );

                      if (errorMessage != null) {
                        errorSnackBar(context, errorMessage);
                      } else {
                        BlocProvider.of<SignUpWithEmailAndPasswordBloc>(context)
                            .add(
                          SignUpWithEmailAndPasswordEvent(
                            name: nameController.text,
                            userName: usernameController.text,
                            email: emailController.text,
                            phone: phoneController.text,
                            password: passwordController.text,
                            country: area ?? "",
                            city: city ?? "",
                          ),
                        );
                      }
                    },
                    textColor: Colors.white,
                  ),
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
