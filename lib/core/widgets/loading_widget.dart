import 'package:flutter/material.dart';
import 'package:leach/core/resource_manager/colors.dart';
import 'package:leach/core/utils/app_size.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key, this.height, this.width, this.size});
final double? height;
final double? width;
final double? size;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height:height,
        width:width,

      ),
    );
  }
}
