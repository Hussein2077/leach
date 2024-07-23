import 'package:flutter/material.dart';
import 'package:leach/core/resource_manager/asset_path.dart';
import 'package:leach/core/utils/app_size.dart';
import 'package:leach/core/widgets/leading_icon.dart';
class LeadingWithIcon extends StatelessWidget {
  const LeadingWithIcon({super.key, this.color, this.withIcon = true, this.image });
  final Color? color;
  final bool withIcon;
  final String? image;
  @override
  Widget build(BuildContext context) {
    return   Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
          LeadingIcon(color: color,),
        // if (withIcon)
        const Spacer(
          flex: 10,
        ),
        if (withIcon)
        Padding(
          padding:   EdgeInsets.only(top: AppSize.defaultSize! * 2),
          child: Image.asset(image??AssetPath.authIcon),
        ),  if (withIcon)
        const Spacer(
          flex: 12,
        ),
      ],
    );
  }
}
