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

class DeletePostsLoadingState extends PostState {}

class DeletePostsErrorState extends PostState {
  final String errorMessage;

  const DeletePostsErrorState({required this.errorMessage});
}

class DeletePostsSuccessState extends PostState {
  final String message;

  const DeletePostsSuccessState({required this.message});
}

class EditePostsLoadingState extends PostState {}

class EditePostsErrorState extends PostState {
  final String errorMessage;

  const EditePostsErrorState({required this.errorMessage});
}

class EditePostsSuccessState extends PostState {
  final String message;

  const EditePostsSuccessState({required this.message});
}

class CreatePostsLoadingState extends PostState {}

class CreatePostsErrorState extends PostState {
  final String errorMessage;

  const CreatePostsErrorState({required this.errorMessage});
}

class CreatePostsSuccessState extends PostState {
  final String message;

  const CreatePostsSuccessState({required this.message});
}