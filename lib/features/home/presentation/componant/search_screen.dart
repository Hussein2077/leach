import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leach/core/resource_manager/asset_path.dart';
import 'package:leach/core/resource_manager/colors.dart';
import 'package:leach/core/resource_manager/routes.dart';
import 'package:leach/core/resource_manager/string_manager.dart';
import 'package:leach/core/utils/app_size.dart';
import 'package:leach/core/widgets/cached_network_image.dart';
import 'package:leach/core/widgets/custom_text_field.dart';
import 'package:leach/core/widgets/cutom_text.dart';
import 'package:leach/core/widgets/leading_icon.dart';
import 'package:leach/core/widgets/loading_widget.dart';
import 'package:leach/features/chat/widgets/chat_app_bar.dart';
import 'package:leach/features/profile/domain/model/friends_model.dart';
import 'package:leach/features/profile/presentation/controller/friends_manager/friends_bloc.dart';
import 'package:leach/features/profile/presentation/controller/friends_manager/friends_event.dart';
import 'package:leach/features/profile/presentation/controller/friends_manager/friends_state.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  int page = 1;
  int totalPages = 0;
  final scrollcontroller = ScrollController();

  List<FriendData> data = [];

  void _scrollListener() {
    if (scrollcontroller.position.pixels ==
        scrollcontroller.position.maxScrollExtent) {
      if (page < totalPages) {
        page = page + 1;
        BlocProvider.of<GetFriendsBloc>(context).add(
            GetMoreFriendsEvent(page: page.toString()));
      }
    }
  }

  @override
  void initState() {
    scrollcontroller.addListener(_scrollListener);
    BlocProvider.of<GetFriendsBloc>(context).add(
        const GetFriendsEvent(page: "1"));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSize.defaultSize! * 2),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: AppSize.defaultSize! * 3,
                    left: AppSize.defaultSize! * 0.6,
                    ),
                child: Row(

                  children: [
                    LeadingIcon(),
                    SizedBox(
                      width: AppSize.defaultSize!*3,
                    ),

            CustomTextField(
            hintText: StringManager.searchFriends.tr(),
        height: AppSize.defaultSize! * 3.5,
        width: AppSize.screenWidth! * .7,
      ),
                  ]
                )
    ),
              SizedBox(
                height: AppSize.defaultSize!,
              ),
              Expanded(
                child: BlocBuilder<GetFriendsBloc, GetFriendState>(
                  builder: (context, state) {
                    if(state is GetFriendsSuccessState) {
                      totalPages = state.friendsModel.data?.friends?.pagination?.total ?? 1;
                      page = 1;
                      data = [];
                      for (final e in state.friendsModel.data!.friends!.data!) {
                        data.add(e);
                      }
                      if(data.isNotEmpty) {
                        return ListView.builder(
                          controller: scrollcontroller,
                          cacheExtent: 1000,
                          itemBuilder: (context, index) => InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, Routes.friendsView, arguments: data[index].friendUuid);
                            },
                            child: Row(
                              children: [
                                CachedNetworkCustom(
                                  url: data[index].friendProfilePicture??"",
                                  width: AppSize.defaultSize! * 3.8,
                                  height: AppSize.defaultSize! * 3.8,
                                  radius: AppSize.defaultSize! * 10,
                                ),
                                SizedBox(
                                  width: AppSize.defaultSize!,
                                ),
                                CustomText(
                                    text: data[index].friendUsername??"",
                                    color: AppColors.primaryColor,
                                    fontWeight: FontWeight.w600,
                                    textAlign: TextAlign.start,
                                    fontSize: AppSize.defaultSize! * 1.8),
                              ],
                            ),
                          ),
                          itemCount: data.length,
                        );
                      }else{
                        return Center(child: CustomText(text: "No Friends", fontSize: AppSize.defaultSize! * 3,),);
                      }
                    }else if(state is GetMoreFriendsLoadingState){
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: data.length,
                        controller: scrollcontroller,
                        cacheExtent: 1000,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, Routes.friendsView);
                            },
                            child: Row(
                              children: [
                                CachedNetworkCustom(
                                  url: data[index].friendProfilePicture??"",
                                  width: AppSize.defaultSize! * 3.8,
                                  height: AppSize.defaultSize! * 3.8,
                                  radius: AppSize.defaultSize! * 10,
                                ),
                                SizedBox(
                                  width: AppSize.defaultSize!,
                                ),
                                CustomText(
                                    text: data[index].friendUsername??"",
                                    color: AppColors.primaryColor,
                                    fontWeight: FontWeight.w600,
                                    textAlign: TextAlign.start,
                                    fontSize: AppSize.defaultSize! * 1.8),
                              ],
                            ),
                          );
                        },
                      );
                    }else if(state is GetMoreFriendsSuccessState){
                      for (final e in state.friendsModel.data!.friends!.data!) {
                        data.add(e);
                      }
                      return ListView.builder(
                        controller: scrollcontroller,
                        cacheExtent: 1000,
                        itemBuilder: (context, index) => InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, Routes.friendsView);
                          },
                          child: Row(
                            children: [
                              CachedNetworkCustom(
                                url: data[index].friendProfilePicture??"",
                                width: AppSize.defaultSize! * 3.8,
                                height: AppSize.defaultSize! * 3.8,
                                radius: AppSize.defaultSize! * 10,
                              ),
                              SizedBox(
                                width: AppSize.defaultSize!,
                              ),
                              CustomText(
                                  text: data[index].friendUsername??"",
                                  color: AppColors.primaryColor,
                                  fontWeight: FontWeight.w600,
                                  textAlign: TextAlign.start,
                                  fontSize: AppSize.defaultSize! * 1.8),
                            ],
                          ),
                        ),
                        itemCount: data.length,
                      );
                    }else{
                      return const LoadingWidget();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
