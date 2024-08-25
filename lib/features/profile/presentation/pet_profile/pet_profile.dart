import 'package:flutter/material.dart';
import 'package:leach/core/models/pet_model.dart';
import 'package:leach/core/models/profile_data_model.dart';
import 'package:leach/core/resource_manager/asset_path.dart';
import 'package:leach/core/resource_manager/routes.dart';
import 'package:leach/core/utils/app_size.dart';
import 'package:leach/core/widgets/cutom_text.dart';
import 'package:leach/core/widgets/icon_with_matrial.dart';
import 'package:leach/features/profile/presentation/pet_profile/pet_drop_down.dart';
import 'package:leach/features/profile/presentation/profile/widgets/posts_container.dart';
import 'package:leach/features/profile/presentation/widget/medals_abd_freinds.dart';
import 'package:leach/features/profile/presentation/widget/pet_or_profile.dart';
import 'package:leach/features/profile/presentation/widget/profile_app_bar.dart';
import 'package:leach/features/profile/presentation/widget/profile_user_row.dart';

class PetProfile extends StatefulWidget {
  const PetProfile({super.key});

  static Pet? currentPet;

  @override
  State<PetProfile> createState() => _PetProfileState();
}

class _PetProfileState extends State<PetProfile> {
  UserModel? userModel;

  @override
  initState() {
    PetProfile.currentPet ??= UserModel.getInstance().pets?[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return petProfile(UserModel.getInstance());
  }

  Widget petProfile(UserModel user) {
    return Column(
      children: [
        SizedBox(
          height: AppSize.defaultSize! * 8,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSize.defaultSize! * 3.4),
          child: Column(
            children: [
              if (user.pets!.length > 1)
                ProfileAppBar(
                    leading: false,
                    child: PetDropDown(
                      pets: user.pets ?? [],
                      currentPet: PetProfile.currentPet ?? user.pets![0],
                      onTap: (i) {
                        Navigator.pop(context);
                        setState(() {
                          PetProfile.currentPet = user.pets?[i];
                        });
                      },
                    )),
              if (user.pets!.length <= 1)
                ProfileAppBar(
                  leading: false,
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, Routes.addPetScreen);
                    },
                    child: Image.asset(
                       AssetPath.add,
                      width: AppSize.defaultSize! * 2.5,
                      height: AppSize.defaultSize! * 2.5,
                      color: Colors.white,
                    ),
                  ),
                ),
              SizedBox(
                height: AppSize.defaultSize! * 3,
              ),
              ProfileUserRow(
                name: PetProfile.currentPet!.name,
                userName: PetProfile.currentPet!.username,
                kind:
                    "${PetProfile.currentPet!.breed} ${(PetProfile.currentPet!.breed == PetProfile.currentPet!.secondBreed) ? '' : PetProfile.currentPet!.secondBreed ?? ""}",
                image: PetProfile.currentPet!.pictures[0].picture,
              ),
              SizedBox(
                height: AppSize.defaultSize!,
              ),
              Divider(
                color: Colors.white,
                thickness: AppSize.defaultSize! * 0.2,
                indent: AppSize.defaultSize! * 2,
                endIndent: AppSize.defaultSize! * 2,
              ),
              SizedBox(
                height: AppSize.defaultSize! * 2,
              ),
              SizedBox(
                width: AppSize.screenWidth! * .7,
                child: CustomText(
                  text: PetProfile.currentPet!.traits
                      .map((e) => e.name)
                      .toList()
                      .toString()
                      .split('[')
                      .last
                      .split(']')
                      .first,
                  fontSize: AppSize.defaultSize! * 1.5,
                  color: Colors.white,
                  maxLines: 6,
                  textAlign: TextAlign.start,
                ),
              ),
              MedalsAbdFriends(
                pet: PetProfile.currentPet,
              ),
            ],
          ),
        ),
        const PetOrProfile(),
        SizedBox(
          height: AppSize.defaultSize,
        ),
        Expanded(
            child: PostsContainer(
          pets: true,
          onImageTap: (){
            Navigator.pushNamed(context, Routes.petPhotoView);
          },
          commonType: CommonType(
            pictures:
                PetProfile.currentPet!.pictures.map((e) => e.picture).toList(),
          ),
        ))
      ],
    );
  }
}
