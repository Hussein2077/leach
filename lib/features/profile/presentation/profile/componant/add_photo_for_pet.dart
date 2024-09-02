import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:leach/core/resource_manager/routes.dart';
import 'package:leach/core/resource_manager/string_manager.dart';
import 'package:leach/core/utils/app_size.dart';
import 'package:leach/core/widgets/leading_icon.dart';
import 'package:leach/core/widgets/loading_widget.dart';
import 'package:leach/core/widgets/main_button.dart';
import 'package:leach/core/widgets/snack_bar.dart';
import 'package:leach/features/profile/presentation/controller/create_pet_bloc/create_pet_bloc.dart';
import 'package:leach/features/profile/presentation/controller/create_pet_bloc/create_pet_events.dart';
import 'package:leach/features/profile/presentation/controller/create_pet_bloc/create_pet_states.dart';
import 'package:leach/features/profile/presentation/controller/my_data_manager/my_data_bloc.dart';
import 'package:leach/features/profile/presentation/controller/my_data_manager/my_data_event.dart';
import 'package:leach/features/profile/presentation/profile/widgets/dottet_border_custom.dart';

class AddPhotoForPet extends StatefulWidget {
  const AddPhotoForPet({super.key, required this.petId});

  final int petId;

  @override
  State<AddPhotoForPet> createState() => _AddPhotoForPetState();
}

class _AddPhotoForPetState extends State<AddPhotoForPet> {
  File? _imageFile;
  StreamSubscription<CreatePetState>? _createPetBlocSubscription;

  @override
  void initState() {
    _imageFile = null;
    _createPetBlocSubscription =
        BlocProvider.of<CreatePetBloc>(context).stream.listen((state) {
      if (state is AddPhotoForPetLoadingState) {
        LoadingOverlay().show(context);
      }

      if (state is AddPhotoForPetSuccessMessageState) {
        _handleSuccessState(); // Call the method to handle success state
      }

      if (state is AddPhotoForPetErrorMessageState) {
        LoadingOverlay().hide();
        errorSnackBar(context, state.errorMessage);
      }
    });
    super.initState();
  }

  void _handleSuccessState() {
    LoadingOverlay().hide();
    BlocProvider.of<GetMyDataBloc>(context).add(GetMyDataEvent());
    Navigator.pushNamedAndRemoveUntil(context, Routes.main, arguments: 2, (route) => false);
    _createPetBlocSubscription?.cancel();
  }

  @override
  void dispose() {
    _createPetBlocSubscription?.cancel();
    super.dispose();
  }

  Future<void> _openImagePicker() async {
    var maxFileSizeInBytes = 5 * 1048576; // 5 MB limit
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      var imageBytes = await pickedImage.readAsBytes();
      var fileSize = imageBytes.length;

      if (fileSize <= maxFileSizeInBytes) {
        setState(() {
          _imageFile = File(pickedImage.path);
        });
      } else {
        errorSnackBar(context, StringManager.fileTooBig.tr());
      }
    } else {
      print('No image selected.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            left: AppSize.defaultSize! * 2,
            right: AppSize.defaultSize! * 2,
            top: AppSize.defaultSize! * 6,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: AppSize.defaultSize! * 3,
              ),
              const LeadingIcon(),
              SizedBox(
                height: AppSize.defaultSize! * 3,
              ),
              DottedBorderCustom(
                text: StringManager.addPhoto.tr(),
                onTap: _openImagePicker,
                imageFile: _imageFile,
              ),
              SizedBox(
                height: AppSize.defaultSize! * 10,
              ),
              Center(
                child: MainButton(
                  text: StringManager.save.tr(),
                  onTap: () {
                    if (_imageFile == null) {
                      errorSnackBar(context, 'Please select an image');
                    } else {
                      BlocProvider.of<CreatePetBloc>(context).add(
                        AddPhotoForPetEvent(
                          image: _imageFile!,
                          petId: widget.petId.toString(),
                        ),
                      );
                    }
                  },
                  textColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
