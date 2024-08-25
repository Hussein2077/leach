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
                  leading: false,
                  child: IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => Stack(
                          children: [
                            Positioned(
                              top: AppSize.defaultSize! * 8,
                              // Adjust this value as needed to position the dialog from the top
                              left: AppSize.defaultSize! * 7,
                              // Adjust for horizontal centering or alignment
                              right: AppSize.defaultSize! * 7,
                              // Adjust for horizontal centering or alignment
                              child: Material(
                                color: Colors.transparent,
                                child: Container(
                                  height: AppSize.defaultSize! * 18,
                                  // Fixed height
                                  width: AppSize.defaultSize! * 10,
                                  // Fixed width
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(
                                        AppSize.defaultSize! * 2),
                                  ),
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: ListView.builder(
                                          itemCount: user.pets!.length,
                                          itemBuilder: (context, index) {
                                            return Padding(
                                              padding: EdgeInsets.all(
                                                  AppSize.defaultSize!),
                                              child: InkWell(
                                                onTap: () {
                                                  Navigator.pop(context);
                                                  setState(() {
                                                    currentPet =
                                                        user.pets![index];
                                                  });
                                                },
                                                child: Row(
                                                  children: [
                                                    CachedNetworkCustom(
                                                      url: user.pets![index]
                                                          .profilePicture,
                                                      width:
                                                          AppSize.defaultSize! *
                                                              3,
                                                      height:
                                                          AppSize.defaultSize! *
                                                              3,
                                                    ),
                                                    SizedBox(
                                                      width:
                                                          AppSize.defaultSize,
                                                    ),
                                                    CustomText(
                                                      text: user
                                                          .pets![index].name,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                    const Spacer(),
                                                    if (currentPet?.uuid ==
                                                        user.pets![index].uuid)
                                                      CircleAvatar(
                                                        backgroundColor:
                                                            AppColors
                                                                .primaryColor,
                                                        radius: AppSize
                                                                .defaultSize! *
                                                            .5,
                                                      )
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                          Navigator.pushNamed(
                                              context, Routes.addPetScreen);
                                        },
                                        icon: Row(
                                          children: [
                                            IconWithMaterial(
                                              imagePath: AssetPath.add,
                                              width: AppSize.defaultSize! * 2,
                                              height: AppSize.defaultSize! * 2,
                                            ),
                                            SizedBox(
                                              width: AppSize.defaultSize!,
                                            ),
                                            CustomText(
                                              text: StringManager.addPet.tr(),
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    icon: CachedNetworkCustom(
                      url: (currentPet!.profilePicture.isEmpty)
                          ? currentPet!.pictures[0].picture
                          : currentPet!.profilePicture,
                      width: AppSize.defaultSize! * 3,
                      height: AppSize.defaultSize! * 3,
                    ),
                  ),
                ),
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
          onImageTap: () {
            Navigator.pushNamed(context, Routes.petPhotoView);
          },
          commonType: CommonType(
            pictures: currentPet!.pictures.map((e) => e.picture).toList(),
            petId: currentPet!.id,
          ),
        ))
      ],
    );
  }
}
