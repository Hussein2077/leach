import 'package:flutter/material.dart';
import 'package:leach/core/resource_manager/asset_path.dart';
import 'package:leach/core/resource_manager/colors.dart';
import 'package:leach/core/resource_manager/string_manager.dart';
import 'package:leach/core/utils/app_size.dart';
import 'package:leach/core/widgets/cached_network_image.dart';
import 'package:leach/core/widgets/custom_text_field.dart';
import 'package:leach/core/widgets/cutom_text.dart';
import 'package:leach/core/widgets/icon_with_matrial.dart';
import 'package:leach/features/posts/data/models/posts_model.dart';

class PostCard extends StatefulWidget {
  final PostData postData;
  const PostCard({super.key, required this.postData});

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSize.defaultSize! * 3.6),
          child: Row(
            children: [

              CachedNetworkCustom(
                url: widget.postData.user?.profilePicture??"",
                width: AppSize.defaultSize! * 3,
                height: AppSize.defaultSize! * 3,
                radius: AppSize.defaultSize! * 3,
              ),

              SizedBox(
                width: AppSize.defaultSize!,
              ),

              CustomText(
                text: widget.postData.user?.username??"",
                fontSize: AppSize.defaultSize! * 2,
                color: AppColors.primaryColor,
              )
            ],
          ),
        ),
        SizedBox(
          height: AppSize.defaultSize! * 2,
        ),

        CachedNetworkCustom(
          url: widget.postData.picture??"",
          width: AppSize.screenWidth!,
          height: AppSize.defaultSize! * 20,
        ),

        SizedBox(
          height: AppSize.defaultSize! * 3,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSize.defaultSize! * 3.6),
          child: Row(
            children: [
              InkWell(
                  onTap: () {
                    isLiked = !isLiked;
                    setState(() {});
                  },
                  borderRadius:
                      BorderRadius.circular(AppSize.defaultSize! * 1.5),
                  child: IconWithMaterial(
                    imagePath: AssetPath.like,
                    color: isLiked ? AppColors.primaryColor : null,
                    color2: isLiked ? Colors.white : null,
                  )),
              SizedBox(
                width: AppSize.defaultSize!,
              ),
              InkWell(
                  onTap: () {},
                  borderRadius:
                      BorderRadius.circular(AppSize.defaultSize! * 1.5),
                  child: const IconWithMaterial(
                    imagePath: AssetPath.comment,
                  )),
              SizedBox(
                width: AppSize.defaultSize!,
              ),
              CustomTextField(
                width: AppSize.screenWidth! * .65,
                height: AppSize.defaultSize! * 2.6,
                hintText: StringManager.comment,
              ),
            ],
          ),
        ),
        SizedBox(
          height: AppSize.defaultSize! * 5,
        ),
      ],
    );
  }
}
