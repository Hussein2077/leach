import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leach/core/resource_manager/asset_path.dart';
import 'package:leach/core/resource_manager/colors.dart';
import 'package:leach/core/resource_manager/string_manager.dart';
import 'package:leach/core/utils/app_size.dart';
import 'package:leach/core/widgets/custom_text_field.dart';
import 'package:leach/core/widgets/icon_with_matrial.dart';
import 'package:leach/core/widgets/loading_widget.dart';
import 'package:leach/features/posts/presentation/manager/comment_manager/comment_bloc.dart';
import 'package:leach/features/posts/presentation/manager/comment_manager/comment_event.dart';
import 'package:leach/features/posts/presentation/manager/comment_manager/comment_state.dart';
import 'package:leach/features/posts/presentation/manager/delete_comment_manager/delete_comment_bloc.dart';
import 'package:leach/features/posts/presentation/manager/delete_comment_manager/delete_comment_state.dart';
import 'comment_row.dart';

class CommentView extends StatefulWidget {
  final String postId;

  const CommentView({super.key, required this.postId});

  @override
  State<CommentView> createState() => _CommentViewState();
}

class _CommentViewState extends State<CommentView> {
  TextEditingController commentController = TextEditingController();

  @override
  void initState() {
    BlocProvider.of<CommentBloc>(context)
        .add(GetCommentsEvent(id: widget.postId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<DeleteCommentBloc, DeleteCommentState>(
      listener: (context, state) {
        if (state is DeleteCommentSuccessState) {
          BlocProvider.of<CommentBloc>(context).add(
              GetCommentsEvent(id: widget.postId));
        } else if (state is DeleteCommentErrorState) {
          BlocProvider.of<CommentBloc>(context).add(
              GetCommentsEvent(id: widget.postId));
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.errorMessage)));
        }
      },
      child: BlocListener<CommentBloc, CommentState>(
        listener: (context, state) {
          if (state is AddCommentSuccessState) {
            BlocProvider.of<CommentBloc>(context).add(
                GetCommentsEvent(id: widget.postId));
          } else if (state is AddCommentErrorState) {
            BlocProvider.of<CommentBloc>(context).add(
                GetCommentsEvent(id: widget.postId));
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.errorMessage)));
          }
        },
        child: Container(
          width: AppSize.screenWidth!,
          height: AppSize.screenHeight! * 0.6,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(246, 255, 255, 1),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(AppSize.defaultSize! * 2.5),
              topRight: Radius.circular(AppSize.defaultSize! * 2.5),
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(AppSize.defaultSize! * 1.5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const IconWithMaterial(
                      imagePath: AssetPath.comment,
                    ),
                    SizedBox(
                      width: AppSize.defaultSize!,
                    ),
                    CustomTextField(
                      controller: commentController,
                      width: AppSize.screenWidth! * .74,
                      height: AppSize.defaultSize! * 4,
                      hintText: StringManager.caption,
                    ),
                    SizedBox(
                      width: AppSize.defaultSize!,
                    ),
                    InkWell(
                      onTap: () {
                        if (commentController.text.isNotEmpty) {
                          BlocProvider.of<CommentBloc>(context).add(
                              AddCommentEvent(
                                  id: widget.postId, comment: commentController
                                  .text));
                          commentController.clear();
                        }
                      },
                      child: Icon(
                        size: AppSize.defaultSize! * 2,
                        Icons.send,
                      ),
                    ),
                  ],
                ),
              ),
              BlocBuilder<CommentBloc, CommentState>(
                builder: (context, state) {
                  if (state is GetCommentSuccessState) {
                    if (state.commentsModel.comments!.data!.isNotEmpty) {
                      return SizedBox(
                        height: AppSize.screenHeight! * 0.5,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: state.commentsModel.comments!.data!.length,
                          itemBuilder: (BuildContext context, int index) {
                            return CommentRow(
                              text: state.commentsModel.comments?.data?[index]
                                  .comment ??
                                  "",
                              font: 'Gully',
                              uuid: state.commentsModel.comments?.data?[index].uuid,
                              image: state.commentsModel.comments?.data?[index]
                                  .user
                                  ?.profilePicture ??
                                  "",
                              color: const Color.fromRGBO(112, 112, 112, 1),
                            );
                          },
                        ),
                      );
                    } else {
                      return Center(
                        child: Text("No comments yet", style: TextStyle(fontSize: AppSize.defaultSize! * 2),),
                      );
                    }
                  } else if (state is GetCommentLoadingState) {
                    return const LoadingWidget(
                      color: AppColors.primaryColor,
                    );
                  } else {
                    return Center(
                      child: Text("No comments yet", style: TextStyle(fontSize: AppSize.defaultSize! * 2),),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
