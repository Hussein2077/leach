import 'package:flutter/material.dart';
import 'package:leach/core/resource_manager/asset_path.dart';
import 'package:leach/core/utils/app_size.dart';
import 'package:leach/core/widgets/icon_with_matrial.dart';
class PostsContainer extends StatelessWidget {
  const PostsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
        height: AppSize.screenHeight! * .33,
        width: AppSize.screenWidth!,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(AppSize.defaultSize! * 4),
                topRight: Radius.circular(AppSize.defaultSize! * 4))),
        child: Stack(
          children: [
            GridView.builder(
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                padding: EdgeInsets.all(AppSize.defaultSize! * 2),
                itemBuilder: (context, i) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius:
                      BorderRadius.circular(AppSize.defaultSize!),
                    ),
                    child: Image.asset(AssetPath.testPosts4),
                  );
                }),
            Padding(
              padding: EdgeInsets.only(
                  top: AppSize.defaultSize! * .5,
                  right: AppSize.defaultSize! * 2),
              child: Align(
                alignment: Alignment.topRight,
                child: IconWithMaterial(
                  imagePath: AssetPath.add,
                  width: AppSize.defaultSize! * 4,
                  height: AppSize.defaultSize! * 4,
                ),
              ),
            )
          ],
        ));
  }
}
