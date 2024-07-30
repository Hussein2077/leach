import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:leach/core/resource_manager/asset_path.dart';
import 'package:leach/core/resource_manager/string_manager.dart';
import 'package:leach/core/utils/app_size.dart';
import 'package:leach/core/widgets/cutom_text.dart';

class SideBarRow extends StatelessWidget {

  final String image;
  final String text;

  const SideBarRow({super.key,

    required this.image,
    required this.text,
});

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(  left: AppSize.defaultSize! * 2.2,),
          child: Image.asset(image,),
        ),
        SizedBox(width: AppSize.defaultSize! * 1.2,),
        CustomText(
          text: text,
          fontSize: AppSize.defaultSize! * 2,

          maxLines: 1,
          textAlign: TextAlign.start,
        ),
        Spacer(),
        Padding(
          padding:  EdgeInsets.only(right:AppSize.defaultSize! * 2.5),
          child: Image.asset(AssetPath.rightArrow),
        ),
      ],
    );
  }
}