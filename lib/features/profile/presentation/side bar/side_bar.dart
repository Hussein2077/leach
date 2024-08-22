import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:leach/core/resource_manager/asset_path.dart';
import 'package:leach/core/resource_manager/routes.dart';
import 'package:leach/core/resource_manager/string_manager.dart';
import 'package:leach/core/service/navigator_services.dart';
import 'package:leach/core/service/service_locator.dart';
import 'package:leach/core/utils/app_size.dart';
import 'package:leach/core/utils/methods.dart';
import 'package:leach/core/widgets/leading_icon.dart';
import 'package:leach/features/profile/presentation/side%20bar/side_bar_row.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SideBar extends StatelessWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    final defaultSize = AppSize.defaultSize!;

    Widget buildDivider() => Divider(
          color: Colors.black,
          height: 5,
          thickness: 0.6,
          indent: defaultSize * 2.2,
          endIndent: defaultSize * 2.8,
        );

    Widget buildSideBarRow(
        {required String image,
        required String text,
        required Function() onTap}) {
      return Column(
        children: [
          SideBarRow(
            image: image,
            text: text,
            onTap: onTap,
          ),
          SizedBox(height: defaultSize * 0.7),
          buildDivider(),
          SizedBox(height: defaultSize * 3),
        ],
      );
    }

    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: defaultSize * 2)
                  .copyWith(top: defaultSize * 6),
              child: const LeadingIcon(),
            ),
            SizedBox(height: defaultSize * 3),
            buildSideBarRow(
              image: AssetPath.editProfileIcon,
              text: StringManager.editProfile.tr(),
              onTap: () {
                Navigator.pushNamed(context, Routes.myPetProfile);
              },
            ),
            buildSideBarRow(
              image: AssetPath.resetPasswordIcon,
              text: StringManager.resetPassword.tr(),
              onTap: () {
                Navigator.pushNamed(context, Routes.resetPasswordFromProfile);
              },
            ),
            buildSideBarRow(
              image: AssetPath.profilePrivacy,
              text: StringManager.accountPrivacy.tr(),
              onTap: () {
                Navigator.pushNamed(context, Routes.accountPrivacy);
              },
            ),
            // buildSideBarRow(
            //   image: AssetPath.bellPlus,
            //   text: StringManager.subscriptionPlan.tr(),
            //   onTap: () {},
            // ),
            buildSideBarRow(
              image: AssetPath.smallCalendar,
              text: StringManager.bookingHistory.tr(),
              onTap: () => Navigator.pushNamed(context, Routes.bookingHistory),
            ),
            // buildSideBarRow(
            //   image: AssetPath.message,
            //   text: StringManager.activity.tr(),
            //   onTap: () {
            //     Navigator.pushNamed(context, Routes.activityAndHistory);
            //   },
            // ),
            // buildSideBarRow(
            //   image: AssetPath.bell,
            //   text: StringManager.notificationSettings.tr(),
            //   onTap: () {},
            // ),
            buildSideBarRow(
              image: AssetPath.signOut,
              text: StringManager.signOut.tr(),
              onTap: () async {
                //show alert dialog
                Methods.instance.showAlertDialog(
                  context,
                  title: 'Are you sure you want to sign out?',
                  onPressed: () async {
                    await Methods.instance.saveUserToken(authToken: null);
                    final prefs = await SharedPreferences.getInstance();
                    await prefs.clear();
                    Navigator.of(getIt<NavigationService>()
                            .navigatorKey
                            .currentContext!)
                        .pushNamedAndRemoveUntil(Routes.welcomePage,
                            (Route<dynamic> route) => false);
                  },
                );
              },
            ),
            buildSideBarRow(
              image: AssetPath.x,
              text: StringManager.deleteAccount.tr(),
              onTap: () {
                Navigator.pushNamed(context, Routes.deleteAccount);
              },
            ),
          ],
        ),
      ),
    );
  }
}
