import 'package:equatable/equatable.dart';
import 'package:leach/features/posts/data/models/posts_model.dart';

abstract class PostState extends Equatable {
  const PostState();

  @override
  List<Object> get props => [];
}

class PostInitialState extends PostState {}

class GetPostsLoadingState extends PostState {}

class GetPostsErrorState extends PostState {
  final String errorMessage;

  const GetPostsErrorState({required this.errorMessage});
}

class GetPostsSuccessState extends PostState {
  final PostsModel postsModel;

  const GetPostsSuccessState({required this.postsModel});
}

class GetMorePostsLoadingState extends PostState {}

class GetMorePostsErrorState extends PostState {
  final String errorMessage;

  const GetMorePostsErrorState({required this.errorMessage});
}

class GetMorePostsSuccessState extends PostState {
  final PostsModel postsModel;

  const GetMorePostsSuccessState({required this.postsModel});
}