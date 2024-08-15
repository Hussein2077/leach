import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leach/core/utils/app_size.dart';
import 'package:leach/features/posts/data/models/posts_model.dart';
import 'package:leach/features/posts/presentation/manager/get_posts_manager/get_posts_bloc.dart';
import 'package:leach/features/posts/presentation/manager/get_posts_manager/get_posts_event.dart';
import 'package:leach/features/posts/presentation/manager/get_posts_manager/get_posts_state.dart';
import 'package:leach/features/posts/presentation/widgets/post_card.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {

  int page = 1;
  int totalPages = 0;
  final scrollcontroller = ScrollController();

  List<PostData> data = [];

  void _scrollListener() {
    if (scrollcontroller.position.pixels ==
        scrollcontroller.position.maxScrollExtent) {
      if (page < totalPages) {
        page = page + 1;
        BlocProvider.of<GetPostsBloc>(context).add(
            GetMorePostsEvent(page: page.toString()));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: AppSize.defaultSize! * 4),
        child: BlocBuilder<GetPostsBloc, GetPostState>(
          builder: (context, state) {
            if(state is GetPostsSuccessState) {
              totalPages = state.postsModel.posts?.pagination?.total ?? 1;
              page = 1;
              data = [];
              for (final e in state.postsModel.posts!.data!) {
                data.add(e);
              }
              return ListView.builder(
                controller: scrollcontroller,
                cacheExtent: 1000,
                itemBuilder: (context, index) => PostCard(
                  postData: data[index],
                ),
                itemCount: data.length,
              );
            } else if (state is GetMorePostsLoadingState) {
              return ListView.builder(
                controller: scrollcontroller,
                cacheExtent: 1000,
                itemBuilder: (context, index) => PostCard(
                  postData: data[index],
                ),
                itemCount: data.length,
              );
            } else if (state is GetMorePostsSuccessState) {
              for (final e in state.postsModel.posts!.data!) {
                data.add(e);
              }
              return ListView.builder(
                controller: scrollcontroller,
                cacheExtent: 1000,
                itemBuilder: (context, index) => PostCard(
                  postData: data[index],
                ),
                itemCount: data.length,
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
