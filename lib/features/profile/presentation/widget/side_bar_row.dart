import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:leach/core/resource_manager/asset_path.dart';
import 'package:leach/core/resource_manager/routes.dart';
import 'package:leach/core/resource_manager/string_manager.dart';
import 'package:leach/core/utils/app_size.dart';
import 'package:leach/core/widgets/cutom_text.dart';

class SideBarRow extends StatelessWidget {

  final String? image;
  final String text;
  final Color? color;

final void Function()? onTap;
  const SideBarRow({super.key,

     this.image,
    required this.text,
    this.color,
    this.onTap
});

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap:onTap ,

      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if(image!=null)



          Padding(
            padding: EdgeInsets.only(  left: AppSize.defaultSize! * 2.2,),
            child: Image.asset(image!,),
          ),
          SizedBox(width: AppSize.defaultSize! * 1.2,),
          if(image==null)
          Padding(
            padding: EdgeInsets.only(  left: AppSize.defaultSize! * 2.2,),
            child: CustomText(
              text: text,
              fontSize: AppSize.defaultSize! * 2,
              color: color,

              maxLines: 1,
              textAlign: TextAlign.start,
            ),
          ),
          if(image!=null)
          CustomText(
            text: text,
            fontSize: AppSize.defaultSize! * 2,
            color: color,
            maxLines: 1,
            textAlign: TextAlign.start,
          ),
          Spacer(),
          Padding(
            padding:  EdgeInsets.only(right:AppSize.defaultSize! * 2.5),
            child: Image.asset(AssetPath.rightArrow),
          ),


        ],
      ),
    );
  }
}