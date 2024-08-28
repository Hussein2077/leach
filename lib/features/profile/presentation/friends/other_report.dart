import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:leach/core/resource_manager/routes.dart';
import 'package:leach/core/resource_manager/string_manager.dart';
import 'package:leach/core/utils/app_size.dart';
import 'package:leach/core/widgets/custom_text_field.dart';
import 'package:leach/core/widgets/cutom_text.dart';
import 'package:leach/core/widgets/leading_icon.dart';
import 'package:leach/core/widgets/loading_widget.dart';
import 'package:leach/core/widgets/main_button.dart';
import 'package:leach/core/widgets/snack_bar.dart';
import 'package:leach/features/profile/domain/use_case/report_user_uc.dart';
import 'package:leach/features/profile/presentation/controller/report_user/bloc.dart';
import 'package:leach/features/profile/presentation/controller/report_user/event.dart';
import 'package:leach/features/profile/presentation/controller/report_user/state.dart';
import 'package:leach/features/profile/presentation/profile/widgets/dottet_border_custom.dart';

class OtherReportScreen extends StatefulWidget {
  const OtherReportScreen({super.key, required this.userId});

  final String userId;

  @override
  State<OtherReportScreen> createState() => _OtherReportScreenState();
}

class _OtherReportScreenState extends State<OtherReportScreen> {
  File? _imageFile;
  late TextEditingController _descriptionController;

  @override
  void initState() {
    _imageFile = null;
    _descriptionController = TextEditingController();
    super.initState();
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
  void dispose() {
    _descriptionController.dispose();
    LoadingOverlay().hide();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ReportUserBloc, ReportUserState>(
      listener: (context, state) {
        if (state is ReportUserErrorMessageState) {
          LoadingOverlay().hide();
          errorSnackBar(context, state.errorMessage);
        }
        if (state is ReportUserSuccessMessageState) {
          LoadingOverlay().hide();
          Navigator.pushNamed(context, Routes.reportView);
        }
        if (state is ReportUserLoadingState) {
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
                  text: 'Add Photo For Report',
                  onTap: _openImagePicker,
                  imageFile: _imageFile,
                ),
                SizedBox(
                  height: AppSize.defaultSize! * 3,
                ),
                CustomTextField(
                  hintText: StringManager.description.tr(),
                  maxLines: 5,
                  controller: _descriptionController,
                ),
                SizedBox(
                  height: AppSize.defaultSize! * 5,
                ),
                Center(
                  child: MainButton(
                    text: StringManager.save.tr(),
                    onTap: () {
                      if (_descriptionController.text.isEmpty) {
                        errorSnackBar(context, 'Description cannot be empty');
                      } else {
                        BlocProvider.of<ReportUserBloc>(context).add(
                            ReportUserEvent(ReportParameter(
                                id: widget.userId,
                                picture: _imageFile,
                                description: _descriptionController.text)));
                      }
                    },
                    textColor: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
