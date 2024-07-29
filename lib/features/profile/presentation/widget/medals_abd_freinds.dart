import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:leach/core/resource_manager/asset_path.dart';
import 'package:leach/core/resource_manager/string_manager.dart';
import 'package:leach/core/utils/app_size.dart';
import 'package:leach/core/widgets/cutom_text.dart';
import 'package:leach/core/widgets/large_botton.dart';

class MedalsAbdFriends extends StatelessWidget {
  const MedalsAbdFriends({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildMedal(
            text: "10", image: AssetPath.petLeg, name: StringManager.points),
        SizedBox(
          width: AppSize.defaultSize!,
        ),
        buildMedal(
            text: "10", image: AssetPath.medal, name: StringManager.badges),
        SizedBox(
          width: AppSize.defaultSize!,
        ),
        buildMedal(
            text: "10", image: AssetPath.pet2Leg, name: StringManager.friends),
      ],
    );
  }

  Widget buildMedal(
      {required String text, required String image, required String name}) {
    return Column(
      children: [
        LargeButton(
          text: text,
          fontSize: AppSize.defaultSize! * 3,
          width: AppSize.defaultSize! * 8.2,
          height: AppSize.defaultSize! * 8,
          onPressed: () {},
          child: SvgPicture.asset(
            image,
            width: AppSize.defaultSize! * 1.5,
            height: AppSize.defaultSize! * 2,
          ),
        ),
        CustomText(
          text: name,
          fontSize: AppSize.defaultSize! * 2,
          color: Colors.white,
        ),
      ],
    );
  }
}
