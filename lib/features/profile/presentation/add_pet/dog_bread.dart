import 'dart:developer';
import 'dart:io';

import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leach/core/resource_manager/asset_path.dart';
import 'package:leach/core/resource_manager/colors.dart';
import 'package:leach/core/resource_manager/routes.dart';
import 'package:leach/core/resource_manager/string_manager.dart';
import 'package:leach/core/utils/app_size.dart';
import 'package:leach/core/widgets/check_box.dart';
import 'package:leach/core/widgets/column_with_text_field.dart';
import 'package:leach/core/widgets/custom_text_field.dart';
import 'package:leach/core/widgets/cutom_text.dart';
import 'package:leach/core/widgets/loading_widget.dart';
import 'package:leach/core/widgets/main_button.dart';
import 'package:leach/core/widgets/snack_bar.dart';
import 'package:leach/features/auth/presentation/widgets/country_drop_down.dart';
import 'package:leach/features/auth/presentation/widgets/leading_with_icon.dart';
import 'package:leach/features/profile/presentation/controller/create_pet_bloc/create_pet_bloc.dart';
import 'package:leach/features/profile/presentation/controller/create_pet_bloc/create_pet_events.dart';
import 'package:leach/features/profile/presentation/controller/create_pet_bloc/create_pet_states.dart';
import 'package:leach/features/profile/presentation/controller/dogBreadBloc/bloc.dart';
import 'package:leach/features/profile/presentation/controller/dogBreadBloc/state.dart';
import 'package:leach/features/profile/presentation/widget/image_picker_widget.dart';
import 'package:leach/features/profile/presentation/widget/male_or_female.dart';
import 'package:leach/features/profile/presentation/widget/multi_image_picker.dart';
import 'package:leach/features/profile/presentation/widget/size_row.dart';

class DogBread extends StatefulWidget {
  const DogBread({super.key});

  @override
  State<DogBread> createState() => _DogBreadState();
}

class _DogBreadState extends State<DogBread> {
  late TextEditingController nameController;
  late TextEditingController usernameController;
  late TextEditingController weightController;

  @override
  void initState() {
    nameController = TextEditingController();
    usernameController = TextEditingController();
    weightController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    usernameController.dispose();
    weightController.dispose();
    LoadingOverlay().hide();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<CreatePetBloc, CreatePetState>(
        listener: (context, state) {
          if (state is CreatePetSuccessMessageState) {
            LoadingOverlay().hide();

            Navigator.pushNamed(context, Routes.dogBreed3,arguments: state.petProfileModel);
          } else if (state is CreatePetErrorMessageState) {
            LoadingOverlay().hide();
            errorSnackBar(context, state.errorMessage);
          } else if (state is CreatePetLoadingState) {
            LoadingOverlay().show(context);
          }
        },
        child: BlocBuilder<DogBreadCubit, DogBreadState>(
          builder: (context, state) {
            final cubit = context.read<DogBreadCubit>();
            var config = CalendarDatePicker2WithActionButtonsConfig(
              dayTextStyle: const TextStyle(color: AppColors.primaryColor),
              selectedDayHighlightColor: AppColors.primaryColor,
              calendarType: CalendarDatePicker2Type.single,
              controlsTextStyle: const TextStyle(color: AppColors.primaryColor),
              weekdayLabelTextStyle:
                  const TextStyle(color: AppColors.primaryColor),
              selectedDayTextStyle: const TextStyle(color: Colors.white),
              okButtonTextStyle: const TextStyle(color: AppColors.primaryColor),
              cancelButtonTextStyle:
                  const TextStyle(color: AppColors.primaryColor),
            );

            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                  left: AppSize.defaultSize! * 2,
                  right: AppSize.defaultSize! * 2,
                  top: AppSize.defaultSize! * 6,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const LeadingWithIcon(
                      image: AssetPath.dogIcon,
                      color: AppColors.primaryColor,
                    ),
                    CustomText(
                      text: StringManager.dogBreed.tr(),
                      fontWeight: FontWeight.w700,
                      fontSize: AppSize.defaultSize! * 4,
                    ),
                    CustomText(
                      text: StringManager.enterPersonalInformation.tr(),
                      fontSize: AppSize.defaultSize! * 1.5,
                      color: AppColors.greyColor,
                    ),
                    ColumnWithTextField(
                      text: StringManager.name.tr(),
                      hintText: StringManager.name.tr(),
                      controller: nameController,
                    ),
                    ColumnWithTextField(
                      text: StringManager.username.tr(),
                      hintText: StringManager.enterUsername.tr(),
                      controller: usernameController,
                    ),
                    ColumnWithTextField(
                      text: StringManager.dogBreed.tr(),
                      child: CountryDropDown(
                        hint: StringManager.selectYourDogsBreed.tr(),
                        onChanged: (value) {
                          cubit.setKind(value ?? "");
                        },
                        countryOrCity: const [
                          'American Shorthair',
                          'Abyssinian',
                          'Bengal',
                          'Maine Coon',
                          'Russian Blue',
                          'Siamese',
                          'Sphynx',
                        ],
                      ),
                    ),
                    SizedBox(
                      height: AppSize.defaultSize! * 3,
                    ),
                    Row(
                      children: [
                        CircularCheckbox(
                          text: 'PureBred',
                          initialValue: state.isPureBredSelected == true,
                          onChanged: (value) {
                            cubit.setPureBredSelected(true);
                          },
                        ),
                        CircularCheckbox(
                          text: 'MixedBreed',
                          initialValue: state.isPureBredSelected == false,
                          onChanged: (value) {
                            cubit.setPureBredSelected(false);
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: AppSize.defaultSize! * .5,
                    ),
                    if (state.isPureBredSelected == false)
                      ColumnWithTextField(
                        text: StringManager.secondBreed.tr(),
                        child: CountryDropDown(
                          hint: StringManager.selectYourCatsSecondBreed.tr(),
                          onChanged: (value) {
                            cubit.setSecondKind(value ?? "");
                          },
                          countryOrCity: const [
                            'American Shorthair',
                            'Abyssinian',
                            'Bengal',
                            'Maine Coon',
                            'Russian Blue',
                            'Siamese',
                            'Sphynx',
                          ],
                        ),
                      ),
                    SizedBox(
                      height: AppSize.defaultSize! * .5,
                    ),
                    ColumnWithTextField(
                      text: StringManager.typeAgeAndWeightOfDog.tr(),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomTextField(
                            width: AppSize.screenWidth! * 0.42,
                            hintText: state.selectedDate != null
                                ? DateFormat('yyyy-MM-dd')
                                    .format(state.selectedDate!)
                                : StringManager.age.tr(),
                            readOnly: true,
                            onTap: () async {
                              var results = await showCalendarDatePicker2Dialog(
                                context: context,
                                config: config,
                                dialogSize: Size(AppSize.screenWidth! * .8,
                                    AppSize.screenHeight! * .5),
                                borderRadius: BorderRadius.circular(15),
                              );
                              if (results != null && results.isNotEmpty) {
                                DateTime selectedDate = results.first!;
                                cubit.selectDate(selectedDate);
                              }
                            },
                          ),
                          CustomTextField(
                            width: AppSize.screenWidth! * 0.42,
                            hintText: StringManager.weightKg.tr(),
                            controller: weightController,
                            keyboardType: TextInputType.number,
                          ),
                        ],
                      ),
                    ),
                    ColumnWithTextField(
                      text: StringManager.gender.tr(),
                      child: MaleOrFemale(
                        onValueChange: (value) {
                          cubit.selectGender(value);
                        },
                      ),
                    ),
                    ColumnWithTextField(
                      text: StringManager.size.tr(),
                      child: SizeRow(
                        isDog: true,
                        onValueChange: (value) {
                          cubit.selectSize(value);
                        },
                      ),
                    ),
                    ColumnWithTextField(
                      text: StringManager.breedingExperience.tr(),
                      child: Row(
                        children: [
                          CircularCheckbox(
                            text: StringManager.yes.tr(),
                            initialValue: state.breedingExperience == true,
                            onChanged: (value) {
                              cubit.setBreedingExperience(true);
                            },
                          ),
                          CircularCheckbox(
                            text: StringManager.no.tr(),
                            initialValue: state.breedingExperience == false,
                            onChanged: (value) {
                              cubit.setBreedingExperience(false);
                            },
                          ),
                        ],
                      ),
                    ),
                    ColumnWithTextField(
                      text: StringManager.availableForBreeding.tr(),
                      child: Row(
                        children: [
                          CircularCheckbox(
                            text: StringManager.yes.tr(),
                            initialValue: state.breedingAvailable == true,
                            onChanged: (value) {
                              cubit.setBreedingAvailable(true);
                            },
                          ),
                          CircularCheckbox(
                            text: StringManager.no.tr(),
                            initialValue: state.breedingAvailable == false,
                            onChanged: (value) {
                              cubit.setBreedingAvailable(false);
                            },
                          ),
                        ],
                      ),
                    ),
                    ColumnWithTextField(
                      text: StringManager.neuteredSpayed.tr(),
                      child: Row(
                        children: [
                          CircularCheckbox(
                            text: StringManager.yes.tr(),
                            initialValue: state.neuteredSpayed == true,
                            onChanged: (value) {
                              cubit.setNeuteredSpayed(true);
                            },
                          ),
                          CircularCheckbox(
                            text: StringManager.no.tr(),
                            initialValue: state.neuteredSpayed == false,
                            onChanged: (value) {
                              cubit.setNeuteredSpayed(false);
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: AppSize.defaultSize! * 2.5,
                    ),
                    MultiImagePickerWidget(
                      initialText: StringManager.addAPicture.tr(),
                      onImagesPicked: (List<File> files) {
                        cubit.pickImages(files);
                      },
                    ),
                    SizedBox(
                      height: AppSize.defaultSize! * 2.5,
                    ),
                    ImagePickerWidget(
                      initialText:
                          StringManager.addPictureOfMedicalPassport.tr(),
                      onImagePicked: (File file) {
                        cubit.pickPassportImage(file);
                      },
                    ),
                    SizedBox(
                      height: AppSize.defaultSize! * 2,
                    ),
                    MainButton(
                      text: StringManager.next.tr(),
                      onTap: () {
                        final isValid = validateForm(
                          username: usernameController.text,
                          name: nameController.text,
                          gender: state.isMale == true ? 'Male' : 'Female',
                          petType: 'DOG',
                          pureBred: state.isPureBredSelected ?? false,
                          breed: state.selectKind ?? '',
                          secondBreed: state.selectSecondKind,
                          dateOfBirth: state.selectedDate != null
                              ? DateFormat('yyyy-MM-dd')
                                  .format(state.selectedDate!)
                              : '',
                          weight: double.parse(weightController.text.isEmpty
                              ? '0.0'
                              : weightController.text),
                          breedingExperience: state.breedingExperience ?? false,
                          neuteredSpayed: state.neuteredSpayed ?? false,
                          breedingAvailable: state.breedingAvailable ?? false,
                          pictures: state.pickedImages,

                        );

                        if (isValid == null) {
                          BlocProvider.of<CreatePetBloc>(context).add(
                            CreatePetEvent(
                              username: usernameController.text,
                              name: nameController.text,
                              gender: state.isMale == true ? 'MALE' : 'FEMALE',
                              petType: 'DOG',
                              pureBred: state.isPureBredSelected ?? false,

                              breed: state.selectKind ?? '',
                              secondBreed: state.selectSecondKind ?? '',
                              dateOfBirth: state.selectedDate != null
                                  ? DateFormat('yyyy-MM-dd')
                                      .format(state.selectedDate!)
                                  : '',
                              weight: double.parse(weightController.text.isEmpty
                                  ? '0.0'
                                  : weightController.text),
                              breedingExperience:
                                  state.breedingExperience ?? false,
                              neuteredSpayed: state.neuteredSpayed ?? false,
                              profilePicture: state.pickedImages.first,
                              medicalPassport: state.passportImageFile,
                              breedingAvailable:
                                  state.breedingAvailable ?? false,
                              pictures: state.pickedImages,
                              breedSize: (state.sizeSelectedIndex == 0
                                      ? "SMALL"
                                      : state.sizeSelectedIndex == 1
                                          ? "MEDIUM":state.sizeSelectedIndex == 2?"LARGE"
                                          : "GIANT")
                                  .toString(),
                            ),
                          );
                          log('message${state.sizeSelectedIndex}state.sizeSelectedIndex');
                        } else {
                          errorSnackBar(context, isValid);
                        }
                      },
                      textColor: Colors.white,
                    ),
                    SizedBox(
                      height: AppSize.defaultSize! * 2.5,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  String? validateForm({
    required String username,
    required String name,
    required String gender,
    required String petType,
    required bool pureBred,
    required String breed,
    String? secondBreed,
    required String dateOfBirth,
    required double weight,
    required bool breedingExperience,
    required bool neuteredSpayed,
    required bool breedingAvailable,
    required List<File>? pictures,
  }) {
    if (username.isEmpty) {
      return 'Username is required.';
    }
    if (name.isEmpty) {
      return 'Name is required.';
    }
    if (gender != 'Male' && gender != 'Female') {
      return 'Gender must be either Male or Female.';
    }
    if (breed.isEmpty) {
      return 'Breed is required.';
    }
    if (!pureBred && (secondBreed == null || secondBreed.isEmpty)) {
      return 'Second breed is required for mixed breeds.';
    }
    try {
      DateFormat('yyyy-MM-dd').parse(dateOfBirth);
    } catch (e) {
      return 'Invalid date of birth. Please use the format YYYY-MM-DD.';
    }
    if (weight <= 0) {
      return 'Weight must be greater than zero.';
    }
    if (pictures == null || pictures.isEmpty) {
      return 'At least one picture is required.';
    }
    return null; // Returns null if all validations pass
  }
}
