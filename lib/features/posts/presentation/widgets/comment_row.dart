import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leach/core/models/profile_data_model.dart';
import 'package:leach/core/resource_manager/asset_path.dart';
import 'package:leach/core/resource_manager/string_manager.dart';
import 'package:leach/core/utils/app_size.dart';
import 'package:leach/core/widgets/cached_network_image.dart';
import 'package:leach/core/widgets/cutom_text.dart';
import 'package:leach/features/posts/data/models/comments_model.dart';
import 'package:leach/features/posts/presentation/manager/delete_comment_manager/delete_comment_bloc.dart';
import 'package:leach/features/posts/presentation/manager/delete_comment_manager/delete_comment_event.dart';

class CommentRow extends StatefulWidget {
  final String? font;
  final Color? color;
  final double? textSize;
  final CommentData? commentData;

  final void Function()? onTap;

  const CommentRow(
      {super.key,
      this.textSize,
      this.color,
      this.onTap,
      this.commentData,
      this.font});

  @override
  _CommentRowState createState() => _CommentRowState();
}

class _CommentRowState extends State<CommentRow> {
  bool _isDotsPressed = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: _isDotsPressed
          ? _buildAlternativeContent()
          : Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: AppSize.defaultSize! * 3,
                  ),
                  child: (widget.commentData?.user?.profilePicture == null ||
                          widget.commentData!.user!.profilePicture!.isEmpty)
                      ? Image.asset(
                        AssetPath.whiteProfileIcon,
                        width: AppSize.defaultSize! * 3.8,
                        height: AppSize.defaultSize! * 3.8,
                      )
                      : CachedNetworkCustom(
                          url: widget.commentData?.user?.profilePicture ?? "",
                          width: AppSize.defaultSize! * 3.8,
                          height: AppSize.defaultSize! * 3.8,
                          radius: AppSize.defaultSize! * 10,
                        ),
                ),
                SizedBox(
                  width: AppSize.defaultSize! * 1.2,
                ),
                CustomText(
                  fontFamily: widget.font,
                  text: widget.commentData?.comment ?? "",
                  fontSize: widget.textSize ?? AppSize.defaultSize! * 1.5,
                  color: widget.color,
                  maxLines: 1,
                  textAlign: TextAlign.start,
                ),
                if (widget.commentData!.user!.uuid ==
                    UserModel.getInstance().uuid)
                  const Spacer(),
                if (widget.commentData!.user!.uuid ==
                    UserModel.getInstance().uuid)
                  Padding(
                    padding: EdgeInsets.only(right: AppSize.defaultSize! * 2.5),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _isDotsPressed = true;
                        });
                      },
                      child: Image.asset(AssetPath.dots),
                    ),
                  ),
              ],
            ),
    );
  }

  Widget _buildAlternativeContent() {
    return GestureDetector(
      onTap: () {
        setState(() {
          BlocProvider.of<DeleteCommentBloc>(context)
              .add(DeleteCommentEvent(id: widget.commentData!.uuid!));
          _isDotsPressed = false;
        });
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: AppSize.defaultSize! * 3.8,
            ),
            child: const Image(image: AssetImage(AssetPath.x)),
          ),
          SizedBox(width: AppSize.defaultSize! * 1.2),
          CustomText(
            text: StringManager.deleteComment,
            fontSize: AppSize.defaultSize! * 2.2,
          ),
          const Spacer(),
          Padding(
            padding: EdgeInsets.only(right: AppSize.defaultSize! * 2.5),
            child: Image.asset(AssetPath.dots),
          ),
        ],
      ),
    );
  }
}
