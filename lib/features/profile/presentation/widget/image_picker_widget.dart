import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:leach/core/resource_manager/string_manager.dart';
import 'package:leach/core/widgets/cutom_text.dart';
import 'package:leach/core/resource_manager/colors.dart';
import 'package:leach/core/resource_manager/asset_path.dart';
import 'package:leach/core/utils/app_size.dart';
import 'package:leach/core/widgets/snack_bar.dart';

class ImagePickerWidget extends StatefulWidget {
  final String initialText;
  final Function(File) onImagePicked;

  const ImagePickerWidget({
    super.key,
    required this.initialText,
    required this.onImagePicked,
  });

  @override
  _ImagePickerWidgetState createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  String? _displayText;
  File? _imageFile;

  @override
  void initState() {
    super.initState();
    _displayText = widget.initialText;
  }

  Future<void> _openImagePicker() async {
    var maxFileSizeInBytes = 5 * 1048576; // 5 MB limit
    final pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      var imageBytes = await pickedImage.readAsBytes();
      var fileSize = imageBytes.length;

      if (fileSize <= maxFileSizeInBytes) {
        setState(() {
          _imageFile = File(pickedImage.path);
          _displayText = pickedImage.name; // Update text to file name
        });
        widget.onImagePicked(_imageFile!); // Call the callback with the picked file
      } else {
        errorSnackBar(context, StringManager.fileTooBig.tr());
      }
    } else {
      print('No image selected.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _openImagePicker,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: CustomText(
              text: _displayText ?? widget.initialText,
              fontSize: AppSize.defaultSize! * 2,
              color: AppColors.primaryColor,
              textAlign: TextAlign.start,
              
            ),
          ),
          IconButton(
            onPressed: _openImagePicker,
            icon: Image.asset(AssetPath.cameraIcon.toString()),
          ),
        ],
      ),
    );
  }
}
