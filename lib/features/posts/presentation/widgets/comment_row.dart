import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:leach/core/resource_manager/asset_path.dart';
import 'package:leach/core/resource_manager/routes.dart';
import 'package:leach/core/resource_manager/string_manager.dart';
import 'package:leach/core/utils/app_size.dart';
import 'package:leach/core/widgets/cached_network_image.dart';
import 'package:leach/core/widgets/cutom_text.dart';

class CommentRow extends StatefulWidget {
  final String text;
  final String? font;
  final Color? color;
  final double? textSize;

  final void Function()? onTap;

  const CommentRow(
      {super.key,
        this.textSize,
        required this.text,
        this.color,
        this.onTap,
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
            child: CachedNetworkCustom(
              url: "",
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
            text: widget.text,
            fontSize: widget.textSize ?? AppSize.defaultSize! * 1.5,
            color: widget.color,
            maxLines: 1,
            textAlign: TextAlign.start,
          ),
          Spacer(),
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

    return Container(
      child: GestureDetector(
        onTap: () {
          setState(() {
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
              child: Image(image: AssetImage(AssetPath.x)),
            ),
            SizedBox(width: AppSize.defaultSize! * 1.2),
            CustomText(text: StringManager.deleteComment,
            fontSize: AppSize.defaultSize! * 2.2,
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.only(right: AppSize.defaultSize! * 2.5),
              child: Image.asset(AssetPath.dots),
            ),
          ],
        ),
      ),
    );
  }
}
