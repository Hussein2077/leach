import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leach/core/models/profile_data_model.dart';
import 'package:leach/core/resource_manager/asset_path.dart';
import 'package:leach/core/resource_manager/routes.dart';
import 'package:leach/core/resource_manager/string_manager.dart';
import 'package:leach/core/utils/app_size.dart';
import 'package:leach/core/widgets/cutom_text.dart';
import 'package:leach/core/widgets/icon_with_matrial.dart';
import 'package:leach/core/widgets/leading_icon.dart';
import 'package:leach/features/profile/domain/model/user_data_model.dart';
import 'package:leach/features/profile/presentation/controller/pending_friend_request_manager/pending_friend_request_bloc.dart';
import 'package:leach/features/profile/presentation/controller/pending_friend_request_manager/pending_friend_request_event.dart';
import 'package:leach/features/profile/presentation/profile/widgets/posts_container.dart';
import 'package:leach/features/profile/presentation/side%20bar/side_bar_row.dart';
import 'package:leach/features/profile/presentation/widget/medals_abd_freinds.dart';
import 'package:leach/features/profile/presentation/widget/profile_user_row.dart';

class FriendViewBody extends StatefulWidget {
  final String uuid;
  final UserDataModel userDataModel;
  const FriendViewBody({super.key, required this.uuid, required this.userDataModel});

  @override
  State<FriendViewBody> createState() => _FriendViewBodyState();
}

class _FriendViewBodyState extends State<FriendViewBody> with TickerProviderStateMixin{

  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  void _showOptionsDialog({required BuildContext context, required bool isFriend}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          alignment: Alignment.topCenter,
          backgroundColor: Colors.transparent,
          insetPadding: EdgeInsets.only(top: AppSize.defaultSize! * 5),
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(AppSize.defaultSize! * 2),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SideBarRow(
                  text: StringManager.reportUser.tr(),
                  color: Colors.red,
                  onTap: () {
                    Navigator.of(context).pop();
                    _showReportDialog(context);
                  },
                ),
                Divider(
                  color: Colors.black,
                  height: 5,
                  thickness: 0.6,
                  indent: AppSize.defaultSize! * 2.2,
                  endIndent: AppSize.defaultSize! * 2.8,
                ),
                SizedBox(
                  height: AppSize.defaultSize! * 0.7,
                ),
                SideBarRow(
                  text: StringManager.blockUser.tr(),
                  color: Colors.red,
                  onTap: () {
                    Navigator.of(context).pop();
                    _showBlockDialog(context);
                  },
                ),
                Divider(
                  color: Colors.black,
                  height: 5,
                  thickness: 0.6,
                  indent: AppSize.defaultSize! * 2.2,
                  endIndent: AppSize.defaultSize! * 2.8,
                ),
                if(isFriend)SizedBox(
                  height: AppSize.defaultSize! * 0.7,
                ),
                if(isFriend)SideBarRow(
                  text: StringManager.unfriendUser.tr(),
                  color: Colors.red,
                  onTap: () {
                    BlocProvider.of<GetFriendRequestBloc>(context)
                        .add(RemoveFriendEvent(id: widget.uuid));
                    Navigator.of(context).pop();
                  },
                ),
                if(isFriend)Divider(
                  color: Colors.black,
                  height: 5,
                  thickness: 0.6,
                  indent: AppSize.defaultSize! * 2.2,
                  endIndent: AppSize.defaultSize! * 2.8,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showReportDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            alignment: Alignment.topCenter,
            backgroundColor: Colors.transparent,
            insetPadding: EdgeInsets.only(top: AppSize.defaultSize! * 5),
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(AppSize.defaultSize! * 2),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(AppSize.defaultSize! * 3),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: AppSize.defaultSize! * 1.2,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: AppSize.defaultSize! * 2.2,
                        ),
                        child: CustomText(
                          text: StringManager.reportUser.tr(),
                          fontSize: AppSize.defaultSize! * 2,
                          color: Colors.red,
                          maxLines: 1,
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    color: Colors.black,
                    height: 5,
                    thickness: 0.6,
                    indent: AppSize.defaultSize! * 2.2,
                    endIndent: AppSize.defaultSize! * 2.8,
                  ),
                  SizedBox(
                    height: AppSize.defaultSize! * 0.7,
                  ),
                  SideBarRow(
                    text: StringManager.specificMessages.tr(),
                    onTap: () {
                      Navigator.pushNamed(
                          context, Routes.specificMessagesReport,arguments: widget.uuid );
                    },
                  ),
                  Divider(
                    color: Colors.black,
                    height: 5,
                    thickness: 0.6,
                    indent: AppSize.defaultSize! * 2.2,
                    endIndent: AppSize.defaultSize! * 2.8,
                  ),
                  SizedBox(
                    height: AppSize.defaultSize! * 0.7,
                  ),
                  SideBarRow(
                    text: StringManager.other.tr(),
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.pushNamed(context, Routes.otherReport,  arguments: widget.uuid );
                    },
                  ),
                  Divider(
                    color: Colors.black,
                    height: 5,
                    thickness: 0.6,
                    indent: AppSize.defaultSize! * 2.2,
                    endIndent: AppSize.defaultSize! * 2.8,
                  ),
                ],
              ),
            ),
          );
        });
  }

  void _showBlockDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            alignment: Alignment.topCenter,
            backgroundColor: Colors.transparent,
            insetPadding: EdgeInsets.only(top: AppSize.defaultSize! * 10),
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(AppSize.defaultSize! * 2),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: AppSize.defaultSize! * 1.2,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: AppSize.defaultSize! * 2.2,
                        ),
                        child: CustomText(
                          text: StringManager.areYouSureYouWantToBlockThisUser
                              .tr(),
                          fontSize: AppSize.defaultSize! * 2,
                          maxLines: 1,
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    color: Colors.black,
                    height: 5,
                    thickness: 0.6,
                    indent: AppSize.defaultSize! * 2.2,
                    endIndent: AppSize.defaultSize! * 2.8,
                  ),
                  SizedBox(
                    height: AppSize.defaultSize! * 0.7,
                  ),
                  SideBarRow(
                    text: StringManager.block.tr(),
                    color: Colors.red,
                    onTap: () {
                      BlocProvider.of<GetFriendRequestBloc>(context)
                          .add(BlockUserEvent(id: widget.uuid));
                      Navigator.of(context).pop();
                    },
                  ),
                  Divider(
                    color: Colors.black,
                    height: 5,
                    thickness: 0.6,
                    indent: AppSize.defaultSize! * 2.2,
                    endIndent: AppSize.defaultSize! * 2.8,
                  ),
                  SizedBox(
                    height: AppSize.defaultSize! * 0.7,
                  ),
                  SideBarRow(
                    text: StringManager.cancel.tr(),
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  Divider(
                    color: Colors.black,
                    height: 5,
                    thickness: 0.6,
                    indent: AppSize.defaultSize! * 2.2,
                    endIndent: AppSize.defaultSize! * 2.8,
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSize.defaultSize! * 3.4),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  children: [
                    const LeadingIcon(
                      color: Colors.white,
                    ),
                    if(UserModel.getInstance().uuid != widget.uuid)IconButton(
                      onPressed: () {
                        _showOptionsDialog(context: context, isFriend: widget.userDataModel.data?.isFriend??false);
                      },
                      icon: Image.asset(AssetPath.menuFriend),
                      color: Colors.white,
                    ),
                  ],
                ),
                SizedBox(
                  height: AppSize.defaultSize! * 3,
                ),
                ProfileUserRow(
                  uuid: widget.uuid,
                  friendsView: true,
                  name: widget.userDataModel.data?.name ?? "",
                  userName: widget.userDataModel.data?.username ?? "",
                  image: widget.userDataModel.data?.profilePicture ?? "",
                  isFriend: widget.userDataModel.data?.isFriend??false,
                  friendRequestSent: widget.userDataModel.data?.friendRequestSent??false,
                  friendRequestReceived: widget.userDataModel.data?.friendRequestReceived??false,
                ),
                SizedBox(
                  height: AppSize.defaultSize!,
                ),
                Divider(
                  color: Colors.white,
                  thickness: AppSize.defaultSize! * 0.2,
                  indent: AppSize.defaultSize! * 2,
                  endIndent: AppSize.defaultSize! * 2,
                ),
                SizedBox(
                  height: AppSize.defaultSize! * 2,
                ),
                SizedBox(
                  width: AppSize.screenWidth! * .7,
                  child: CustomText(
                    text: widget.userDataModel.data?.bio ?? "",
                    fontSize: AppSize.defaultSize! * 1.5,
                    color: Colors.white,
                    maxLines: 6,
                    textAlign: TextAlign.start,
                  ),
                ),
                MedalsAbdFriends(
                  isFriendView: true,
                  number_of_friends: widget.userDataModel.data?.friends?.data?.length
                      .toString() ??
                      "0",
                ),
              ],
            ),
          ),
          SizedBox(
            width: AppSize.screenWidth! * .45,
            child: TabBar(
                controller: tabController,
                dividerColor: Colors.transparent,
                indicatorColor: Colors.white,
                indicatorSize: TabBarIndicatorSize.tab,
                tabs: [
                  IconWithMaterial(
                    imagePath: AssetPath.profile,
                    width: AppSize.defaultSize! * 3,
                    height: AppSize.defaultSize! * 3,
                  ),
                  IconWithMaterial(
                    imagePath: AssetPath.petProfile,
                    width: AppSize.defaultSize! * 3,
                    height: AppSize.defaultSize! * 3,
                  ),
                ]),
          ),
          SizedBox(
            height: AppSize.defaultSize!,
          ),
          Expanded(
            child: SizedBox(
              height: AppSize.screenHeight! * .3,
              child: TabBarView(
                controller: tabController,
                children: [
                  PostsContainer(
                    addIcon: false,
                    pets: false,
                    onImageTap: (){
                      Navigator.pushNamed(context, Routes.friendPostPet, arguments: PostPetsParamRoute(images: widget.userDataModel.data!.posts!.data!.map((e) => e.picture!).toList(), body: widget.userDataModel.data!.posts!.data!.map((e) => e.caption!).toList()));
                    },
                    commonType: CommonType(
                      pictures: widget.userDataModel.data!.posts!.data!.map((e) => e.picture!).toList(),
                      ids: widget.userDataModel.data!.posts!.data!.map((e) => e.id!.toString()).toList(),
                    ),
                  ),
                  PostsContainer(
                    addIcon: false,
                    onImageTap: (){
                      Navigator.pushNamed(context, Routes.friendPostPet, arguments: PostPetsParamRoute(images: widget.userDataModel.data!.pets!.map((e) => e.profilePicture!).toList(), body: []));
                    },
                    commonType: CommonType(
                      pictures: widget.userDataModel.data!.pets!.map((e) => e.profilePicture!).toList(),
                      ids: widget.userDataModel.data!.pets!.map((e) => e.id!.toString()).toList(),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
