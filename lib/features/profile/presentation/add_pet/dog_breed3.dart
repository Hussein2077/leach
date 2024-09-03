import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leach/core/resource_manager/asset_path.dart';
import 'package:leach/core/resource_manager/colors.dart';
import 'package:leach/core/resource_manager/routes.dart';
import 'package:leach/core/resource_manager/string_manager.dart';
import 'package:leach/core/utils/app_size.dart';
import 'package:leach/core/widgets/cutom_text.dart';
import 'package:leach/core/widgets/empty_widget.dart';
import 'package:leach/core/widgets/loading_widget.dart';
import 'package:leach/core/widgets/main_button.dart';
import 'package:leach/core/widgets/snack_bar.dart';
import 'package:leach/features/auth/presentation/widgets/leading_with_icon.dart';
import 'package:leach/features/profile/domain/model/create_pet.dart';
import 'package:leach/features/profile/domain/model/traits_model.dart';
import 'package:leach/features/profile/presentation/controller/create_pet_bloc/create_pet_bloc.dart';
import 'package:leach/features/profile/presentation/controller/create_pet_bloc/create_pet_events.dart';
import 'package:leach/features/profile/presentation/controller/create_pet_bloc/create_pet_states.dart';
import 'package:leach/features/profile/presentation/controller/get_traits/bloc.dart';
import 'package:leach/features/profile/presentation/controller/get_traits/event.dart';
import 'package:leach/features/profile/presentation/controller/get_traits/state.dart';

import '../widget/circular_checkbox.dart';

class PetBreedSelection extends StatefulWidget {
  const PetBreedSelection({
    super.key,
    required this.selectionPetTypeParamRoute,
  });

  final SelectionPetTypeParamRoute selectionPetTypeParamRoute;

  @override
  State<PetBreedSelection> createState() => _PetBreedSelectionState();
}

class _PetBreedSelectionState extends State<PetBreedSelection> {
  final Set<int> selectedPetTraitIds = {};
  final Set<int> selectedSubtraitIds = {};
  List<int>? petTraits;

  @override
  void initState() {
    BlocProvider.of<GetTraitsBloc>(context).add(GetTraitEvent());
    super.initState();
  }

  @override
  void dispose() {
    LoadingOverlay().hide();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreatePetBloc, CreatePetState>(
      listener: (context, state) {
        if (state is UpdatePetSuccessMessageState) {
          LoadingOverlay().hide();
          Navigator.pushNamedAndRemoveUntil(
              context, Routes.main, (route) => false);
        } else if (state is UpdatePetErrorMessageState) {
          LoadingOverlay().hide();
          errorSnackBar(context, state.errorMessage);
        } else if (state is UpdatePetLoadingState) {
          LoadingOverlay().show(context);
        }
      },
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(
            left: AppSize.defaultSize! * 2,
            right: AppSize.defaultSize! * 2,
            top: AppSize.defaultSize! * 6,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LeadingWithIcon(
                image: widget.selectionPetTypeParamRoute.petType == 'dog'
                    ? AssetPath.dogIcon
                    : AssetPath.catIcon,
                color: AppColors.primaryColor,
              ),
              CustomText(
                text: widget.selectionPetTypeParamRoute.petType == 'dog'
                    ? StringManager.dogBreed.tr()
                    : StringManager.catBreed.tr(),
                fontWeight: FontWeight.w700,
                fontSize: AppSize.defaultSize! * 4,
              ),
              CustomText(
                text: StringManager.selectTemperaments.tr(),
                fontSize: AppSize.defaultSize! * 1.5,
                color: AppColors.greyColor,
              ),
              SizedBox(height: AppSize.defaultSize! * 3),
              CustomText(
                text: StringManager.petTemperaments.tr(),
                fontSize: AppSize.defaultSize! * 2,
              ),
              SizedBox(height: AppSize.defaultSize! * 1),
              BlocBuilder<GetTraitsBloc, GetTraitsState>(
                builder: (context, state) {
                  if (state is GetTraitLoadingState) {
                    return const LoadingWidget(
                      color: AppColors.primaryColor,
                    );
                  } else if (state is GetTraitSuccessMessageState) {
                    petTraits =
                        state.petTraits.map((trait) => trait.id).toList();
                    if (state.petTraits.isEmpty) {
                      return const EmptyWidget();
                    }
                    return Expanded(
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: state.petTraits.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final trait = state.petTraits[index];
                          return Padding(
                            padding: EdgeInsets.all(AppSize.defaultSize!),
                            child: Column(
                              children: [
                                buildTemperamentCheckbox(trait.id, trait.trait,
                                    isSubtrait: false),
                                if (selectedPetTraitIds.contains(trait.id) &&
                                    trait.subtraits.isNotEmpty)
                                  Column(
                                    children: [
                                      for (int i = 0;
                                          i < trait.subtraits.length;
                                          i++)
                                        Padding(
                                          padding: EdgeInsets.all(
                                              AppSize.defaultSize!),
                                          child: buildTemperamentCheckbox(
                                            trait.subtraits[i].id,
                                            trait.subtraits[i].subTrait,
                                            isSubtrait: true,
                                          ),
                                        ),
                                    ],
                                  ),
                              ],
                            ),
                          );
                        },
                      ),
                    );
                  } else {
                    return const SizedBox();
                  }
                },
              ),
              Center(
                child: MainButton(
                  text: StringManager.save.tr(),
                  onTap: () {
                    bool areTraitsValid = selectedPetTraitIds
                        .every((id) => petTraits!.contains(id));
                    bool areSubtraitsValid = selectedSubtraitIds
                        .every((id) => petTraits!.contains(id));
                    // add validation here
                    if (selectedPetTraitIds.isEmpty) {
                      errorSnackBar(
                          context, 'Please select at least one trait');
                    } else if (areTraitsValid && areSubtraitsValid) {
                      BlocProvider.of<CreatePetBloc>(context)
                          .add(UpdatePetEvent(
                        uuid: widget.selectionPetTypeParamRoute.petProfileModel
                                .uuid ??
                            "",
                        traits: selectedPetTraitIds.toList(),
                        subtraits: selectedSubtraitIds.toList(),
                        breedingAvailable: widget.selectionPetTypeParamRoute
                            .petProfileModel.breedingAvailable,
                        neuteredSpayed: widget.selectionPetTypeParamRoute
                            .petProfileModel.neuteredSpayed,
                        breedingExperience: widget.selectionPetTypeParamRoute
                            .petProfileModel.breedingExperience,
                        size: widget.selectionPetTypeParamRoute.petProfileModel
                            .breedSize,
                      ));
                    } else {
                      errorSnackBar(context, StringManager.unexpectedError);
                    }
                    print('Selected Pet Trait IDs: $selectedPetTraitIds');
                    print('Selected Subtrait IDs: $selectedSubtraitIds');
                  },
                  textColor: Colors.white,
                ),
              ),
              SizedBox(height: AppSize.defaultSize! * 2.5),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTemperamentCheckbox(int id, String text,
      {required bool isSubtrait}) {
    return CircularCheckbox(
      onChanged: (isChecked) {
        setState(() {
          if (isSubtrait) {
            if (isChecked == true) {
              selectedSubtraitIds.add(id);
            } else {
              selectedSubtraitIds.remove(id);
            }
          } else {
            if (isChecked == true) {
              selectedPetTraitIds.add(id);
            } else {
              selectedPetTraitIds.remove(id);
            }
          }
        });
      },
      initialValue: isSubtrait
          ? selectedSubtraitIds.contains(id)
          : selectedPetTraitIds.contains(id),
      text: text,
      selectedColor: AppColors.primaryColor,
    );
  }
}
