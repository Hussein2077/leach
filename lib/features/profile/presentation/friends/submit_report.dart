import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leach/core/resource_manager/asset_path.dart';
import 'package:leach/core/resource_manager/routes.dart';
import 'package:leach/core/resource_manager/string_manager.dart';
import 'package:leach/core/utils/app_size.dart';
import 'package:leach/core/widgets/cutom_text.dart';
import 'package:leach/core/widgets/leading_icon.dart';
import 'package:leach/core/widgets/loading_widget.dart';
import 'package:leach/core/widgets/main_button.dart';
import 'package:leach/core/widgets/snack_bar.dart';
import 'package:leach/features/profile/domain/use_case/report_user_uc.dart';
import 'package:leach/features/profile/presentation/controller/report_user/bloc.dart';
import 'package:leach/features/profile/presentation/controller/report_user/event.dart';
import 'package:leach/features/profile/presentation/controller/report_user/state.dart';

class SubmitReport extends StatefulWidget {
  final ReportParameter message;

  const SubmitReport({super.key, required this.message});

  @override
  State<SubmitReport> createState() => _SubmitReportState();
}

class _SubmitReportState extends State<SubmitReport> {
  @override
  void dispose() {
    LoadingOverlay () .hide();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return BlocListener<ReportUserBloc, ReportUserState>(
      listener: (context, state) {
        if (state is ReportUserErrorMessageState) {
            LoadingOverlay () .hide();
            errorSnackBar(context, state.errorMessage);
        }
        if (state is ReportUserSuccessMessageState) {
          LoadingOverlay () .hide();
          Navigator.pushNamed(context, Routes.reportView);
        }
        if (state is ReportUserLoadingState) {
          LoadingOverlay () .show(context);
        }
      },
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(248, 255, 250, 1),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(context),
              _buildReportText(),
              _buildDivider(),
              _buildImageContainer(),
              SizedBox(height: AppSize.defaultSize! * 18),
              _buildSubmitButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppSize.defaultSize! * 2,
        vertical: AppSize.defaultSize! * 6,
      ),
      child: const LeadingIcon(),
    );
  }

  Widget _buildReportText() {
    return Padding(
      padding: EdgeInsets.only(left: AppSize.defaultSize! * 3.2),
      child: CustomText(
        text: StringManager.submitYourReport.tr(),
        fontSize: AppSize.defaultSize! * 2,
        maxLines: 2,
        textAlign: TextAlign.start,
      ),
    );
  }

  Widget _buildDivider() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppSize.defaultSize! * 0.4),
      child: Divider(
        color: Colors.black,
        height: 5,
        thickness: 0.6,
        indent: AppSize.defaultSize! * 2.2,
        endIndent: AppSize.defaultSize! * 2.8,
      ),
    );
  }

  Widget _buildImageContainer() {
    return Center(
      child: Container(
        width: AppSize.defaultSize! * 40,
        height: AppSize.defaultSize! * 40,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AssetPath.submitContainer),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(top: AppSize.defaultSize! * 18),
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
    );
  }

  Widget _buildSubmitButton(BuildContext context) {
    return Center(
      child: MainButton(
        text: StringManager.submitReport.tr(),
        color: const Color.fromRGBO(68, 82, 255, 1),
        textColor: Colors.white,
        onTap: () {
          BlocProvider.of<ReportUserBloc>(context)
              .add(ReportUserEvent(ReportParameter(
            id: widget.message.id,
            type: widget.message.type,
          )));
        },
      ),
    );
  }
}
