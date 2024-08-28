import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:leach/core/resource_manager/routes.dart';
import 'package:leach/core/resource_manager/string_manager.dart';
import 'package:leach/core/utils/app_size.dart';
import 'package:leach/core/widgets/cutom_text.dart';
import 'package:leach/core/widgets/leading_icon.dart';
import 'package:leach/features/profile/domain/use_case/report_user_uc.dart';
import 'package:leach/features/profile/presentation/side%20bar/side_bar_row.dart';

class SpecificMessagesReport extends StatelessWidget {
  const SpecificMessagesReport({super.key, required this.userId});

  final String userId;

  @override
  Widget build(BuildContext context) {
    final divider = Divider(
      color: Colors.black,
      height: 5,
      thickness: 0.6,
      indent: AppSize.defaultSize! * 2.2,
      endIndent: AppSize.defaultSize! * 2.8,
    );

    return Scaffold(
      backgroundColor: const Color.fromRGBO(248, 255, 250, 1),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: AppSize.defaultSize! * 2,
                right: AppSize.defaultSize! * 2,
                top: AppSize.defaultSize! * 6,
              ),
              child: const LeadingIcon(),
            ),
            SizedBox(height: AppSize.defaultSize! * 3),
            Padding(
              padding: EdgeInsets.only(left: AppSize.defaultSize! * 3.2),
              child: CustomText(
                text: StringManager.selectaProblemToReport.tr(),
                fontSize: AppSize.defaultSize! * 2,
                maxLines: 1,
                textAlign: TextAlign.start,
              ),
            ),
            SizedBox(height: AppSize.defaultSize! * 0.4),
            divider,
            _buildReportItem(
                context, StringManager.nudityOrSexualActivity.tr(), divider),
            _buildReportItem(
                context, StringManager.hateSpeechOrSymbols.tr(), divider),
            _buildReportItem(context, StringManager.scamOrFraud.tr(), divider),
            _buildReportItem(
                context, StringManager.bullyingOrHarassment.tr(), divider),
            _buildReportItem(context, StringManager.spam.tr(), divider),
            _buildReportItem(
                context, StringManager.impersonation.tr(), divider),
            _buildReportItem(
                context, StringManager.hackedAccount.tr(), divider),
            SizedBox(height: AppSize.defaultSize! * 3),
          ],
        ),
      ),
    );
  }

  Widget _buildReportItem(BuildContext context, String text, Divider divider) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppSize.defaultSize! * 2),
      child: Column(
        children: [
          SideBarRow(
            text: text,
            onTap: () => Navigator.pushNamed(context, Routes.submitReport,
                arguments: ReportParameter(
                  type: text,
                  id: userId,
                )),
          ),
          SizedBox(height: AppSize.defaultSize! * 0.7),
          divider,
        ],
      ),
    );
  }
}
