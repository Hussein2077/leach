import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:leach/core/resource_manager/asset_path.dart';
import 'package:leach/core/resource_manager/colors.dart';
import 'package:leach/core/resource_manager/routes.dart';
import 'package:leach/core/resource_manager/string_manager.dart';
import 'package:leach/core/utils/app_size.dart';
import 'package:leach/core/utils/methods.dart';
import 'package:leach/core/widgets/column_with_text_field.dart';
import 'package:leach/core/widgets/cutom_text.dart';
import 'package:leach/core/widgets/icon_with_matrial.dart';
import 'package:leach/core/widgets/large_botton.dart';
import 'package:leach/core/widgets/leading_icon.dart';
import 'package:leach/core/widgets/main_button.dart';
import 'package:leach/features/auth/presentation/widgets/leading_with_icon.dart';
import 'package:leach/features/profile/presentation/widget/medals_abd_freinds.dart';
import 'package:leach/features/profile/presentation/widget/profile_app_bar.dart';
import 'package:leach/features/profile/presentation/widget/profile_user_row.dart';
import 'package:leach/features/profile/presentation/widget/side_bar_row.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: Methods.instance.paddingCustom,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
        
            children: [
              SizedBox(height: AppSize.defaultSize! * 2,width: AppSize.defaultSize! * 2,),
        
              LeadingWithIcon(image: AssetPath.whiteProfileIcon,)
             ,
              Padding(
                padding:  EdgeInsets.only(right: AppSize.defaultSize! * 2.5,),
                child: Center(
                  child: CustomText(
                    text: StringManager.changePicture.tr(),
                    fontSize: AppSize.defaultSize! * 2,
                  ),
                ),
              ),
              SizedBox(height: AppSize.defaultSize! * 2,),
              CustomText(
                fontFamily: 'Gully-CD',
                text:
                StringManager.enterInformation.tr(),
                fontSize: AppSize.defaultSize!   * 1.5,
                color: Color.fromRGBO(112, 112, 112, 1),
        
              ),
        
              ColumnWithTextField(text: StringManager.name.tr(),
              hintText: StringManager.enterYourName.tr(),
              rightText: StringManager.optional.tr(),),
        
              ColumnWithTextField(text: StringManager.userName.tr(),
                hintText: StringManager.enterUserName.tr(),
                rightText: StringManager.optional.tr(),),
        
              ColumnWithTextField(text: StringManager.editBio.tr(),
                hintText: StringManager.enterNewBio.tr(),
                rightText: StringManager.optional.tr(),),
              SizedBox(height: AppSize.defaultSize! * 2,),
              MainButton(text: StringManager.save.tr(), color: Color.fromRGBO(68, 82, 255, 1), textColor: Colors.white, onTap: (){}),
        
        
            ],
        
        
        
          ),
        ),
      ),





    );
  }
}
