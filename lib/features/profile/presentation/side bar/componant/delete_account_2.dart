import 'dart:math';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:leach/core/resource_manager/asset_path.dart';
import 'package:leach/core/resource_manager/routes.dart';
import 'package:leach/core/resource_manager/string_manager.dart';
import 'package:leach/core/utils/app_size.dart';
import 'package:leach/core/widgets/column_with_text_field.dart';
import 'package:leach/core/widgets/cutom_text.dart';
import 'package:leach/core/widgets/leading_icon.dart';
import 'package:leach/core/widgets/check_box.dart';
import 'package:leach/core/widgets/loading_widget.dart';
import 'package:leach/core/widgets/snack_bar.dart';
import 'package:leach/features/auth/presentation/controller/login_bloc/login_with_email_and_password_bloc.dart';
import 'package:leach/features/auth/presentation/controller/login_bloc/login_with_email_and_password_events.dart';
import 'package:leach/features/auth/presentation/controller/login_bloc/login_with_email_and_password_states.dart';

class DeleteAccount2 extends StatelessWidget {
  const DeleteAccount2({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginWithEmailAndPasswordBloc,
        LoginWithEmailAndPasswordState>(
      listener: (context, state) {
        if (state is DeleteAccountSuccessMessageState) {
          LoadingOverlay().hide();
          Navigator.pushNamedAndRemoveUntil(
              context, Routes.welcomePage, (route) => false);
        } else if (state is DeleteAccountLoadingState) {
          LoadingOverlay().show(context);
        } else if (state is DeleteAccountErrorMessageState) {
          LoadingOverlay().hide();
          errorSnackBar(context, state.errorMessage);
        }
      },
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppSize.defaultSize! * 2,
            vertical: AppSize.defaultSize! * 6,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const LeadingIcon(),
              SizedBox(height: AppSize.defaultSize! * 3),
              _buildTitleRow(),
              SizedBox(height: AppSize.defaultSize! * 0.4),
              _buildDivider(),
              SizedBox(height: AppSize.defaultSize! * 3),
              _buildConfirmationSection(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitleRow() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(AssetPath.x),
        SizedBox(width: AppSize.defaultSize! * 1.2),
        CustomText(
          text: StringManager.deleteAccount.tr(),
          fontSize: AppSize.defaultSize! * 2,
          maxLines: 1,
          textAlign: TextAlign.start,
        ),
        const Spacer(),
      ],
    );
  }

  Widget _buildDivider() {
    return Divider(
      color: Colors.black,
      height: 5,
      thickness: 0.6,
      indent: AppSize.defaultSize! * 2.2,
      endIndent: AppSize.defaultSize! * 2.8,
    );
  }

  Widget _buildConfirmationSection(BuildContext context) {
    return ColumnWithTextField(
      text: StringManager.areYouSure.tr(),
      child: Row(
        children: [
          Column(
            children: [
              SizedBox(height: AppSize.defaultSize! * 1.3),
              CircularCheckbox(
                text: StringManager.yes.tr(),
                onChanged: (value) {
                  if (value!) {
                    BlocProvider.of<LoginWithEmailAndPasswordBloc>(context)
                        .add(DeleteAccountEvent());
                  }
                },
              ),
              SizedBox(height: AppSize.defaultSize! * 1.3),
              CircularCheckbox(
                text: StringManager.no.tr(),
               onChanged:   (value) {
                 if (value!) {
                   Navigator.pushNamedAndRemoveUntil(
                       context, Routes.main, (route) => false);
                 }
               },
              ),
            ],
          ),
          Spacer(),
          Transform.rotate(
            angle: pi / 180 * 300,
            child: SvgPicture.asset(
              AssetPath.mayaExpression,
              width: AppSize.defaultSize! * 20,
            ),
          ),
        ],
      ),
    );
  }
}
