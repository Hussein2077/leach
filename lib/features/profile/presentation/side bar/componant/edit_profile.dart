import 'dart:developer';
import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leach/core/models/profile_data_model.dart';
import 'package:leach/core/resource_manager/asset_path.dart';
import 'package:leach/core/resource_manager/colors.dart';
import 'package:leach/core/resource_manager/routes.dart';
import 'package:leach/core/resource_manager/string_manager.dart';
import 'package:leach/core/utils/app_size.dart';
import 'package:leach/core/utils/methods.dart';
import 'package:leach/core/widgets/column_with_text_field.dart';
import 'package:leach/core/widgets/cutom_text.dart';
import 'package:leach/core/widgets/leading_icon.dart';
import 'package:leach/core/widgets/loading_widget.dart';
import 'package:leach/core/widgets/main_button.dart';
import 'package:leach/core/widgets/snack_bar.dart';
import 'package:leach/features/auth/presentation/widgets/country_drop_down.dart';
import 'package:leach/features/profile/presentation/controller/my_data_manager/my_data_bloc.dart';
import 'package:leach/features/profile/presentation/controller/my_data_manager/my_data_event.dart';
import 'package:leach/features/profile/presentation/controller/my_data_manager/my_data_state.dart';
import 'package:leach/features/profile/presentation/profile/widgets/profile_pic.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  String? area;
  String? city;
  File ? imageFile;
  late TextEditingController bioController;

  late TextEditingController nameController;
  late TextEditingController usernameController;

  @override
  void initState() {
    nameController = TextEditingController(text: UserModel.getInstance().name);
    usernameController =
        TextEditingController(text: UserModel.getInstance().username);
    bioController = TextEditingController(text: UserModel.getInstance().bio);
    city = UserModel.getInstance().city;
    area = UserModel.getInstance().area;
log('$area dsggerd $city');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<GetMyDataBloc, GetMyDataState >(
  listener: (context, state) {
    if (state is UpdateMyDataLoadingState) {
      LoadingOverlay().show(context);
    }
    else if (state is UpdateMyDataSuccessState) {
      LoadingOverlay().hide();
      BlocProvider.of<GetMyDataBloc>(context).add(GetMyDataEvent());

   Navigator.pushNamed(context, Routes.main,arguments: 3);
    }
    else if (state is UpdateMyDataErrorState) {
      LoadingOverlay().hide();
 errorSnackBar(context, state.errorMessage);
     }
  },
  child: Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: Methods.instance.paddingCustom,
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
                  // if (UserModel.getInstance().image != '')
                     StatefulBuilder(
                      builder: (context, setState) {
                        return Padding(
                          padding: EdgeInsets.only(top: AppSize.defaultSize! * 2),
                          child: ProfileImagePicker(
                            initialImageUrl: UserModel.getInstance().image, // Your initial image URL
                            initialText: 'Pick an image',
                            onImagePicked: (File image) {
                              setState(() {
                                imageFile = image;
                              });
                            },
                          ),
                        );
                      }
                    ),

                  const Spacer(
                    flex: 12,
                  ),
                ],
              ),
              SizedBox(
                height: AppSize.defaultSize! ,
              ),
              Center(
                child: CustomText(
                  text: StringManager.changePicture.tr(),
                  fontSize: AppSize.defaultSize! * 2,
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
                text: StringManager.editBio.tr(),
                hintText: StringManager.enterNewBio.tr(),
                rightText: StringManager.optional.tr(),
                controller: bioController,
              ),
              StatefulBuilder(builder: (context, setState) {
                return ColumnWithTextField(
                  text: StringManager.city.tr(),
                  child: CountryDropDown(
                    countryOrCity: StringManager.citiesInEgypt,
                    initialValue: city,
                    onChanged: (String? value) {
                      setState(() {
                        city = value;
                      });
                    },
                    hint: StringManager.selectYourCity.tr(),
                  ),
                );
              }),
              StatefulBuilder(builder: (context, setState) {
                return ColumnWithTextField(
                  text: StringManager.area.tr(),
                  child: CountryDropDown(
                    countryOrCity: const ['6 Of October','zayed'],
                    initialValue: area,
                    onChanged: (String? value) {
                      setState(() {
                        area = value;
                      });
                    },
                  ),
                );
              }),
              SizedBox(
                height: AppSize.defaultSize! * 3,
              ),
              Center(
                child: MainButton(
                    text: StringManager.save.tr(),
                    color: const Color.fromRGBO(68, 82, 255, 1),
                    textColor: Colors.white,
                    onTap: () {
                      BlocProvider.of<GetMyDataBloc>(context) .add( UpdateMyDataEvent(
                        name: nameController.text,
                        username: usernameController.text,
                        bio: bioController.text,
                        city: city ,
                        area: area  ,
                        image: imageFile
                      ));
                    }),
              ),
              SizedBox(
                height: AppSize.defaultSize! * 3,
              ),
            ],
          ),
        ),
      ),
    ),
);
  }
}
