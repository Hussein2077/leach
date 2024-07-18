import 'package:flutter/material.dart';
import 'package:leach/core/resource_manager/colors.dart';
import 'package:leach/core/utils/app_size.dart';
import 'package:leach/core/widgets/custom_text_field.dart';
import 'package:leach/core/widgets/cutom_text.dart';

class ColumnWithTextField extends StatefulWidget {
  const ColumnWithTextField({
    super.key,
    required this.text,
      this.controller,
    this.width,
    this.height,
    this.readOnly = false,
    this.obscureText = false,
    this.onTap,
    this.labelText,
    this.hintText,
    this.suffixIcon,
    this.child,
    this.keyboardType = TextInputType.text, this.formKey,
  });
  final  GlobalKey<FormState>? formKey ;

  final String text;
  final String? labelText;
  final String? hintText;
  final double? width;
  final double? height;
  final bool readOnly;
  final bool obscureText;
  final Widget? suffixIcon;
  final Widget? child;
  final void Function()? onTap;
  final TextInputType keyboardType;

  final TextEditingController? controller;

  @override
  State<ColumnWithTextField> createState() => _ColumnWithTextFieldState();
}

class _ColumnWithTextFieldState extends State<ColumnWithTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: AppSize.defaultSize! * 2.5,
        ),
        CustomText(
          text:
          widget.text,
          fontSize: AppSize.defaultSize! * 2,
          color: AppColors.primaryColor,

        ),

        SizedBox(
          height: AppSize.defaultSize! * .3,
        ),

        SizedBox(
            width: widget.width ?? AppSize.screenWidth! * .9,
             child: widget.child?? CustomTextField(
              formKey: widget.formKey,
              height: widget.height ?? AppSize.defaultSize! * 6.5,
              controller: widget.controller,
              readOnly: widget.readOnly,
              onTap: widget.onTap,
              labelText: widget.labelText,
              obscureText:    widget.obscureText,
              hintText: widget.hintText,
              suffixIcon: widget.suffixIcon,
              keyboardType: widget.keyboardType,
              maxLines: 1,
            )),

      ],
    );
  }
}
