import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:leach/core/resource_manager/asset_path.dart';
import 'package:leach/core/resource_manager/routes.dart';
import 'package:leach/core/utils/app_size.dart';
import 'package:leach/core/widgets/cached_network_image.dart';
import 'package:leach/core/widgets/cutom_text.dart';
import 'package:leach/core/widgets/icon_with_matrial.dart';

class PostsContainer extends StatelessWidget {
  const PostsContainer(
      {super.key,
      this.addIcon = true,
      this.pets = false,
      required this.commonType,
      this.onImageTap});

  final CommonType commonType;
  final bool addIcon;
  final bool pets;
  final Function()? onImageTap;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: AppSize.screenWidth!,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(AppSize.defaultSize! * 4),
                topRight: Radius.circular(AppSize.defaultSize! * 4))),
        child: Stack(
          children: [
            commonType.pictures.isNotEmpty
                ? GridView.builder(
                    itemCount: commonType.pictures.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3),
                    padding: EdgeInsets.all(AppSize.defaultSize! * 2),
                    itemBuilder: (context, i) {
                      return Padding(
                        padding: EdgeInsets.all(AppSize.defaultSize!),
                        child: InkWell(
                          onTap: onImageTap ??
                              () {
                                Navigator.pushNamed(
                                    context, Routes.postsViewProfile);
                              },
                          child: CachedNetworkCustom(
                            url: commonType.pictures[i],
                            width: AppSize.defaultSize! * 11,
                            height: AppSize.defaultSize! * 11,
                            shape: BoxShape.rectangle,
                          ),
                        ),
                      );
                    },
                  )
                : Center(
                    child: CustomText(
                        text: "No Data Found",
                        fontSize: AppSize.defaultSize! * 2.5),
                  ),
            if (addIcon)
              GestureDetector(
                onTap: () {
                  if (pets) {
                    Navigator.pushNamed(context, Routes.addPhotoForPet,
                        arguments: commonType.petId);
                  } else {
                    Navigator.pushNamed(context, Routes.addPost);
                  }
                },
                child: Padding(
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
                ),
              )
          ],
        ));
  }
}
