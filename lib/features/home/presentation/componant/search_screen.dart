import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leach/core/resource_manager/colors.dart';
import 'package:leach/core/resource_manager/routes.dart';
import 'package:leach/core/resource_manager/string_manager.dart';
import 'package:leach/core/utils/app_size.dart';
import 'package:leach/core/widgets/cached_network_image.dart';
import 'package:leach/core/widgets/custom_text_field.dart';
import 'package:leach/core/widgets/cutom_text.dart';
import 'package:leach/core/widgets/leading_icon.dart';
import 'package:leach/core/widgets/loading_widget.dart';
import 'package:leach/features/home/data/models/search_user_model.dart';
import 'package:leach/features/home/presentation/manager/search_bloc/bloc.dart';
import 'package:leach/features/home/presentation/manager/search_bloc/event.dart';
import 'package:leach/features/home/presentation/manager/search_bloc/state.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  int page = 1;
  int totalPages = 0;
  final scrollController = ScrollController();
  List<SearchUser> data = [];
  late TextEditingController query;
  Timer? _debounce;

  void _scrollListener() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      if (page < totalPages) {
        page = page + 1;
        BlocProvider.of<GetSearchUserBloc>(context).add(
            GetMoreSearchUserEvent(page: page.toString(), query: query.text));
      }
    }
  }

  @override
  void initState() {
    scrollController.addListener(_scrollListener);
    BlocProvider.of<GetSearchUserBloc>(context)
        .add(const GetSearchUserEvent(page: "1", query: ''));
    query = TextEditingController();
    super.initState();
  }

  void _onSearchChanged(String value) {
    if (_debounce?.isActive ?? false)
      _debounce?.cancel(); // Cancel previous debounce timer
    _debounce = Timer(const Duration(milliseconds: 350), () {
      BlocProvider.of<GetSearchUserBloc>(context)
          .add(GetSearchUserEvent(page: "1", query: value));
    });
  }

  @override
  void dispose() {
    query.dispose();
    _debounce?.cancel();
    super.dispose();
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
                    const LeadingIcon(),
                    SizedBox(width: AppSize.defaultSize! * 3),
                    CustomTextField(
                      hintText: StringManager.searchName.tr(),
                      controller: query,
                      onChanged: _onSearchChanged,
                      height: AppSize.defaultSize! * 4.5,
                      width: AppSize.screenWidth! * .7,
                    ),
                  ],
                ),
              ),
              SizedBox(height: AppSize.defaultSize!),
              Expanded(
                child: BlocBuilder<GetSearchUserBloc, GetSearchState>(
                  builder: (context, state) {
                    if (state is GetSearchUserSuccessState) {
                      totalPages =
                          state.searchUserResponse.pagination.total ?? 1;
                      page = 1;
                      data = state.searchUserResponse.users.toList();
                      return _buildUserListView();
                    } else if (state is GetMoreSearchUserLoadingState) {
                      return _buildUserListView(isLoading: true);
                    } else if (state is GetMoreSearchUserSuccessState) {
                      data.addAll(state.searchUserResponse.users);
                      return _buildUserListView();
                    } else {
                      return const LoadingWidget(
                        color: AppColors.primaryColor,
                      );
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

  Widget _buildUserListView({bool isLoading = false}) {
    return ListView.builder(
      controller: scrollController,
      cacheExtent: 1000,
      itemCount: data.length,
      itemBuilder: (context, index) {
        return UserListTile(
          user: data[index],
          onTap: () {
            Navigator.pushNamed(
              context,
              Routes.friendsView,
              arguments: data[index].uuid,
            );
          },
        );
      },
    );
  }
}

class UserListTile extends StatelessWidget {
  final SearchUser user;
  final VoidCallback onTap;

  const UserListTile({Key? key, required this.user, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppSize.defaultSize! * 2),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            CachedNetworkCustom(
              url: user.profilePicture ?? "",
              width: AppSize.defaultSize! * 3.8,
              height: AppSize.defaultSize! * 3.8,
              radius: AppSize.defaultSize! * 10,
            ),
            SizedBox(width: AppSize.defaultSize!),
            CustomText(
              text: user.username,
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w600,
              textAlign: TextAlign.start,
              fontSize: AppSize.defaultSize! * 1.8,
            ),
          ],
        ),
      ),
    );
  }
}
