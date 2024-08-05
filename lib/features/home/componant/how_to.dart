import 'package:flutter/material.dart';
import 'package:leach/core/resource_manager/asset_path.dart';
import 'package:leach/core/resource_manager/colors.dart';
import 'package:leach/core/utils/app_size.dart';

class HowTo extends StatelessWidget {
  const HowTo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(

          child: Stack(
            children: [
              Image.asset(AssetPath.curved,
                width: AppSize.screenWidth,
                fit: BoxFit.fitWidth,
              ),

            ],
          ),

          ),
          Expanded(child: SizedBox()),
          Transform.rotate(
            angle: 3.14,
            child: Image.asset(AssetPath.curved,
              width: AppSize.screenWidth,
              fit: BoxFit.fitWidth,
            ),
          ),
        ],
      ),
    );
  }
}
