import 'package:flutter/material.dart';
import 'package:leach/core/resource_manager/colors.dart';
import 'package:leach/core/utils/app_size.dart';
class CustomText extends StatelessWidget {
  final String text;
  final String?  fontFamily;
  final Color? color;
  final Color? decorationColor;
  final double? fontSize;
  final double? lineHeight;
  final TextAlign? textAlign;
  final int? maxLines;
  final double? height;
  final FontWeight? fontWeight;
  final TextDecoration? textDecoration;
  final TextOverflow? overflow;
  final List<Shadow>? shadows;

  const CustomText(
      {super.key,
        required this.text,
        this.fontFamily,
        this.color,
        this.fontSize,
        this.fontWeight,
        this.textAlign,
        this.height,
        this.textDecoration,
        this.maxLines,
        this.overflow,
        this.shadows, this.decorationColor, this.lineHeight,});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        height: lineHeight,
fontFamily:fontFamily?? 'Brodien',
        color: color ?? AppColors.primaryColor,
        decoration: textDecoration ?? TextDecoration.none,

            fontSize: fontSize??AppSize.defaultSize! * 1.4,
        shadows: shadows,
      decorationColor:decorationColor ,
      decorationThickness: 2,
      fontWeight: fontWeight ?? FontWeight.w400,
      ),
      overflow: overflow ?? TextOverflow.ellipsis,
      maxLines: maxLines,
      textAlign: textAlign ?? TextAlign.center,
    );
  }
}
