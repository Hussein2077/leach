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

class MultiImagePickerWidget extends StatefulWidget {
  final String initialText;
  final Function(List<File>) onImagesPicked;

  const MultiImagePickerWidget({
    super.key,
    required this.initialText,
    required this.onImagesPicked,
  });

  @override
  _MultiImagePickerWidgetState createState() => _MultiImagePickerWidgetState();
}

class _MultiImagePickerWidgetState extends State<MultiImagePickerWidget> {
  String? _displayText;
  List<File> _imageFiles = [];

  @override
  void initState() {
    super.initState();
    _displayText = widget.initialText;
  }

  Future<void> _openImagePicker() async {
    var maxFileSizeInBytes = 5 * 1048576; // 5 MB limit
    final pickedImages = await ImagePicker().pickMultiImage();

    if (pickedImages.length >= 3) {
      List<File> validImages = [];

      for (var pickedImage in pickedImages) {
        var imageBytes = await pickedImage.readAsBytes();
        var fileSize = imageBytes.length;

        if (fileSize <= maxFileSizeInBytes) {
          validImages.add(File(pickedImage.path));
        } else {
          errorSnackBar(context, StringManager.fileTooBig.tr());

        }
      }

      if (validImages.length >= 3) {
        setState(() {
          _imageFiles = validImages;
          _displayText = '${validImages.length} images selected';
        });
        widget.onImagesPicked(_imageFiles); // Call the callback with the picked files
      } else {
        errorSnackBar(context, 'Please select at least 3 valid images.');

      }
    } else {
      errorSnackBar(context, 'Please select at least 3 images.');



    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _openImagePicker,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(
            text: _displayText ?? widget.initialText,
            fontSize: AppSize.defaultSize! * 2,
            color: AppColors.primaryColor,
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
