import 'package:flutter/material.dart';
import 'package:leach/core/resource_manager/asset_path.dart';
import 'package:leach/core/resource_manager/colors.dart';
import 'package:leach/core/resource_manager/string_manager.dart';
import 'package:leach/core/utils/app_size.dart';
import 'package:leach/core/widgets/custom_text_field.dart';
import 'package:leach/core/widgets/cutom_text.dart';
import 'package:leach/core/widgets/icon_with_matrial.dart';

class TextImageRow extends StatelessWidget {
  const TextImageRow({super.key,required this.image,required this.text});
  final String image  ;
  final String text  ;


  @override
  Widget build(BuildContext context) {
    return Row(
mainAxisAlignment: MainAxisAlignment.start,

      children: [

        SizedBox(width: AppSize.defaultSize!*2,),
        IconWithMaterial(imagePath: image),
        SizedBox(width: AppSize.defaultSize!*1.3,),
        SizedBox(
          width: AppSize.screenWidth! * .7,
          child: CustomText(
            text: text,
            fontSize: AppSize.defaultSize! *2,
            maxLines: 2,textAlign: TextAlign.start,
          ),
        ),

      ],
    );
  }
}
