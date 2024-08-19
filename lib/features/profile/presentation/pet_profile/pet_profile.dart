import 'dart:developer';

import 'package:dotted_border/dotted_border.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leach/core/models/pet_model.dart';
import 'package:leach/core/models/profile_data_model.dart';
import 'package:leach/core/resource_manager/asset_path.dart';
import 'package:leach/core/resource_manager/colors.dart';
import 'package:leach/core/resource_manager/routes.dart';
import 'package:leach/core/resource_manager/string_manager.dart';
import 'package:leach/core/utils/app_size.dart';
import 'package:leach/core/widgets/cached_network_image.dart';
import 'package:leach/core/widgets/cutom_text.dart';
import 'package:leach/core/widgets/icon_with_matrial.dart';
import 'package:leach/core/widgets/loading_widget.dart';
import 'package:leach/features/profile/presentation/controller/my_data_manager/my_data_bloc.dart';
import 'package:leach/features/profile/presentation/controller/my_data_manager/my_data_state.dart';
import 'package:leach/features/profile/presentation/pet_profile/pet_drop_down.dart';
import 'package:leach/features/profile/presentation/profile/widgets/posts_container.dart';
import 'package:leach/features/profile/presentation/widget/medals_abd_freinds.dart';
import 'package:leach/features/profile/presentation/widget/pet_or_profile.dart';
import 'package:leach/features/profile/presentation/widget/profile_app_bar.dart';
import 'package:leach/features/profile/presentation/widget/profile_user_row.dart';

class PetProfile extends StatefulWidget {
  const PetProfile({super.key});

  @override
  State<PetProfile> createState() => _PetProfileState();
}

class _PetProfileState extends State<PetProfile> {
  UserModel? userModel;
  Pet? currentPet;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetMyDataBloc, GetMyDataState>(
      builder: (context, state) {
        if (state is GetMyDataLoadingState) {
          if (userModel != null) {
            return petProfile(userModel!);
          } else {
            return const LoadingWidget();
          }
        } else if (state is GetMyDataSuccessState) {
          currentPet ??= state.userModel.pets![0];
          userModel = state.userModel;
          return petProfile(userModel!);
        } else if (state is GetMyDataErrorState) {
          return ErrorWidget(state.errorMessage);
        } else {
          return const SizedBox();
        }
      },
    );
  }

  Widget petProfile(UserModel user) {
    // currentPet = user.pets![0];
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
                    child: PetDropDown(
                  pets: user.pets ?? [],
                  currentPet: currentPet??  user.pets![0],
                  onTap: (i) {
                    Navigator.pop(context);
                    setState(() {
                      currentPet = user.pets?[i];
                    });
                  },
                )),
              if (user.pets!.length <= 1) const ProfileAppBar(),
              SizedBox(
                height: AppSize.defaultSize! * 3,
              ),
              ProfileUserRow(
                name: currentPet!.name,
                userName: currentPet!.username,
                kind:
                    "${currentPet!.breed} ${(currentPet!.breed == currentPet!.secondBreed) ? '' : currentPet!.secondBreed ?? ""}",
                image: currentPet!.pictures[0].picture,
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
                  text: currentPet!.traits
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
                pet: currentPet,
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
          commonType: CommonType(
            pictures: currentPet!.pictures.map((e) => e.picture).toList(),
          ),
        ))
      ],
    );
  }
}
