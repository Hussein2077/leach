import 'package:flutter/material.dart';
import 'package:leach/core/resource_manager/colors.dart';
import 'package:leach/core/utils/app_size.dart';
import 'package:leach/core/widgets/cutom_text.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    super.key,
    this.onTap,
    this.color,
    this.textColor,
    required this.text,
    this.height,
    this.width,
    this.padding,
    this.fontSize,
    this.fontWeight,
    this.child,
    this.child2,
  });

  final void Function()? onTap;
  final Color? color;
  final Color? textColor;
  final String text;
  final double? height;
  final double? width;
  final double? padding;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Widget? child;
  final Widget? child2;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding ?? 0),
      child: SizedBox(
        height: height ?? AppSize.defaultSize! * 6,
        width: width ?? AppSize.defaultSize! * 35.8,
        child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.zero,
            backgroundColor: color ?? AppColors.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSize.defaultSize! * 4),
            ),
          ),
          child: child2 ??
              (child == null
                  ? CustomText(
                      text: text,
                      color: textColor,
                      fontSize: fontSize ?? AppSize.defaultSize! * 3,
                      fontWeight: fontWeight,
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Spacer(flex: 3),
                        CustomText(
                          text: text,
                          color: textColor,
                          fontSize: fontSize ?? AppSize.defaultSize! * 1.5,
                          fontWeight: fontWeight,
                        ),
                        const Spacer(
                          flex: 2,
                        ),
                        child!,
                      ],
                    )),
        ),
      ),
    );
  }
}
