import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leach/core/resource_manager/asset_path.dart';
import 'package:leach/core/utils/app_size.dart';
import 'package:leach/core/utils/methods.dart';
import 'package:leach/core/widgets/background.dart';
import 'package:leach/core/widgets/leading_icon.dart';
import 'package:leach/core/widgets/loading_widget.dart';
import 'package:leach/features/posts/presentation/manager/posts_manager/posts_bloc.dart';
import 'package:leach/features/posts/presentation/manager/posts_manager/posts_event.dart';
import 'package:leach/features/posts/presentation/manager/user_posts_manager/user_posts_bloc.dart';
import 'package:leach/features/posts/presentation/manager/user_posts_manager/user_posts_event.dart';
import 'package:leach/features/posts/presentation/manager/user_posts_manager/user_posts_state.dart';
import 'package:leach/features/profile/presentation/posts_and_pet_view/card_widget.dart';

class PostsViewProfile extends StatefulWidget {
  const PostsViewProfile({super.key});

  @override
  State<PostsViewProfile> createState() => _PostsViewProfileState();
}

class _PostsViewProfileState extends State<PostsViewProfile> {

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserPostsBloc, UserPostState>(
      listener: (context, state) {
        if(state is DeleteUserPostsSuccessState){
          LoadingOverlay().hide();
          BlocProvider.of<UserPostsBloc>(context).add(const GetUserPostsEvent(page: "1"));
          BlocProvider.of<PostsBloc>(context).add(const GetPostsEvent(page: "1"));
        }else if(state is DeleteUserPostsLoadingState){
          LoadingOverlay().show(context);
        }else if(state is DeleteUserPostsErrorState){
          LoadingOverlay().hide();
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.errorMessage),
          ));
        }else if(state is EditeUserPostsSuccessState){
          BlocProvider.of<UserPostsBloc>(context).add(const GetUserPostsEvent(page: "1"));
          BlocProvider.of<PostsBloc>(context).add(const GetPostsEvent(page: "1"));
        }
      },
      child: Scaffold(
        body: BackgroundScreen(
          image: AssetPath.homeBackground,
          child: Column(
            children: [
              SizedBox(
                height: AppSize.defaultSize! * 2,
              ),
              Padding(
                padding: Methods.instance.paddingCustom,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    LeadingIcon(
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: AppSize.defaultSize! * 3,
              ),
              Expanded(
                child: Container(
                  width: AppSize.screenWidth!,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(246, 255, 255, 1),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(AppSize.defaultSize! * 4),
                      topRight: Radius.circular(AppSize.defaultSize! * 4),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppSize.defaultSize! * 3),
                    child: BlocBuilder<UserPostsBloc, UserPostState>(
                      builder: (context, state) {
                        if (state is GetUserPostsSuccessState) {
                          if(state.postsModel.posts!.data!.isNotEmpty) {
                            return ListView.builder(
                            padding: EdgeInsets.zero,
                            itemCount: state.postsModel.posts!.data!.length,
                            itemBuilder: (context, index) {
                              return CardWidget(
                                data: state.postsModel.posts!.data![index],
                              );
                            },
                          );
                          }else{
                            return Center(
                              child: Text("No Posts", style: TextStyle(fontSize: AppSize.defaultSize! * 3,),),
                            );
                          }
                        } else {
                          return const SizedBox();
                        }
                      },
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
