import 'package:flutter/material.dart';
import 'package:leach/core/resource_manager/asset_path.dart';
import 'package:leach/core/utils/app_size.dart';
import 'package:leach/core/widgets/leading_icon.dart';
class LeadingWithIcon extends StatelessWidget {
  const LeadingWithIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return   Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const LeadingIcon(),
        const Spacer(
          flex: 10,
        ),
        Padding(
          padding:   EdgeInsets.only(top: AppSize.defaultSize! * 2),
          child: Image.asset(AssetPath.authIcon),
        ),
        const Spacer(
          flex: 12,
        ),
      ],
    );
  }
}
