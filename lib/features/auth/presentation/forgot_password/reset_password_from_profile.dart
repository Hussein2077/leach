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
import 'package:leach/features/auth/presentation/controller/change_password_bloc/change_password_bloc.dart';
import 'package:leach/features/auth/presentation/controller/change_password_bloc/change_password_events.dart';
import 'package:leach/features/auth/presentation/controller/change_password_bloc/change_password_states.dart';
import 'package:leach/features/auth/presentation/widgets/leading_with_icon.dart';

class ResetPasswordScreenFromProfile extends StatefulWidget {
  const ResetPasswordScreenFromProfile({super.key});

  @override
  State<ResetPasswordScreenFromProfile> createState() =>
      _ResetPasswordScreenFromProfileState();
}

class _ResetPasswordScreenFromProfileState
    extends State<ResetPasswordScreenFromProfile> {
  bool isVisiblePassword = true;
  bool isVisibleConfirmPassword = true;
  bool isVisibleOldPassword = true;

  late TextEditingController oldPasswordController;
  late TextEditingController newPasswordController;
  late TextEditingController confirmPasswordController;

  @override
  void initState() {
    oldPasswordController = TextEditingController();
    newPasswordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    oldPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    LoadingOverlay().hide();
    super.dispose();
  }

  bool validateInputs() {
    if (oldPasswordController.text.isEmpty ||
        newPasswordController.text.isEmpty ||
        confirmPasswordController.text.isEmpty) {
      return false;
    }
    if (newPasswordController.text != confirmPasswordController.text) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ChangePasswordFlowBloc, ChangePasswordState>(
      listener: (context, state) {
        if (state is ChangePasswordSuccessState) {
          LoadingOverlay().hide();

          Navigator.of(context).pushNamedAndRemoveUntil(
            Routes.main,
            (route) => false,
          );
          successSnackBar(context, state.successMessage);
        } else if (state is ChangePasswordErrorState) {
          LoadingOverlay().hide();
          errorSnackBar(context, state.errorMessage);
        } else if (state is ChangePasswordLoadingState) {
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
                  text: StringManager.resetPassword.tr(),
                  fontSize: AppSize.defaultSize! * 4,
                  fontWeight: FontWeight.w700,
                ),
                CustomText(
                  text: StringManager.enterYourInformation.tr(),
                  fontSize: AppSize.defaultSize! * 1.5,
                  color: AppColors.greyColor,
                ),
                SizedBox(height: AppSize.defaultSize! * 2),
                ColumnWithTextField(
                  text: StringManager.oldPassword.tr(),
                  obscureText: isVisibleOldPassword,
                  controller: oldPasswordController,
                  hintText: StringManager.enterOldPassword.tr(),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        isVisibleOldPassword = !isVisibleOldPassword;
                      });
                    },
                    icon: Icon(
                      isVisibleOldPassword
                          ? Icons.visibility
                          : Icons.visibility_off_outlined,
                      color: AppColors.greyColor,
                      size: AppSize.defaultSize! * 2,
                    ),
                  ),
                ),
                SizedBox(height: AppSize.defaultSize! * 1),
                Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, Routes.forgotPasswordScreen);
                    },
                    child: CustomText(
                      text: StringManager.forgotPassword.tr(),
                      fontSize: AppSize.defaultSize! * 1.5,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
                SizedBox(height: AppSize.defaultSize! * 1),
                ColumnWithTextField(
                  text: StringManager.newPassword.tr(),
                  obscureText: isVisiblePassword,
                  hintText: StringManager.enterNewPassword.tr(),
                  controller: newPasswordController,
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
                ),
                SizedBox(height: AppSize.defaultSize! * 1),
                ColumnWithTextField(
                  text: StringManager.confirmPassword.tr(),
                  obscureText: isVisibleConfirmPassword,
                  controller: confirmPasswordController,
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
                ),
                SizedBox(height: AppSize.defaultSize! * 3),
                Center(
                  child: MainButton(
                    text: StringManager.next.tr(),
                    onTap: () {
                      FocusScope.of(context).unfocus();

                      if (validateInputs()) {
                        BlocProvider.of<ChangePasswordFlowBloc>(context)
                            .add(ChangePasswordEvent(
                          oldPassword: oldPasswordController.text,
                          password: newPasswordController.text,
                        ));
                      } else {
                        errorSnackBar(context, 'Please fill all the fields');
                      }
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
      ),
    );
  }
}
