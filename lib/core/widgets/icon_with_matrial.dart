import 'package:flutter/material.dart';
import 'package:leach/core/resource_manager/colors.dart';
import 'package:leach/core/utils/app_size.dart';
class IconWithMaterial extends StatelessWidget {
  const IconWithMaterial({super.key, required this.imagePath, this.color, this.color2});
final String imagePath;
final Color? color;
final Color? color2;
  @override
  Widget build(BuildContext context) {
    return    Material(
      color:color?? Colors.white,
      elevation: 10,
      shape: const CircleBorder(),
      child: Padding(
        padding: EdgeInsets.all(AppSize.defaultSize! * .5),
        child: Image.asset(
          imagePath,
          color:color2?? AppColors.primaryColor,
          width: AppSize.defaultSize! * 1.5,
          height: AppSize.defaultSize! * 1.5 ,
        ),
      ),
    );
  }
}
