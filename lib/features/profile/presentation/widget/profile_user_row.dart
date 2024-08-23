import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leach/core/resource_manager/asset_path.dart';
import 'package:leach/core/resource_manager/colors.dart';
import 'package:leach/core/utils/app_size.dart';
import 'package:leach/core/widgets/cached_network_image.dart';
import 'package:leach/core/widgets/cutom_text.dart';
import 'package:leach/features/profile/presentation/controller/pending_friend_request_manager/pending_friend_request_bloc.dart';
import 'package:leach/features/profile/presentation/controller/pending_friend_request_manager/pending_friend_request_event.dart';

class ProfileUserRow extends StatelessWidget {
  const ProfileUserRow(
      {super.key,
      this.name,
      this.userName,
      this.kind,
      this.image,
      this.uuid,
      this.friendsView = false});

  final String? name;
  final String? userName;
  final String? kind;
  final String? image;
  final String? uuid;
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
            url: image !,
            width: AppSize.defaultSize! * 8.2,
            height: AppSize.defaultSize! * 8.2,
          ),
        SizedBox(
          width: AppSize.defaultSize!,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomText(
              text: name!,
              fontSize: AppSize.defaultSize! * 3,
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
            if (kind == null)
              CustomText(
                text: userName!,
                fontSize: AppSize.defaultSize! * 2,
                color: Colors.white,
              ),
            if (kind != null)
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: userName!,
                    fontSize: AppSize.defaultSize! * 2,
                    color: Colors.white,
                  ),
                  CustomText(
                      text: ' | ',
                      fontSize: AppSize.defaultSize! * 1.7,
                      color: AppColors.greyColor),
                  SizedBox(
                    width: AppSize.screenWidth! * .35,
                    child: CustomText(
                      text: kind ?? '',
                      fontSize: AppSize.defaultSize! * 2,
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
                  onPressed: () {
                    BlocProvider.of<GetFriendRequestBloc>(context)
                        .add(SendFriendRequestEvent(id: uuid!));
                  },
                  icon: Icon(
                    Icons.add,
                    color: Colors.white,
                    size: AppSize.defaultSize! * 3,
                  )),
              const CustomText(
                text: 'Add Friend',
                color: Colors.white,
              )
            ],
          )
      ],
    );
  }
}
