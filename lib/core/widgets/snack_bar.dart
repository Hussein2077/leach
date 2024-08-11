import 'package:flutter/material.dart';
import 'package:leach/core/utils/app_size.dart';
import 'package:leach/core/widgets/cutom_text.dart';

void errorSnackBar(BuildContext context, String message) {
  // Check if the keyboard is visible
  bool isKeyboardVisible = MediaQuery.of(context).viewInsets.bottom != 0;

  // Adjust the bottom margin based on keyboard visibility
  double bottomMargin = isKeyboardVisible
      ? MediaQuery.of(context).viewInsets.bottom + AppSize.defaultSize! * 14 // Just above the keyboard
      : AppSize.screenHeight! * .9; // Default margin when keyboard is not visible

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
    margin: EdgeInsets.only(
      bottom: bottomMargin,
      left: AppSize.screenWidth! * .1,
      right: AppSize.screenWidth! * .1,
    ),
    backgroundColor: Colors.red.withOpacity(.9),
    behavior: SnackBarBehavior.floating,
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
void successSnackBar(BuildContext context, String message) {
  final snackBar = SnackBar(
    content: Text(message),
    margin: EdgeInsets.only(
        bottom: AppSize.screenHeight! * .88,
        left: AppSize.screenWidth! * .1,
        right: AppSize.screenWidth! * .1),
    backgroundColor: Colors.green.withOpacity(.9),
    behavior: SnackBarBehavior.floating,
    action: SnackBarAction(
      label: 'UNDO',
      disabledTextColor: Colors.white,
      textColor: Colors.white,
      onPressed: () {
        // Few lines of code to undo the change.
      },
    ),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}