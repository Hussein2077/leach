import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:leach/core/resource_manager/asset_path.dart';
import 'package:leach/core/resource_manager/colors.dart';
import 'package:leach/core/resource_manager/routes.dart';
import 'package:leach/core/resource_manager/string_manager.dart';
import 'package:leach/core/utils/app_size.dart';
import 'package:leach/core/widgets/cutom_text.dart';
import 'package:leach/core/widgets/icon_with_matrial.dart';
import 'package:leach/core/widgets/large_botton.dart';
import 'package:leach/core/widgets/leading_icon.dart';
import 'package:leach/features/profile/presentation/widget/medals_abd_freinds.dart';
import 'package:leach/features/profile/presentation/widget/profile_app_bar.dart';
import 'package:leach/features/profile/presentation/widget/profile_user_row.dart';
import 'package:leach/features/profile/presentation/widget/side_bar_row.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Color.fromRGBO(248,255,250,1),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
   children: [
     Padding(

       padding: EdgeInsets.only(
         left: AppSize.defaultSize! * 2,
         right: AppSize.defaultSize! * 2,
         top: AppSize.defaultSize! * 6,
       ),
       child: LeadingIcon(),
     ),
     SizedBox(height:AppSize.defaultSize! * 3),
     Align(alignment: Alignment.center,child: Image.asset(AssetPath.whiteProfileIcon,scale: 1.1,)),





   ],



      ),





    );
  }
}
