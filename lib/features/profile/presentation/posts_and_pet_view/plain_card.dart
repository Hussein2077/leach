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
import 'package:leach/features/profile/presentation/side%20bar/side_bar_row.dart';

class PlainCard extends StatefulWidget {

  const PlainCard({super.key});

  @override
  State<PlainCard> createState() => _PlainCardState();
}

class _PlainCardState extends State<PlainCard> {

  late List<SideBarRow> items;

  @override
  void initState() {
    super.initState();
  }


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
          ],
        ),

        Image.asset(AssetPath.cat),
        // CachedNetworkCustom(
        //   url: widget.data.picture??"",
        //   width: AppSize.screenWidth!,
        //   height: AppSize.defaultSize! * 20,
        //   shape: BoxShape.rectangle,
        // ),

        SizedBox(
          height: AppSize.defaultSize! * 2,
        ),
      ],
    );
  }
}
