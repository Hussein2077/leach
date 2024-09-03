import 'package:flutter/material.dart';
import 'package:leach/core/utils/app_size.dart';
import 'package:leach/core/widgets/cutom_text.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

void showCustomSnackBar({
  required BuildContext context,
  required String message,
  required Color backgroundColor,
  required IconData icon,
}) {
  // Determine if the keyboard is visible
  bool isKeyboardVisible = MediaQuery.of(context).viewInsets.bottom != 0;

  // Adjust the bottom margin based on keyboard visibility
  double bottomMargin = isKeyboardVisible
      ? MediaQuery.of(context).viewInsets.bottom + AppSize.defaultSize! * 1.5
      : AppSize.defaultSize! * 4;

  final snackBar = SnackBar(
    content: Row(
      children: [
        Icon(
          icon,
          color: Colors.white,
          size: AppSize.defaultSize! * 2.2, // Smaller icon size
        ),
        SizedBox(width: AppSize.defaultSize! * 1),
        Expanded(
          child: CustomText(
            text: message,
            color: Colors.white,
            fontSize: AppSize.defaultSize! * 1.6, // Smaller font size
          ),
        ),
      ],
    ),
    duration: const Duration(seconds: 3),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8), // Smaller corner radius
    ),
    margin: EdgeInsets.symmetric(
      horizontal: AppSize.screenWidth! * .1,
    ).copyWith(
      bottom: bottomMargin,
    ),
    backgroundColor: backgroundColor.withOpacity(0.95),
    behavior: SnackBarBehavior.floating,
    elevation: 4.0, // Reduced elevation for a less prominent shadow
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

void errorSnackBar(BuildContext context, String message) {
  showTopSnackBar(
    Overlay.of(context),
    CustomSnackBar.error(
      message: message,
    ),
  );
}

void successSnackBar(BuildContext context, String message) {
  showTopSnackBar(
    Overlay.of(context),
    CustomSnackBar.success(
      message: message,
    ),
  );
}
