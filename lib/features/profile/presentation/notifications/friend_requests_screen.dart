import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:leach/core/resource_manager/asset_path.dart';
import 'package:leach/core/resource_manager/string_manager.dart';
import 'package:leach/core/utils/app_size.dart';
import 'package:leach/core/widgets/background.dart';
import 'package:leach/core/widgets/cached_network_image.dart';
import 'package:leach/core/widgets/leading_icon.dart';
import 'package:leach/core/widgets/loading_widget.dart';
import 'package:leach/core/widgets/snack_bar.dart';
import 'package:leach/features/profile/presentation/controller/pending_friend_request_manager/pending_friend_request_bloc.dart';
import 'package:leach/features/profile/presentation/controller/pending_friend_request_manager/pending_friend_request_event.dart';
import 'package:leach/features/profile/presentation/controller/pending_friend_request_manager/pending_friend_request_state.dart';

class FriendRequestsScreen extends StatefulWidget {
  const FriendRequestsScreen({super.key});

  @override
  State<FriendRequestsScreen> createState() => _FriendRequestsScreenState();
}

class _FriendRequestsScreenState extends State<FriendRequestsScreen> {
  @override
  void initState() {
    BlocProvider.of<GetFriendRequestBloc>(context)
        .add(const GetFriendRequestEvent(page: "1"));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<GetFriendRequestBloc, GetFriendRequestState>(
      listener: (context, state) {
        if(state is AcceptFriendRequestsSuccessState){
          BlocProvider.of<GetFriendRequestBloc>(context)
              .add(const GetFriendRequestEvent(page: "1"));
        }else if(state is RejectFriendRequestsSuccessState){
          BlocProvider.of<GetFriendRequestBloc>(context)
              .add(const GetFriendRequestEvent(page: "1"));
        }else if(state is AcceptFriendRequestsErrorState){
          errorSnackBar(context, state.errorMessage);
          BlocProvider.of<GetFriendRequestBloc>(context)
              .add(const GetFriendRequestEvent(page: "1"));
        }else if(state is RejectFriendRequestsErrorState){
          errorSnackBar(context, state.errorMessage);
          BlocProvider.of<GetFriendRequestBloc>(context)
              .add(const GetFriendRequestEvent(page: "1"));
        }
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: BackgroundScreen(
          image: AssetPath.homeBackground,
          child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: AppSize.defaultSize! * 3.4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: AppSize.defaultSize! * 8,
                ),
                Row(
                  children: [
                    const LeadingIcon(
                      color: Colors.white,
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.notifications,
                        size: AppSize.defaultSize! * 3.5,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: AppSize.defaultSize! * 2,
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      AssetPath.pet2Leg,
                      width: AppSize.defaultSize! * 1,
                      height: AppSize.defaultSize! * 1.5,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: AppSize.defaultSize! * 2,
                    ),
                    Text(
                      StringManager.friendRequests.tr(),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: AppSize.defaultSize! * 2.5,
                          fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
                Container(
                  width: AppSize.screenWidth,
                  height: 1,
                  color: Colors.white,
                ),
                Expanded(
                  child:
                      BlocBuilder<GetFriendRequestBloc, GetFriendRequestState>(
                    builder: (context, state) {
                      if (state is GetFriendRequestsSuccessState) {
                        return ListView.separated(
                          shrinkWrap: true,
                          itemBuilder: (context, index) => Column(
                            children: [
                              Row(
                                children: [
                                  CachedNetworkCustom(
                                    url: state
                                            .pendingFriendRequestsModel
                                            .data!
                                            .friends!
                                            .data![index]
                                            .user1ProfilePicture ??
                                        "",
                                    width: AppSize.defaultSize! * 4,
                                    height: AppSize.defaultSize! * 4,
                                    radius: AppSize.defaultSize! * 10,
                                  ),
                                  SizedBox(
                                    width: AppSize.defaultSize! * 1,
                                  ),
                                  ConstrainedBox(
                                    constraints: BoxConstraints(
                                      minWidth: AppSize.defaultSize!,
                                      maxWidth: AppSize.defaultSize! * 18,
                                    ),
                                    child: Text(
                                      state
                                              .pendingFriendRequestsModel
                                              .data!
                                              .friends!
                                              .data![index]
                                              .user1Username ??
                                          "",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: AppSize.defaultSize! * 2.5,
                                          fontWeight: FontWeight.normal,
                                          overflow: TextOverflow.ellipsis),
                                    ),
                                  ),
                                  const Spacer(),
                                  InkWell(
                                    onTap: () {
                                      BlocProvider.of<GetFriendRequestBloc>(
                                              context)
                                          .add(AcceptFriendRequestEvent(
                                              id: state
                                                  .pendingFriendRequestsModel
                                                  .data!
                                                  .friends!
                                                  .data![index]
                                                  .id
                                                  .toString()));
                                    },
                                    child: Image.asset(AssetPath.accept),
                                  ),
                                  SizedBox(
                                    width: AppSize.defaultSize! * 2,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      BlocProvider.of<GetFriendRequestBloc>(
                                              context)
                                          .add(RejectFriendRequestEvent(
                                              id: state
                                                  .pendingFriendRequestsModel
                                                  .data!
                                                  .friends!
                                                  .data![index]
                                                  .id
                                                  .toString()));
                                    },
                                    child: Image.asset(AssetPath.reject),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: AppSize.defaultSize! * 2,
                              ),
                              Container(
                                width: AppSize.screenWidth,
                                height: 1,
                                color: Colors.white,
                              ),
                            ],
                          ),
                          separatorBuilder: (context, index) =>
                              SizedBox(height: AppSize.defaultSize! * 2),
                          itemCount: state.pendingFriendRequestsModel.data!
                              .friends!.data!.length,
                        );
                      } else {
                        return const LoadingWidget();
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
