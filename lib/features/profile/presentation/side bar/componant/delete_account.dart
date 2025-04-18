import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:leach/core/resource_manager/asset_path.dart';
import 'package:leach/core/resource_manager/routes.dart';
import 'package:leach/core/resource_manager/string_manager.dart';
import 'package:leach/core/utils/app_size.dart';
import 'package:leach/core/widgets/cutom_text.dart';
import 'package:leach/core/widgets/leading_icon.dart';
import 'package:leach/core/widgets/main_button.dart';

class DeleteAccount extends StatelessWidget {
  const DeleteAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            _buildHeader(),
            SizedBox(height: AppSize.defaultSize! * 0.4),
            _buildDivider(),
            SizedBox(height: AppSize.defaultSize! * 3),
            _buildImageStack(),
            // const Spacer(),
            SizedBox(height: AppSize.defaultSize! * 10),
            _buildDeleteButton(context),
            SizedBox(height: AppSize.defaultSize! * 3),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(left: AppSize.defaultSize! * 2.2),
          child: Image.asset(AssetPath.x),
        ),
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

  Widget _buildImageStack() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(width: AppSize.defaultSize!*8 ),

        Expanded(
          child: Stack(
            children:[SvgPicture.asset(
                AssetPath.myaFull,
                width: AppSize.screenWidth! * .8
              // height: AppSize.screenHeight! * .35,
            ),
              Padding(
                padding:  EdgeInsets.only(top: AppSize.defaultSize! * 19,left: AppSize.defaultSize!*0.5),
                child: Container(
                  width: AppSize.defaultSize! * 19,
                  child: CustomText(text: StringManager.deleteAccountText.tr(),
                    maxLines: 3,
                    fontSize: AppSize.defaultSize! * 1.3,
                    color: Colors.white,


                  ),
                ),
              ),



            ]
          ),
        ),
      ],
    );
  }

  Widget _buildDeleteButton(BuildContext context) {
    return Center(
      child: MainButton(
        text: StringManager.deleteAccount.tr(),
        color: const Color.fromRGBO(68, 82, 255, 1),
        textColor: Colors.white,
        onTap: () {
          Navigator.pushNamed(context, Routes.deleteAccount2);
        },
      ),
    );
  }
}
