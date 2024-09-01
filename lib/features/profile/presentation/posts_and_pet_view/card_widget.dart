import 'package:dio/dio.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leach/core/resource_manager/asset_path.dart';
import 'package:leach/core/resource_manager/colors.dart';
import 'package:leach/core/resource_manager/routes.dart';
import 'package:leach/core/resource_manager/string_manager.dart';
import 'package:leach/core/utils/app_size.dart';
import 'package:leach/core/widgets/cached_network_image.dart';
import 'package:leach/core/widgets/icon_with_matrial.dart';
import 'package:leach/features/posts/data/models/posts_model.dart';
import 'package:leach/features/posts/presentation/manager/user_posts_manager/user_posts_bloc.dart';
import 'package:leach/features/posts/presentation/manager/user_posts_manager/user_posts_event.dart';
import 'package:leach/features/posts/presentation/widgets/comment_view.dart';
import 'package:leach/features/profile/presentation/side%20bar/side_bar_row.dart';

class CardWidget extends StatefulWidget {
  final PostData data;
  const CardWidget({super.key, required this.data});

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {

  late List<SideBarRow> items;
  SideBarRow? selectedValue;

  List<DropdownMenuItem<SideBarRow>> _addDividersAfterItems(
      List<SideBarRow> items) {
    final List<DropdownMenuItem<SideBarRow>> menuItems = [];
    for (final SideBarRow item in items) {
      menuItems.addAll([
        DropdownMenuItem<SideBarRow>(
          value: item,
          child: item,
        ),
      ],
      );
    }
    return menuItems;
  }

  void _showTurnOffCommentingDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.defaultSize! * 4),
          ),
          contentPadding: EdgeInsets.all(AppSize.defaultSize! * 3),
          backgroundColor: const Color.fromRGBO(246, 255, 255, 1),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                StringManager.turnOffCommenting.tr(),
                style: TextStyle(
                  fontSize: AppSize.defaultSize! * 2.5,
                  color: AppColors.primaryColor,
                ),
              ),
              SizedBox(height: AppSize.defaultSize! * 2),
              Text(
                "Are you sure you want to turn off commenting on this post?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: AppSize.defaultSize! * 2,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: AppSize.defaultSize! * 3),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Dismiss dialog
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[400],
                      shape: RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.circular(AppSize.defaultSize! * 2),
                      ),
                    ),
                    child: const Text("Cancel", style: TextStyle(color: Colors.white),),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<UserPostsBloc>(context).add(
                        EditeUserPostEvent(
                          id: widget.data.uuid!,
                          data: FormData.fromMap({
                            "comments_allowed": 0,
                          }),
                        ),
                      );
                      Navigator.of(context).pop(); // Dismiss dialog
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.circular(AppSize.defaultSize! * 2),
                      ),
                    ),
                    child: const Text("Turn Off", style: TextStyle(color: Colors.white),),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  void _showTurnOnCommentingDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.defaultSize! * 4),
          ),
          contentPadding: EdgeInsets.all(AppSize.defaultSize! * 3),
          backgroundColor: const Color.fromRGBO(246, 255, 255, 1),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                StringManager.turnOffCommenting.tr(),
                style: TextStyle(
                  fontSize: AppSize.defaultSize! * 2.5,
                  color: AppColors.primaryColor,
                ),
              ),
              SizedBox(height: AppSize.defaultSize! * 2),
              Text(
                "Are you sure you want to turn on commenting on this post?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: AppSize.defaultSize! * 2,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: AppSize.defaultSize! * 3),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Dismiss dialog
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[400],
                      shape: RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.circular(AppSize.defaultSize! * 2),
                      ),
                    ),
                    child: const Text("Cancel", style: TextStyle(color: Colors.white),),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<UserPostsBloc>(context).add(
                        EditeUserPostEvent(
                          id: widget.data.uuid!,
                          data: FormData.fromMap({
                            "comments_allowed": 1,
                          }),
                        ),
                      );
                      Navigator.of(context).pop(); // Dismiss dialog
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.circular(AppSize.defaultSize! * 2),
                      ),
                    ),
                    child: const Text("Turn On", style: TextStyle(color: Colors.white),),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }


  @override
  void initState() {
    isLiked = widget.data.liked ?? false;
    items = [
      SideBarRow(
        textSize: AppSize.defaultSize! * 2.8,
        image: AssetPath.edit,
        text: StringManager.editPost.tr(),
        onTap: () {
          Navigator.pushNamed(context, Routes.editPost, arguments: widget.data);
        },
      ),
      if(widget.data.comments_allowed == 1) SideBarRow(
        textSize: AppSize.defaultSize! * 2.8,
        image: AssetPath.messageX,
        text: StringManager.turnOffCommenting.tr(),
        onTap: () {
          _showTurnOffCommentingDialog(context);
        },
      ),
      if(widget.data.comments_allowed == 0) SideBarRow(
        textSize: AppSize.defaultSize! * 2.8,
        image: AssetPath.messageX,
        text: StringManager.turnOnCommenting.tr(),
        onTap: () {
          _showTurnOnCommentingDialog(context);
        },
      ),
      SideBarRow(
        textSize: AppSize.defaultSize! * 2.8,
        image: AssetPath.x,
        text: StringManager.deletePost.tr(),
        onTap: () {
          BlocProvider.of<UserPostsBloc>(context).add(DeleteUserPostEvent(id: widget.data.uuid!));
          Navigator.of(context).pop();
        },
      ),
    ];
    super.initState();
  }

  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              height: AppSize.defaultSize! * 3,
            ),
            DropdownButtonHideUnderline(
              child: DropdownButton2<SideBarRow>(
                customButton: Image.asset(
                  AssetPath.menuFriend,
                  color: AppColors.primaryColor,
                ),
                items: _addDividersAfterItems(items),
                value: selectedValue,
                onChanged: (SideBarRow? value) {
                  setState(() {
                    selectedValue = value;
                    value?.onTap?.call();
                  });
                },
                dropdownStyleData: DropdownStyleData(
                  width: AppSize.screenWidth!,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        AppSize.defaultSize! * 4),
                    color: const Color.fromRGBO(
                        246, 255, 255, 1),
                  ),
                ),
              ),
            ),
          ],
        ),

        CachedNetworkCustom(
          url: widget.data.picture??"",
          width: AppSize.screenWidth!,
          height: AppSize.defaultSize! * 20,
          shape: BoxShape.rectangle,
        ),

        SizedBox(
          height: AppSize.defaultSize! * 2,
        ),
        Row(
          children: [
            InkWell(
              onTap: () {
                isLiked = !isLiked;
                setState(() {});
              },
              borderRadius: BorderRadius.circular(
                  AppSize.defaultSize! * 1.5),
              child: IconWithMaterial(
                imagePath: AssetPath.like,
                color: isLiked
                    ? AppColors.primaryColor
                    : null,
                elevation: 3,
                color2: isLiked ? Colors.white : null,
                width: AppSize.defaultSize! * 2,
                height: AppSize.defaultSize! * 2,
              ),
            ),
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
                    return CommentView(postId: widget.data.uuid!.toString());
                  },
                );
              },
              borderRadius: BorderRadius.circular(
                  AppSize.defaultSize! * 1.5),
              child: IconWithMaterial(
                imagePath: AssetPath.comment,
                elevation: 3,
                width: AppSize.defaultSize! * 2,
                height: AppSize.defaultSize! * 2,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
