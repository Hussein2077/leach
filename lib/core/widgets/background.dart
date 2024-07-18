import 'package:flutter/material.dart';
import 'package:leach/core/resource_manager/asset_path.dart';
import 'package:leach/core/utils/app_size.dart';
class BackgroundScreen extends StatelessWidget {
  const BackgroundScreen({super.key, required this.child, this.image});
final Widget child;
final String? image  ;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
            width: AppSize.screenWidth,
            height: AppSize.screenHeight,
            child: Image.asset(image??AssetPath.welcomeImage2,fit: BoxFit.fill, )),
        child
      ],
    );
  }
}
