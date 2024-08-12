import 'package:equatable/equatable.dart';
import 'package:leach/features/posts/data/models/posts_model.dart';

abstract class GetPostState extends Equatable {
  const GetPostState();

  @override
  List<Object> get props => [];
}

class PostInitialState extends GetPostState {}

class GetPostsLoadingState extends GetPostState {}

class GetPostsErrorState extends GetPostState {
  final String errorMessage;

  const GetPostsErrorState({required this.errorMessage});
}

class GetPostsSuccessState extends GetPostState {
  final PostsModel postsModel;

  const GetPostsSuccessState({required this.postsModel});
}

class GetMorePostsLoadingState extends GetPostState {}

class GetMorePostsErrorState extends GetPostState {
  final String errorMessage;

  const GetMorePostsErrorState({required this.errorMessage});
}

class GetMorePostsSuccessState extends GetPostState {
  final PostsModel postsModel;

  const GetMorePostsSuccessState({required this.postsModel});
}
