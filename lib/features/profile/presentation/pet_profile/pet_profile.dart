import 'dart:developer';

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
import 'package:leach/features/profile/presentation/controller/my_data_manager/my_data_event.dart';
import 'package:leach/features/profile/presentation/controller/my_data_manager/my_data_state.dart';
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
  void initState() {
    final pets = UserModel.getInstance().pets;
    PetProfile.currentPet ??= pets![0];

    PetProfile.currentPet = pets!.firstWhere(
          (pet) => pet.uuid == PetProfile.currentPet?.uuid,
      orElse: () => pets[0], // Fall back to the first pet if no match is found
    );
    userModel = UserModel.getInstance();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return petProfile(userModel!);
  }

  Widget _buildLoadingOrProfile() {
    if (userModel != null) {
      return petProfile(userModel!);
    } else {
      return const LoadingWidget();
    }
  }

  Widget petProfile(UserModel user) {
    return Column(
      children: [
        SizedBox(height: AppSize.defaultSize! * 8),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSize.defaultSize! * 3.4),
          child: Column(
            children: [
              _buildProfileAppBar(user),
              SizedBox(height: AppSize.defaultSize! * 3),
              ProfileUserRow(
                name: PetProfile.currentPet!.name,
                userName: PetProfile.currentPet!.username,
                kind: _getKindText(),
                image: _getProfileImage(),
              ),
              SizedBox(height: AppSize.defaultSize!),
              _buildDivider(),
              _buildTraitsText(),
              MedalsAbdFriends(pet: PetProfile.currentPet),
            ],
          ),
        ),
        const PetOrProfile(),
        SizedBox(height: AppSize.defaultSize),
        _buildPostsContainer(),
      ],
    );
  }

  Widget _buildProfileAppBar(UserModel user) {
    if (user.pets!.length > 1) {
      return ProfileAppBar(
        leading: false,
        child: IconButton(
          onPressed: () => _showPetSelectionDialog(user),
          icon: CachedNetworkCustom(
            url: _getProfileImage(),
            width: AppSize.defaultSize! * 3,
            height: AppSize.defaultSize! * 3,
          ),
        ),
      );
    } else {
      return ProfileAppBar(
        leading: false,
        child: InkWell(
          onTap: () => Navigator.pushNamed(context, Routes.addPetScreen),
          child: Image.asset(
            AssetPath.add,
            width: AppSize.defaultSize! * 2.5,
            height: AppSize.defaultSize! * 2.5,
            color: Colors.white,
          ),
        ),
      );
    }
  }

  void _showPetSelectionDialog(UserModel user) {
    showDialog(
      context: context,
      builder: (context) => Stack(
        children: [
          Positioned(
            top: AppSize.defaultSize! * 8,
            left: AppSize.defaultSize! * 7,
            right: AppSize.defaultSize! * 7,
            child: Material(
              color: Colors.transparent,
              child: Container(
                height: AppSize.defaultSize! * 18,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(AppSize.defaultSize! * 2),
                ),
                child: Column(
                  children: [
                    Expanded(child: _buildPetList(user)),
                    _buildAddPetButton(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPetList(UserModel user) {
    return ListView.builder(
      itemCount: user.pets!.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.all(AppSize.defaultSize!),
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
              setState(() {
                PetProfile.currentPet = user.pets![index];
              });
            },
            child: Row(
              children: [
                CachedNetworkCustom(
                  url: user.pets![index].profilePicture,
                  width: AppSize.defaultSize! * 3,
                  height: AppSize.defaultSize! * 3,
                ),
                SizedBox(width: AppSize.defaultSize),
                CustomText(
                  text: user.pets![index].name,
                  fontWeight: FontWeight.w700,
                ),
                const Spacer(),
                if (PetProfile.currentPet?.uuid == user.pets![index].uuid)
                  CircleAvatar(
                    backgroundColor: AppColors.primaryColor,
                    radius: AppSize.defaultSize! * .5,
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildAddPetButton() {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
        Navigator.pushNamed(context, Routes.addPetScreen);
      },
      icon: Row(
        children: [
          IconWithMaterial(
            imagePath: AssetPath.add,
            width: AppSize.defaultSize! * 2,
            height: AppSize.defaultSize! * 2,
          ),
          SizedBox(width: AppSize.defaultSize!),
          CustomText(
            text: StringManager.addPet.tr(),
            fontWeight: FontWeight.w700,
          ),
        ],
      ),
    );
  }

  String _getKindText() {
    final breed = PetProfile.currentPet!.breed;
    final secondBreed = PetProfile.currentPet!.secondBreed;
    return "$breed ${breed == secondBreed ? '' : secondBreed ?? ''}";
  }

  String _getProfileImage() {
    return PetProfile.currentPet!.profilePicture.isEmpty
        ? PetProfile.currentPet!.pictures[0].picture
        : PetProfile.currentPet!.profilePicture;
  }

  Widget _buildDivider() {
    return Divider(
      color: Colors.white,
      thickness: AppSize.defaultSize! * 0.2,
      indent: AppSize.defaultSize! * 2,
      endIndent: AppSize.defaultSize! * 2,
    );
  }

  Widget _buildTraitsText() {
    return SizedBox(
      width: AppSize.screenWidth! * .7,
      child: CustomText(
        text: PetProfile.currentPet!.traits.map((e) => e.name).join(', '),
        fontSize: AppSize.defaultSize! * 1.5,
        color: Colors.white,
        maxLines: 6,
        textAlign: TextAlign.start,
      ),
    );
  }

  Widget _buildPostsContainer() {
    return Expanded(
      child: PostsContainer(
        pets: true,
        onImageTap: () {
          Navigator.pushNamed(
            context,
            Routes.petPhotoView,
            arguments: CommonType(
              pictures: PetProfile.currentPet!.pictures
                  .map((e) => e.picture)
                  .toList(),
              petId: PetProfile.currentPet!.id,
              ids: PetProfile.currentPet!.pictures.map((e) => e.uuid).toList(),
            ),
          );
        },
        commonType: CommonType(
          pictures:
              PetProfile.currentPet!.pictures.map((e) => e.picture).toList(),
          petId: PetProfile.currentPet!.id,
        ),
      ),
    );
  }
}
