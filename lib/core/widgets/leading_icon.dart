import 'package:flutter/material.dart';
import 'package:leach/core/resource_manager/asset_path.dart';
class LeadingIcon extends StatelessWidget {
  const LeadingIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return  InkWell(onTap: (){
      Navigator.of(context).pop();
    }, child:  Image.asset(AssetPath.leadingIcon));
  }
}
