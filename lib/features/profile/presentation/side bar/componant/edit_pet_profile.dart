import 'dart:developer';
import 'dart:io';

import 'package:calendar_date_picker2/calendar_date_picker2.dart';
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
import 'package:leach/core/utils/methods.dart';
import 'package:leach/core/widgets/check_box.dart';
import 'package:leach/core/widgets/column_with_text_field.dart';
import 'package:leach/core/widgets/custom_text_field.dart';
import 'package:leach/core/widgets/cutom_text.dart';
import 'package:leach/core/widgets/leading_icon.dart';
import 'package:leach/core/widgets/loading_widget.dart';
import 'package:leach/core/widgets/main_button.dart';
import 'package:leach/core/widgets/snack_bar.dart';
import 'package:leach/features/main_screen_bloc.dart';
import 'package:leach/features/profile/presentation/controller/create_pet_bloc/create_pet_bloc.dart';
import 'package:leach/features/profile/presentation/controller/create_pet_bloc/create_pet_events.dart';
import 'package:leach/features/profile/presentation/controller/create_pet_bloc/create_pet_states.dart';
import 'package:leach/features/profile/presentation/controller/my_data_manager/my_data_bloc.dart';
import 'package:leach/features/profile/presentation/controller/my_data_manager/my_data_event.dart';
import 'package:leach/features/profile/presentation/pet_profile/pet_drop_down.dart';
import 'package:leach/features/profile/presentation/profile/widgets/profile_pic.dart';
import 'package:leach/features/profile/presentation/widget/image_picker_widget.dart';
import 'package:leach/features/profile/presentation/widget/size_row.dart';

class EditPetProfile extends StatefulWidget {
  const EditPetProfile({super.key, required this.pets});

  final List<Pet> pets;

  @override
  State<EditPetProfile> createState() => _EditPetProfileState();
}

class _EditPetProfileState extends State<EditPetProfile> {
  late TextEditingController nameController;
  late TextEditingController usernameController;
  late TextEditingController weightController;
  File? imageFile;
  File? passportImageFile;
  DateTime? selectedDate;
  int? size;
  bool? breedingExperience;
  bool? neuteredSpayed;
  bool? breedingAvailable;
  Pet? currentPet;
  String? profilePicture;

  @override
  void initState() {
    if (widget.pets.isNotEmpty) {
      nameController = TextEditingController(text: widget.pets[0].name);
      usernameController = TextEditingController(text: widget.pets[0].username);
      weightController =
          TextEditingController(text: widget.pets[0].weight.toString());
      selectedDate = widget.pets[0].dateOfBirth;
      size = widget.pets[0].size == 'SMALL'
          ? 0
          : widget.pets[0].size == 'MEDIUM'
              ? 1
              : widget.pets[0].size == 'LARGE'
                  ? 2
                  : 3;
      neuteredSpayed = widget.pets[0].neuteredSpayed;
      breedingExperience = widget.pets[0].breedingExperience;
      breedingAvailable = widget.pets[0].breedingAvailable;
      profilePicture = widget.pets[0].profilePicture;
    }
    super.initState();
  }
  @override
  void dispose() {
    LoadingOverlay().hide();

    nameController.dispose();
    usernameController.dispose();
    weightController.dispose();
    profilePicture = null;

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreatePetBloc, CreatePetState>(
      listener: (context, state) {
        if (state is UpdatePetSuccessMessageState) {
          LoadingOverlay().hide();

          Navigator.pushNamedAndRemoveUntil(context, Routes.main,arguments: 2, (route) => false);
          BlocProvider.of<GetMyDataBloc>(context).add(GetMyDataEvent());
        } else if (state is UpdatePetErrorMessageState) {
          LoadingOverlay().hide();
          errorSnackBar(context, state.errorMessage);
        } else if (state is UpdatePetLoadingState) {
          LoadingOverlay().show(context);
        }
      },
      child: Scaffold(
          body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            left: AppSize.defaultSize! * 2,
            right: AppSize.defaultSize! * 2,
            top: AppSize.defaultSize! * 6,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: AppSize.defaultSize! * 2,
                width: AppSize.defaultSize! * 2,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const LeadingIcon(
                    color: AppColors.primaryColor,
                  ),
                  const Spacer(
                    flex: 10,
                  ),
                  if (profilePicture != null || profilePicture != '')
                    StatefulBuilder(builder: (context, setState) {
                      return Padding(
                        padding: EdgeInsets.only(
                            top: AppSize.defaultSize! * 2,
                            left: AppSize.defaultSize! * 2.5),
                        child: ProfileImagePicker(
                          initialImageUrl: profilePicture,
                          // Your initial image URL
                          initialText: 'Pick an image',
                          onImagePicked: (File image) {
                            setState(() {
                              imageFile = image;
                            });
                          },
                        ),
                      );
                    }),
                  if (profilePicture == '' || profilePicture == null)
                    Padding(
                      padding: EdgeInsets.only(
                          top: AppSize.defaultSize! * 2,
                          left: AppSize.defaultSize! * 3.5),
                      child: Image.asset(
                        AssetPath.whiteProfileIcon,
                        width: AppSize.defaultSize! * 12,
                        height: AppSize.defaultSize! * 12,
                      ),
                    ),
                  const Spacer(
                    flex: 12,
                  ),
                  PetDropDown(
                    pets: widget.pets ?? [],
                    currentPet: currentPet ?? widget.pets[0],
                    onTap: (i) {
                      Navigator.pop(context);
                      setState(() {
                        currentPet = widget.pets[i];
                        nameController =
                            TextEditingController(text: currentPet?.name);
                        usernameController =
                            TextEditingController(text: currentPet?.username);
                        weightController = TextEditingController(
                            text: currentPet?.weight.toString());
                        selectedDate = currentPet?.dateOfBirth;
                        size = currentPet?.size == 'SMALL'
                            ? 0
                            : currentPet?.size == 'MEDIUM'
                                ? 1
                                : currentPet?.size == 'LARGE'
                                    ? 2
                                    : 3;
                        neuteredSpayed = currentPet?.neuteredSpayed;
                        breedingExperience = currentPet?.breedingExperience;
                        breedingAvailable = currentPet?.breedingAvailable;
                        profilePicture = currentPet?.profilePicture;
                      });
                    },
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                  right: AppSize.defaultSize! * 2.5,
                ),
                child: Center(
                  child: InkWell(
                    child: CustomText(
                      text: StringManager.changePicture.tr(),
                      fontSize: AppSize.defaultSize! * 2,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: AppSize.defaultSize! * 2,
              ),
              CustomText(
                fontFamily: 'Gully-CD',
                text: StringManager.enterInformation.tr(),
                fontSize: AppSize.defaultSize! * 1.5,
                color: const Color.fromRGBO(112, 112, 112, 1),
              ),
              ColumnWithTextField(
                text: StringManager.name.tr(),
                hintText: StringManager.enterYourName.tr(),
                rightText: StringManager.optional.tr(),
                controller: nameController,
              ),
              ColumnWithTextField(
                text: StringManager.userName.tr(),
                hintText: StringManager.enterUserName.tr(),
                controller: usernameController,
                rightText: StringManager.optional.tr(),
              ),
              ColumnWithTextField(
                text: StringManager.typeAgeAndWeightOfDog.tr(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    StatefulBuilder(builder: (context, setState) {
                      return CustomTextField(
                        width: AppSize.screenWidth! * 0.42,
                        hintText: selectedDate != null
                            ? DateFormat('yyyy-MM-dd').format(selectedDate!)
                            : StringManager.age.tr(),
                        readOnly: true,
                        onTap: () async {
                          var results = await showCalendarDatePicker2Dialog(
                            context: context,
                            config: Methods.instance.config,
                            dialogSize: Size(AppSize.screenWidth! * .8,
                                AppSize.screenHeight! * .5),
                            borderRadius: BorderRadius.circular(15),
                          );
                          if (results != null && results.isNotEmpty) {
                            DateTime selectedDate = results.first!;
                            setState(() {
                              this.selectedDate = selectedDate;
                            });
                          }
                        },
                      );
                    }),
                    CustomTextField(
                      width: AppSize.screenWidth! * 0.42,
                      hintText: StringManager.weightKg.tr(),
                      controller: weightController,
                    ),
                  ],
                ),
              ),
              ColumnWithTextField(
                text: StringManager.size.tr(),
                child: SizeRow(
                  isDog: (currentPet?.petType??widget.pets[0].petType) == "DOG",
                  initialValue: size,
                  onValueChange: (value) {
                    setState(() {
                      size = value;
                    });
                  },
                ),
              ),
              ColumnWithTextField(
                text: StringManager.breedingExperience.tr(),
                child: Row(
                  children: [
                    CircularCheckbox(
                      text: StringManager.yes.tr(),
                      initialValue: breedingExperience == true,
                      onChanged: (value) {
                        setState(() {
                          breedingExperience = true;
                        });
                      },
                    ),
                    CircularCheckbox(
                      text: StringManager.no.tr(),
                      initialValue: breedingExperience == false,
                      onChanged: (value) {
                        setState(() {
                          breedingExperience = false;
                        });
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
                      initialValue: breedingAvailable == true,
                      onChanged: (value) {
                        setState(() {
                          breedingAvailable = true;
                        });
                      },
                    ),
                    CircularCheckbox(
                      text: StringManager.no.tr(),
                      initialValue: breedingAvailable == false,
                      onChanged: (value) {
                        setState(() {
                          breedingAvailable = false;
                        });
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
                      initialValue: neuteredSpayed == true,
                      onChanged: (value) {
                        setState(() {
                          neuteredSpayed = true;
                        });
                      },
                    ),
                    CircularCheckbox(
                      text: StringManager.no.tr(),
                      initialValue: neuteredSpayed == false,
                      onChanged: (value) {
                        setState(() {
                          neuteredSpayed = false;
                        });
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: AppSize.defaultSize! * 2,
              ),
              ImagePickerWidget(
                initialText: StringManager.editPictureOfMedicalPassport.tr(),
                onImagePicked: (File file) {
                  setState(() {
                    passportImageFile = file;
                  });
                },
              ),
              MainButton(
                text: StringManager.save.tr(),
                onTap: () {
                  log(' currentPet!.uuid  ${usernameController.text}');
                  BlocProvider.of<CreatePetBloc>(context).add(UpdatePetEvent(
                    uuid: currentPet?.uuid??widget.pets[0].uuid,
                    profilePicture: imageFile,
                    name: nameController.text,
                    username: usernameController.text,
                    weight: double.parse(weightController.text.isEmpty
                        ? "0"
                        : weightController.text),
                    breedingAvailable: breedingAvailable,
                    neuteredSpayed: neuteredSpayed,
                    breedingExperience: breedingExperience,
                    medicalPassport: passportImageFile,
                    size: size == 0
                        ? "SMALL"
                        : size == 1
                            ? "MEDIUM"
                            : size == 2
                                ? "LARGE"
                                : ((currentPet?.petType??widget.pets[0].petType) == "DOG"
                                    ? "GIANT"
                                    : "CHUNKY"),
                  ));
                },
                textColor: Colors.white,
              ),
              SizedBox(
                height: AppSize.defaultSize! * 2.5,
              ),
            ],
          ),
        ),
      )),
    );
  }
}
