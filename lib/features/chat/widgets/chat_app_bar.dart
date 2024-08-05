import 'package:flutter/material.dart';
import 'package:leach/core/resource_manager/asset_path.dart';
import 'package:leach/core/resource_manager/colors.dart';
import 'package:leach/core/utils/app_size.dart';
import 'package:leach/core/widgets/cutom_text.dart';
import 'package:leach/core/widgets/leading_icon.dart';
class ChatAppBar extends StatelessWidget {
  const ChatAppBar({super.key, required this.text,   this.leadingIcon=true, this.image});
final String text ;
final String? image ;
final bool leadingIcon ;
  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        if(leadingIcon)
        const LeadingIcon(),
        const Spacer(),
        CustomText(text: text,
        fontSize: AppSize.defaultSize! * 3,

        ),
        const Spacer(),
        Image.asset(image??AssetPath.chat,color: AppColors.primaryColor,)
      ],
    );
  }
}
