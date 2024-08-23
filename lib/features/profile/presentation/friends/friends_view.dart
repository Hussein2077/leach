import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leach/core/resource_manager/asset_path.dart';
import 'package:leach/core/resource_manager/routes.dart';
import 'package:leach/core/resource_manager/string_manager.dart';
import 'package:leach/core/utils/app_size.dart';
import 'package:leach/core/widgets/background.dart';
import 'package:leach/core/widgets/cutom_text.dart';
import 'package:leach/core/widgets/icon_with_matrial.dart';
import 'package:leach/core/widgets/leading_icon.dart';
import 'package:leach/core/widgets/loading_widget.dart';
import 'package:leach/core/widgets/snack_bar.dart';
import 'package:leach/features/profile/presentation/controller/friends_manager/friends_bloc.dart';
import 'package:leach/features/profile/presentation/controller/friends_manager/friends_event.dart';
import 'package:leach/features/profile/presentation/controller/get_user_manager/get_user_bloc.dart';
import 'package:leach/features/profile/presentation/controller/get_user_manager/get_user_event.dart';
import 'package:leach/features/profile/presentation/controller/get_user_manager/get_user_state.dart';
import 'package:leach/features/profile/presentation/controller/pending_friend_request_manager/pending_friend_request_bloc.dart';
import 'package:leach/features/profile/presentation/controller/pending_friend_request_manager/pending_friend_request_event.dart';
import 'package:leach/features/profile/presentation/controller/pending_friend_request_manager/pending_friend_request_state.dart';
import 'package:leach/features/profile/presentation/profile/widgets/posts_container.dart';
import 'package:leach/features/profile/presentation/side%20bar/side_bar_row.dart';
import 'package:leach/features/profile/presentation/widget/medals_abd_freinds.dart';
import 'package:leach/features/profile/presentation/widget/profile_user_row.dart';

class FriendsView extends StatefulWidget {
  final String uuid;

  const FriendsView({super.key, required this.uuid});

  @override
  State<FriendsView> createState() => _FriendsViewState();
}

class _FriendsViewState extends State<FriendsView>
    with TickerProviderStateMixin {
  late TabController tabController;

  bool friendsView = false;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    BlocProvider.of<GetUserBloc>(context).add(GetUserEvent(id: widget.uuid));
    super.initState();
  }

  void _showOptionsDialog(BuildContext context) {
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
                SizedBox(
                  height: AppSize.defaultSize! * 0.7,
                ),
                SideBarRow(
                  text: StringManager.unfriendUser.tr(),
                  color: Colors.red,
                  onTap: () {
                    BlocProvider.of<GetFriendRequestBloc>(context)
                        .add(RemoveFriendEvent(id: widget.uuid));
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
                          context, Routes.specificMessagesReport);
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
    return BlocListener<GetFriendRequestBloc, GetFriendRequestState>(
      listener: (context, state) {
        if (state is RemoveFriendSuccessState) {
          setState(() {
            friendsView = true;
          });
          successSnackBar(context, state.message);
          BlocProvider.of<GetFriendsBloc>(context).add(
              const GetFriendsEvent(page: "1"));
        }else if(state is RemoveFriendErrorState){
          errorSnackBar(context, state.errorMessage);
        }else if(state is SendFriendRequestsSuccessState){
          setState(() {
            friendsView = false;
          });
          successSnackBar(context, state.message);
        }else if(state is SendFriendRequestsErrorState){
          errorSnackBar(context, state.errorMessage);
        }
      },
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          body: BackgroundScreen(
            image: AssetPath.homeBackground,
            child: BlocBuilder<GetUserBloc, GetUserState>(
              builder: (context, state) {
                if (state is GetUserSuccessState) {
                  return SafeArea(
                    bottom: false,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: AppSize.defaultSize! * 3.4),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const LeadingIcon(
                                    color: Colors.white,
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      _showOptionsDialog(context);
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
                                friendsView: friendsView,
                                name: state.userDataModel.data?.name ?? "",
                                userName:
                                    state.userDataModel.data?.username ?? "",
                                image:
                                    state.userDataModel.data?.profilePicture ??
                                        "",
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
                                  text: state.userDataModel.data?.bio ?? "",
                                  fontSize: AppSize.defaultSize! * 1.5,
                                  color: Colors.white,
                                  maxLines: 6,
                                  textAlign: TextAlign.start,
                                ),
                              ),
                              MedalsAbdFriends(
                                isFriendView: true,
                                number_of_friends: state
                                        .userDataModel.data?.friends?.length
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
                                    commonType: CommonType(
                                      pictures: state
                                          .userDataModel.data!.posts!.data!
                                          .map((e) => e.picture!)
                                          .toList(),
                                      id: state.userDataModel.data!.posts!.data!
                                          .map((e) => e.id!.toString())
                                          .toList(),
                                    ),
                                  ),
                                  PostsContainer(
                                    addIcon: false,
                                    commonType: CommonType(
                                      pictures: state.userDataModel.data!.pets!
                                          .map((e) => e.profilePicture!)
                                          .toList(),
                                      id: state.userDataModel.data!.pets!
                                          .map((e) => e.id!.toString())
                                          .toList(),
                                    ),
                                  ),
                                ]),
                          ),
                        )
                      ],
                    ),
                  );
                } else if (state is GetUserLoadingState) {
                  return const LoadingWidget();
                } else {
                  return const SizedBox();
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
