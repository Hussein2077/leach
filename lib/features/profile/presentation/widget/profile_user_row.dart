import 'package:flutter/material.dart';
import 'package:leach/core/resource_manager/asset_path.dart';
import 'package:leach/core/resource_manager/colors.dart';
import 'package:leach/core/utils/app_size.dart';
import 'package:leach/core/widgets/cached_network_image.dart';
import 'package:leach/core/widgets/cutom_text.dart';
import 'package:leach/features/profile/presentation/friends/friends_view.dart';

class ProfileUserRow extends StatelessWidget {
  const ProfileUserRow(
      {super.key,
      this.name,
      this.userName,
      this.kind,
      this.image,
      this.friendsView = false});

  final String? name;
  final String? userName;
  final String? kind;
  final String? image;
  final bool friendsView;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (image == null||image!.isEmpty)
          CircleAvatar(
            radius: AppSize.defaultSize! * 4,
            backgroundColor: Colors.transparent,
            child: Image.asset(
             AssetPath.whiteProfileIcon,
              width: AppSize.defaultSize! * 8.2,
              height: AppSize.defaultSize! * 8.2,
            ),
          ),
        if (image != null&&image!.isNotEmpty)
          CachedNetworkCustom(
            url: image ?? "",
            width: AppSize.defaultSize! * 8.2,
            height: AppSize.defaultSize! * 8.2,
          ),
        SizedBox(
          width: AppSize.defaultSize! ,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomText(
              text: name ?? 'Hussein',
              fontSize: AppSize.defaultSize! * 3,
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
            if (kind == null)
              CustomText(
                text: userName ?? '@3amk2077',
                fontSize: AppSize.defaultSize! * 1.7,
                color: Colors.white,
              ),
            if (kind != null)
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: userName ?? '@3amk2077',
                    fontSize: AppSize.defaultSize! * 1.7,
                    color: Colors.white,
                  ),
                  CustomText(
                      text: ' | ',
                      fontSize: AppSize.defaultSize! * 1.7,
                      color: AppColors.greyColor),
                  SizedBox(
                    width: AppSize.screenWidth! * .35,
                    child: CustomText(
                      text: kind ?? 'German Shepherd',
                      fontSize: AppSize.defaultSize! * 1.7,
                      color: Colors.white,
                      textAlign: TextAlign.start,
                      maxLines: 2,
                    ),
                  ),
                ],
              )
          ],
        ),
        if (friendsView) const Spacer(),
        if (friendsView)
          Column(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.add,
                    color: Colors.white,
                    size: AppSize.defaultSize! * 3,
                  )),
              CustomText(
                text: 'Add Friend',
                color: Colors.white,
              )
            ],
          )
      ],
    );
  }
}
