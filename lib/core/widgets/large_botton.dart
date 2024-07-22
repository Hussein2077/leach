import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:leach/core/resource_manager/colors.dart';
import 'package:leach/core/resource_manager/string_manager.dart';
import 'package:leach/core/utils/app_size.dart';
import 'package:leach/core/widgets/cutom_text.dart';
class LargeButton extends StatelessWidget {
  const LargeButton({super.key,   this.child, this.onPressed, required this.text});
final Widget? child;
final Function()? onPressed;
final String text;
  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(
      onPressed: onPressed ?? (){},

      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,


        shape: RoundedRectangleBorder(
          borderRadius:
          BorderRadius.circular(AppSize.defaultSize! * 2.5),

          side: BorderSide.none

        ),
        maximumSize: Size(
          AppSize.defaultSize! * 26.6,
          AppSize.defaultSize! * 22.2,
        ),
        minimumSize: Size(
          AppSize.defaultSize! * 26.6,
          AppSize.defaultSize! * 22.2,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          if (child != null)
          child!,

          CustomText(
            text: text,
            fontSize: AppSize.defaultSize! * 4,
            fontWeight: FontWeight.w700,
          ),
        ],
      ),
    );
  }
}
