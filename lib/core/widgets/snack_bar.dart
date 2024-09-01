import 'package:flutter/material.dart';
import 'package:leach/core/utils/app_size.dart';
import 'package:leach/core/widgets/cutom_text.dart';

void errorSnackBar(BuildContext context, String message) {
  // Check if the keyboard is visible
  bool isKeyboardVisible = MediaQuery.of(context).viewInsets.bottom != 0;

  // Adjust the bottom margin based on keyboard visibility
  double bottomMargin = isKeyboardVisible
      ? MediaQuery.of(context).viewInsets.bottom + AppSize.defaultSize! * 2 // Just above the keyboard
      : AppSize.defaultSize! * 10; // Default margin when keyboard is not visible

  final snackBar = SnackBar(
    content: Center(
      child: CustomText(
        text: message,
        maxLines: 2,
        color: Colors.white,
        fontSize: AppSize.defaultSize! * 2,
      ),
    ),
    duration: const Duration(seconds: 3),
    shape: const StadiumBorder(),
    margin: EdgeInsets.symmetric(
      horizontal: AppSize.screenWidth! * .1,
    ).copyWith(
      bottom: bottomMargin,
    ),
    backgroundColor: Colors.red.withOpacity(.9),
    behavior: SnackBarBehavior.floating,
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
void successSnackBar(BuildContext context, String message) {
  // Check if the keyboard is visible
  bool isKeyboardVisible = MediaQuery.of(context).viewInsets.bottom != 0;

  // Adjust the bottom margin based on keyboard visibility
  double bottomMargin = isKeyboardVisible
      ? MediaQuery.of(context).viewInsets.bottom + AppSize.defaultSize! * 2 // Just above the keyboard
      : AppSize.defaultSize! * 2; // Default margin when keyboard is not visible

  final snackBar = SnackBar(
    content: Center(
      child: CustomText(
        text: message,
        color: Colors.white,
        fontSize: AppSize.defaultSize! * 2,
      ),
    ),
    duration: const Duration(seconds: 3),
    shape: const StadiumBorder(),
    margin: EdgeInsets.symmetric(
      horizontal: AppSize.screenWidth! * .1,
    ).copyWith(
      bottom: bottomMargin,
    ),
    backgroundColor: Colors.green.withOpacity(.9),
    behavior: SnackBarBehavior.floating,
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}