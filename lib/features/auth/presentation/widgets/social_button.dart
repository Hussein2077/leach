import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:leach/core/utils/app_size.dart';

class CustomElevatedButton extends StatelessWidget {
  final String assetPath;
  final VoidCallback onPressed;

  const CustomElevatedButton({
    super.key,
    required this.assetPath,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppSize.defaultSize! * 7,
      height: AppSize.defaultSize! * 7,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
                AppSize.defaultSize! * 1.2), // Border radius
          ),
        ),
        onPressed: onPressed,
        child: SvgPicture.asset(
          assetPath,
          height: AppSize.defaultSize! * 5,
        ),
      ),
    );
  }
}
