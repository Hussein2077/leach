import 'package:flutter/cupertino.dart';
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
      this.isFriend,
      this.friendRequestSent,
      this.friendRequestReceived,
      this.friendsView = false});

  final String? name;
  final String? userName;
  final String? kind;
  final String? image;
  final String? uuid;
  final bool friendsView;
  final bool? isFriend;
  final bool? friendRequestSent;
  final bool? friendRequestReceived;

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
        if (friendsView) friendButton(context: context),
      ],
    );
  }

  Widget friendButton({required BuildContext context}){
    if(isFriend!){
      return const SizedBox();
    }else if(friendRequestSent!){
      return Column(
        children: [
          IconButton(
              onPressed: (){
                BlocProvider.of<GetFriendRequestBloc>(context).add(RemoveFriendEvent(id: uuid!));
              },
              icon: Icon(
                Icons.watch_later_outlined,
                color: Colors.white,
                size: AppSize.defaultSize! * 3,
              )),
          const CustomText(
            text: 'pending',
            color: Colors.white,
          )
        ],
      );
    }else if(friendRequestReceived!){
      return Row(
        children: [
          Column(
            children: [
              IconButton(
                  onPressed: () {
                    BlocProvider.of<GetFriendRequestBloc>(context).add(AcceptFriendRequestEvent(id: uuid!));
                  },
                  icon: Icon(
                    Icons.add,
                    color: Colors.white,
                    size: AppSize.defaultSize! * 3,
                  )),
              const CustomText(
                text: 'Accept',
                color: Colors.white,
              )
            ],
          ),
          SizedBox(
            width: AppSize.defaultSize! * 2,
          ),
          Column(
            children: [
              IconButton(
                  onPressed: () {
                    BlocProvider.of<GetFriendRequestBloc>(context).add(RejectFriendRequestEvent(id: uuid!));
                  },
                  icon: Icon(
                    Icons.add,
                    color: Colors.white,
                    size: AppSize.defaultSize! * 3,
                  )),
              const CustomText(
                text: 'Reject',
                color: Colors.white,
              )
            ],
          )
        ],
      );
    }else{
     return Column(
       children: [
         IconButton(
             onPressed: () {
               BlocProvider.of<GetFriendRequestBloc>(context).add(SendFriendRequestEvent(id: uuid!));
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
     );
    }
  }

}
