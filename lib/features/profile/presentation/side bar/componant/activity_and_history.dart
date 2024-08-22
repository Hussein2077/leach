import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:leach/core/resource_manager/asset_path.dart';
import 'package:leach/core/resource_manager/routes.dart';
import 'package:leach/core/resource_manager/string_manager.dart';
import 'package:leach/core/utils/app_size.dart';
import 'package:leach/core/widgets/cutom_text.dart';
import 'package:leach/core/widgets/leading_icon.dart';
import 'package:leach/features/profile/presentation/side%20bar/side_bar_row.dart';

class ActivityAndHistory extends StatelessWidget {
  const ActivityAndHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: AppSize.defaultSize! * 2.2),
                  child: Image.asset(AssetPath.message),
                ),
                SizedBox(width: AppSize.defaultSize! * 1.2),
                CustomText(
                  text: StringManager.activityAndHistory.tr(),
                  fontSize: AppSize.defaultSize! * 2,
                  maxLines: 1,
                  textAlign: TextAlign.start,
                ),
                const Spacer(),
              ],
            ),
            SizedBox(height: AppSize.defaultSize! * 0.4),
            _buildDivider(),
            SizedBox(height: AppSize.defaultSize! * 3),
            SideBarRow(
              image: AssetPath.like,
              text: StringManager.likes.tr(),
              // onTap: () => Navigator.pushNamed(context, Routes.accountPrivacy),
            ),
            _buildDividerWithSpacing(),
            SideBarRow(
              image: AssetPath.matches,
              text: StringManager.matches.tr(),
              // onTap: () => Navigator.pushNamed(context, Routes.accountPrivacy),
            ),
            _buildDividerWithSpacing(),
            SideBarRow(
              image: AssetPath.timeIcon,
              text: StringManager.timeSpent.tr(),
              // onTap: () => Navigator.pushNamed(context, Routes.accountPrivacy),
            ),
            _buildDividerWithSpacing(),
            SideBarRow(
              image: AssetPath.smallCalendar,
              text: StringManager.bookingHistory.tr(),
              onTap: () => Navigator.pushNamed(context, Routes.bookingHistory),
            ),
            _buildDividerWithSpacing(),
          ],
        ),
      ),
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

  Widget _buildDividerWithSpacing() {
    return Column(
      children: [
        SizedBox(height: AppSize.defaultSize! * 0.7),
        _buildDivider(),
        SizedBox(height: AppSize.defaultSize! * 3),
      ],
    );
  }


}
