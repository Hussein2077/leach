import 'dart:async';

import 'package:flutter/material.dart';
import 'package:leach/core/resource_manager/colors.dart';
import 'package:leach/core/utils/app_size.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class CustomPinCodeTextField extends StatefulWidget {
  const CustomPinCodeTextField({super.key, this.onCompleted});

  static String otp = "";
  final void Function(String)? onCompleted;

  @override
  State<CustomPinCodeTextField> createState() => _CustomPinCodeTextFieldState();
}

class _CustomPinCodeTextFieldState extends State<CustomPinCodeTextField> {
  late TextEditingController controller;
  StreamController<ErrorAnimationType>? errorController;

  bool hasError = false;
  String currentText = "";
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    controller = TextEditingController();
    errorController = StreamController<ErrorAnimationType>();

    super.initState();
  }

  @override
  void dispose() {
    errorController!.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      length: 4,
      keyboardType: TextInputType.phone,
      obscureText: false,
      animationType: AnimationType.fade,
      textStyle: TextStyle(fontSize: AppSize.defaultSize! * 1.8),
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(AppSize.defaultSize! * 2),
        fieldHeight: AppSize.defaultSize! * 8,
        fieldWidth: AppSize.defaultSize! * 8.2,
        activeFillColor: Colors.white,
        inActiveBoxShadow: [
          BoxShadow(
            color: AppColors.greyColor.withOpacity(.3),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 4), // changes position of shadow
          ),
        ],
        activeBoxShadow: [
            BoxShadow(
            color: AppColors.greyColor.withOpacity(.3),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 4), // changes position of shadow
          ),
        ],

        activeBorderWidth: 1.5,
        inactiveBorderWidth: 1.5,
        disabledColor: Colors.white,
        selectedFillColor: Colors.white,
        inactiveFillColor: Colors.white,
        inactiveColor: Colors.white,
        selectedColor: AppColors.greyColor.withOpacity(.3),
        activeColor: AppColors.primaryColor.withOpacity(.5),
      ),
      animationDuration: const Duration(milliseconds: 300),
      enableActiveFill: true,
      errorAnimationController: errorController,
      controller: controller,
      onCompleted: widget.onCompleted ??
          (v) {
            print("Completed");
            CustomPinCodeTextField.otp = v;
          },
      onChanged: (value) {
        print(value);
        setState(() {
          currentText = value;
          CustomPinCodeTextField.otp = value;
        });
      },
      beforeTextPaste: (text) {
        print("Allowing to paste $text");
        //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
        //but you can show anything you want here, like your pop up saying wrong paste format or etc
        return true;
      },
    );
  }
}
