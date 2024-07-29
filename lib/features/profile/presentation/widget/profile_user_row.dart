import 'package:flutter/material.dart';
import 'package:leach/core/resource_manager/asset_path.dart';
import 'package:leach/core/utils/app_size.dart';
import 'package:leach/core/widgets/cutom_text.dart';

class ProfileUserRow extends StatelessWidget {
  const ProfileUserRow({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          AssetPath.doctor,
          width: AppSize.defaultSize! * 8.2,
          height: AppSize.defaultSize! * 8.2,
        ),
        Column(
          children: [
            CustomText(
              text: 'Hussein',
              fontSize: AppSize.defaultSize! * 3,
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
            CustomText(
              text: '@3amk2077',
              fontSize: AppSize.defaultSize! * 2,
              color: Colors.white,
            ),
          ],
        ),
      ],
    );
  }
}