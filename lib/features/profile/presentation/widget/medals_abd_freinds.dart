import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:leach/core/models/pet_model.dart';
import 'package:leach/core/resource_manager/asset_path.dart';
import 'package:leach/core/resource_manager/routes.dart';
import 'package:leach/core/resource_manager/string_manager.dart';
import 'package:leach/core/utils/app_size.dart';
import 'package:leach/core/utils/methods.dart';
import 'package:leach/core/widgets/cutom_text.dart';
import 'package:leach/core/widgets/large_botton.dart';

class MedalsAbdFriends extends StatelessWidget {
  final Pet? pet;
  final String? number_of_friends;
  final bool? isFriendView;
  const MedalsAbdFriends({super.key, this.pet, this.number_of_friends, this.isFriendView = false});

  @override
  Widget build(BuildContext context) {
    return pet!=null?
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildMedal(
            text: "${Methods.instance.calculateAge(pet!.dateOfBirth ) }", image: AssetPath.years, name: StringManager.age),
        SizedBox(
          width: AppSize.defaultSize!,
        ),
        buildMedal(
            text: "${pet?.weight}K", image: AssetPath.weight, name: StringManager.weight),
        SizedBox(
          width: AppSize.defaultSize!,
        ),
        buildMedal(
            text: "${pet?.gender}", image: AssetPath.gender, name: StringManager.gender),
      ],
    )
        :Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildMedal(
            text: number_of_friends??"0",
            image: AssetPath.pet2Leg,
            name: StringManager.friends,
            onPressed: (){
              if(!isFriendView!) {
                Navigator.pushNamed(context, Routes.friends);
              }
            }
        ),
      ],
    );
  }

  Widget buildMedal(
      {required String text,
      required String image,
      required String name,
      Function()? onPressed}) {
    return Column(
      children: [
        LargeButton(
          text: text,
          fontSize: AppSize.defaultSize! * 3,
          width: AppSize.defaultSize! * 8.2,
          height: AppSize.defaultSize! * 8,
          onPressed: onPressed,
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
