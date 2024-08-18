import 'package:flutter/material.dart';
import 'package:leach/core/resource_manager/colors.dart';
import 'package:leach/core/utils/app_size.dart';

class CustomTextField extends StatefulWidget {
  final String? labelText;
  final String? hintText;
  final double? width;
  final double? height;
  final int? maxLines;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final bool readOnly;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color? fillColor;
  final void Function()? onTap;
  final void Function(String)? onChanged;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle ;
  final TextStyle? textStyle ;
  final GlobalKey<FormState>? formKey;

  const CustomTextField({
    super.key,
    this.labelText,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.readOnly = false,
    this.prefixIcon,
    this.suffixIcon,
    this.onTap,
    this.hintText,
    this.hintStyle,
    this.labelStyle,
    this.width,
    this.height,
    this.maxLines,
    this.formKey,
    this.fillColor,
    this.onChanged,
    this.textStyle
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height ?? AppSize.defaultSize! * 7.5,
      width: widget.width ?? double.maxFinite,
      child: TextFormField(
        onTap: widget.onTap,
        style:  widget.textStyle??TextStyle(
          fontSize: AppSize.defaultSize! * 1.5,

        ),
        onChanged: widget.onChanged ,

        maxLines: widget.maxLines,
        readOnly: widget.readOnly,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please complete this field';
          }
          return null;
        },

        decoration: InputDecoration(
          labelText: widget.labelText,

          fillColor: widget.fillColor,


          filled: widget.fillColor != null ? true : false,
          hintText: widget.hintText,
          hintStyle: widget.hintStyle??TextStyle(
            fontSize: AppSize.defaultSize! * 1.5,
fontFamily: 'Gully',
            color: AppColors.greyColor,
          ),

          suffixIcon: widget.suffixIcon,
          contentPadding: EdgeInsets.symmetric(vertical: AppSize.defaultSize!*1, horizontal:  AppSize.defaultSize!),
          labelStyle: widget.labelStyle ?? TextStyle(
            color: AppColors.greyColor,
            fontSize: AppSize.screenHeight! * .015,
          ),
          prefixIcon: widget.prefixIcon,
          enabledBorder: OutlineInputBorder(
            borderRadius:
                BorderRadius.all(Radius.circular(AppSize.defaultSize! * 2.5)),
            borderSide:
                BorderSide(color: AppColors.greyColor.withOpacity(.4)),
          ),
          border: OutlineInputBorder(
            borderRadius:
                BorderRadius.all(Radius.circular(AppSize.defaultSize! * 2.5)),
            borderSide:
                const BorderSide(color: AppColors.greyColor ),
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                  Radius.circular(AppSize.defaultSize! * 2.5)),
              borderSide:
                  const BorderSide(color: AppColors.primaryColor  )),
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                  Radius.circular(AppSize.defaultSize! * 2.5)),
              borderSide:
                  const BorderSide(color: AppColors.greyColor )),
        ),
        controller: widget.controller,

        keyboardType: widget.keyboardType,
        obscureText: widget.obscureText,
      ),
    );
  }
}
