import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:leach/core/resource_manager/string_manager.dart';
import 'package:leach/core/widgets/cached_network_image.dart';
import 'package:leach/core/widgets/cutom_text.dart';
import 'package:leach/core/resource_manager/colors.dart';
import 'package:leach/core/resource_manager/asset_path.dart';
import 'package:leach/core/utils/app_size.dart';
import 'package:leach/core/widgets/snack_bar.dart';

class ProfileImagePicker extends StatefulWidget {
  final String? initialImageUrl; // URL of the current profile picture
  final String initialText;
  final Function(File) onImagePicked;

  const ProfileImagePicker({
    super.key,
    this.initialImageUrl,
    required this.initialText,
    required this.onImagePicked,
  });

  @override
  _ProfileImagePickerState createState() => _ProfileImagePickerState();
}

class _ProfileImagePickerState extends State<ProfileImagePicker> {
  String? _displayText;
  File? _imageFile;

  @override
  void initState() {
    super.initState();
    _displayText = widget.initialText;
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
          _displayText = pickedImage.name; // Update text to file name
        });
        widget.onImagePicked(
            _imageFile!); // Call the callback with the picked file
      } else {
        errorSnackBar(context, StringManager.fileTooBig.tr());
      }
    } else {
      print('No image selected.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return
            _imageFile != null ||
            widget.initialImageUrl != ''
        ? InkWell(
            onTap: _openImagePicker,
            child: Padding(
              padding: EdgeInsets.only(top: AppSize.defaultSize! * 2),
              child: _imageFile != null
                  ? Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: ClipOval(
                        child: Image.file(
                          _imageFile!,
                          width: AppSize.defaultSize! * 12,
                          height: AppSize.defaultSize! * 12,
                          fit: BoxFit
                              .fill, // Ensures the image fits within the circle
                        ),
                      ),
                    )
                  : CachedNetworkCustom(
                      url: widget.initialImageUrl ??
                          '', // Provide a default empty string
                      width: AppSize.defaultSize! * 12,
                      height: AppSize.defaultSize! * 12,

                      fit: BoxFit.cover,
                    ),
            ),
          )
        : InkWell(
            onTap: _openImagePicker,
            child: Padding(
              padding: EdgeInsets.only(
                  top: AppSize.defaultSize! * 2,
                  left: AppSize.defaultSize! * 2),
              child: Image.asset(
                AssetPath.whiteProfileIcon,
                width: AppSize.defaultSize! * 15,
                height: AppSize.defaultSize! * 15,
              ),
            ),
          );
  }
}
