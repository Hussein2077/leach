import 'package:equatable/equatable.dart';
import 'package:leach/features/posts/data/models/posts_model.dart';

abstract class UserPostState extends Equatable {
  const UserPostState();

  @override
  List<Object> get props => [];
}

class UserPostInitialState extends UserPostState {}

class GetUserPostsLoadingState extends UserPostState {}

class GetUserPostsErrorState extends UserPostState {
  final String errorMessage;

  const GetUserPostsErrorState({required this.errorMessage});
}

class GetUserPostsSuccessState extends UserPostState {
  final PostsModel postsModel;

  const GetUserPostsSuccessState({required this.postsModel});
}

class GetUserMorePostsLoadingState extends UserPostState {}

class GetUserMorePostsErrorState extends UserPostState {
  final String errorMessage;

  const GetUserMorePostsErrorState({required this.errorMessage});
}

class GetUserMorePostsSuccessState extends UserPostState {
  final PostsModel postsModel;

  const GetUserMorePostsSuccessState({required this.postsModel});
}

class DeleteUserPostsLoadingState extends UserPostState {}

class DeleteUserPostsErrorState extends UserPostState {
  final String errorMessage;

  const DeleteUserPostsErrorState({required this.errorMessage});
}

class DeleteUserPostsSuccessState extends UserPostState {
  final String message;

  const DeleteUserPostsSuccessState({required this.message});
}

class EditeUserPostsLoadingState extends UserPostState {}

class EditeUserPostsErrorState extends UserPostState {
  final String errorMessage;

  const EditeUserPostsErrorState({required this.errorMessage});
}

class EditeUserPostsSuccessState extends UserPostState {
  final String message;

  const EditeUserPostsSuccessState({required this.message});
}

class CreatePostsLoadingState extends UserPostState {}

class CreatePostsErrorState extends UserPostState {
  final String errorMessage;

  const CreatePostsErrorState({required this.errorMessage});
}

class CreatePostsSuccessState extends UserPostState {
  final String message;

  const CreatePostsSuccessState({required this.message});
}