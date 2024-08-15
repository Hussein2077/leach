import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:leach/core/resource_manager/asset_path.dart';
import 'package:leach/core/resource_manager/routes.dart';
import 'package:leach/core/resource_manager/string_manager.dart';
import 'package:leach/core/utils/app_size.dart';
import 'package:leach/core/widgets/cutom_text.dart';
import 'package:leach/core/widgets/leading_icon.dart';
class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({super.key,   this.child});
final Widget? child;
  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        const LeadingIcon(
          color: Colors.white,
        ),
        const Spacer(),
        child??
        IconButton(
            onPressed: () {
              Navigator.pushNamed(context, Routes.notification);
            },
            icon: Icon(
              Icons.notifications,
              size: AppSize.defaultSize! * 3.5,
              color: Colors.white,
            )),
        IconButton(
            onPressed: () {
              Navigator.pushNamed(context, Routes.sidebar);
            },
            icon: Image.asset(
              AssetPath.menu,
              width: AppSize.defaultSize! * 3.5,
              height: AppSize.defaultSize! * 3.5,
            )),
      ],
    );
  }
}
