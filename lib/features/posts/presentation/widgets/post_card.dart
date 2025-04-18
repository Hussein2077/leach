import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leach/core/resource_manager/asset_path.dart';
import 'package:leach/core/resource_manager/colors.dart';
import 'package:leach/core/resource_manager/routes.dart';
import 'package:leach/core/resource_manager/string_manager.dart';
import 'package:leach/core/resource_manager/routes.dart';
import 'package:leach/core/utils/app_size.dart';
import 'package:leach/core/widgets/cached_network_image.dart';
import 'package:leach/core/widgets/cutom_text.dart';
import 'package:leach/core/widgets/icon_with_matrial.dart';
import 'package:leach/features/posts/data/models/posts_model.dart';
import 'package:leach/features/posts/presentation/manager/like_post_manager/like_post_bloc.dart';
import 'package:leach/features/posts/presentation/manager/like_post_manager/like_post_event.dart';
import 'comment_view.dart';

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
    return Padding(
        padding: EdgeInsets.symmetric(
            vertical: AppSize.defaultSize!, horizontal: AppSize.defaultSize!),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: AppSize.defaultSize! * 2),
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, Routes.friendsView,
                      arguments: widget.postData.user?.uuid);
                },
                child: Row(
                  children: [
                    CachedNetworkCustom(
                      url: widget.postData.user?.profilePicture ?? "",
                      width: AppSize.defaultSize! * 7,
                      height: AppSize.defaultSize! * 7,
                      radius: AppSize.defaultSize! * 5,
                    ),
                    SizedBox(
                      width: AppSize.defaultSize!,
                    ),
                    CustomText(
                      text: widget.postData.user?.username ?? "",
                      fontSize: AppSize.defaultSize! * 2.6,
                      color: AppColors.primaryColor,
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: AppSize.defaultSize! * 2,
            ),
            if (widget.postData.caption != null)
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: AppSize.defaultSize! * 2),
                child: CustomText(
                  text: widget.postData.caption ?? "",
                  fontSize: AppSize.defaultSize! * 2.1,
                  color: AppColors.primaryColor,
                ),
              ),
            CachedNetworkCustom(
              url: widget.postData.picture ?? "",
              width: AppSize.screenWidth!,
              height: AppSize.defaultSize! * 25,
              shape: BoxShape.rectangle,
              fit: BoxFit.fill,
            ),
            SizedBox(
              height: AppSize.defaultSize! * 3,
            ),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: AppSize.defaultSize! * 3.6),
              child: Row(
                children: [
                  InkWell(
                      onTap: () {
                        if (!isLiked) {
                          BlocProvider.of<LikePostsBloc>(context).add(
                              LikeEvent(id: widget.postData.uuid.toString()));
                        } else {
                          BlocProvider.of<LikePostsBloc>(context).add(
                              UnLikeEvent(id: widget.postData.uuid.toString()));
                        }
                        setState(() {
                          isLiked = !isLiked;
                          widget.postData.liked = isLiked;
                        });
                      },
                      borderRadius:
                          BorderRadius.circular(AppSize.defaultSize! * 1.5),
                      child: IconWithMaterial(
                        width: AppSize.defaultSize!*3,
                        height: AppSize.defaultSize!*3,
                        imagePath: AssetPath.like,
                        color: isLiked ? AppColors.primaryColor : null,
                        color2: isLiked ? Colors.white : null,
                      )),
                  SizedBox(
                    width: AppSize.defaultSize!,
                  ),
                  InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        backgroundColor: Colors.white,
                        isScrollControlled: true,
                        builder: (BuildContext context) {
                          return CommentView(
                              postId: widget.postData.uuid!.toString());
                        },
                      );
                    },
                    borderRadius:
                        BorderRadius.circular(AppSize.defaultSize! * 1.5),
                    child:  IconWithMaterial(
                      width: AppSize.defaultSize!*3,
                      height: AppSize.defaultSize!*3,
                      imagePath: AssetPath.comment,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: AppSize.defaultSize! * 5,
            ),
          ],
        ));
  }
}
