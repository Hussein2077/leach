import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leach/core/resource_manager/colors.dart';
import 'package:leach/core/utils/app_size.dart';
import 'package:leach/core/widgets/loading_widget.dart';
import 'package:leach/features/posts/data/models/posts_model.dart';
import 'package:leach/features/posts/presentation/manager/posts_manager/posts_bloc.dart';
import 'package:leach/features/posts/presentation/manager/posts_manager/posts_event.dart';
import 'package:leach/features/posts/presentation/manager/posts_manager/posts_state.dart';
import 'package:leach/features/posts/presentation/widgets/post_card.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();

  static int page = 1;
  static int totalPages = 0;
  static List<PostData> data = [];

}

class _PostsScreenState extends State<PostsScreen> {

  final scrollcontroller = ScrollController();


  @override
  void initState() {
    scrollcontroller.addListener(_scrollListener);
    super.initState();
  }

  void _scrollListener() {
    if (scrollcontroller.position.pixels == scrollcontroller.position.maxScrollExtent) {
      if (PostsScreen.page < PostsScreen.totalPages) {
        PostsScreen.page = PostsScreen.page + 1;
        BlocProvider.of<PostsBloc>(context).add(GetMorePostsEvent(page: PostsScreen.page.toString()));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: AppSize.defaultSize! * 4),
        child: BlocBuilder<PostsBloc, PostState>(
          builder: (context, state) {
            if(state is GetPostsSuccessState) {
              PostsScreen.totalPages = state.postsModel.posts?.pagination?.total ?? 1;
              PostsScreen.page = 1;
              PostsScreen.data = [];
              for (final e in state.postsModel.posts!.data!) {
                PostsScreen.data.add(e);
              }
              return ListView.builder(
                controller: scrollcontroller,
                cacheExtent: 1000,
                itemBuilder: (context, index) => PostCard(
                  postData: PostsScreen.data[index],
                ),
                itemCount: PostsScreen.data.length,
              );
            } else if (state is GetMorePostsLoadingState) {
              return ListView.builder(
                controller: scrollcontroller,
                cacheExtent: 1000,
                itemBuilder: (context, index) => PostCard(
                  postData: PostsScreen.data[index],
                ),
                itemCount: PostsScreen.data.length,
              );
            } else if (state is GetMorePostsSuccessState) {
              for (final e in state.postsModel.posts!.data!) {
                PostsScreen.data.add(e);
              }
              return ListView.builder(
                controller: scrollcontroller,
                cacheExtent: 1000,
                itemBuilder: (context, index) => PostCard(
                  postData: PostsScreen.data[index],
                ),
                itemCount: PostsScreen.data.length,
              );
            } else {
              return const LoadingWidget(
                color: AppColors.primaryColor,
              );
            }
          },
        ),
      ),
    );
  }
}
