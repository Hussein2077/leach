import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leach/core/resource_manager/asset_path.dart';
import 'package:leach/core/resource_manager/colors.dart';
import 'package:leach/core/resource_manager/string_manager.dart';
import 'package:leach/core/utils/app_size.dart';
import 'package:leach/core/widgets/cached_network_image.dart';
import 'package:leach/core/widgets/custom_text_field.dart';
import 'package:leach/core/widgets/cutom_text.dart';
import 'package:leach/core/widgets/icon_with_matrial.dart';
import 'package:leach/features/posts/data/models/posts_model.dart';
import 'package:leach/features/posts/presentation/manager/like_post_manager/like_post_bloc.dart';
import 'package:leach/features/posts/presentation/manager/like_post_manager/like_post_event.dart';

class PostCard extends StatefulWidget {
  final PostData postData;
  const PostCard({super.key, required this.postData});

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  bool isLiked = false;

  @override
  void initState() {
    isLiked = widget.postData.liked ?? false;
    super.initState();
  }

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
                    if(isLiked){
                      BlocProvider.of<LikePostsBloc>(context).add(LikeEvent(id: widget.postData.id.toString()));
                    }else{
                      BlocProvider.of<LikePostsBloc>(context).add(UnLikeEvent(id: widget.postData.id.toString()));
                    }
                    setState(() {
                      isLiked = !isLiked;
                      widget.postData.liked = isLiked;
                    });
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
