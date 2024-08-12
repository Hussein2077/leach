import 'package:equatable/equatable.dart';

abstract class LikePostState extends Equatable {
  const LikePostState();

  @override
  List<Object> get props => [];
}

class LikePostInitialState extends LikePostState {}

class LikePostsLoadingState extends LikePostState {}

class LikePostsErrorState extends LikePostState {
  final String errorMessage;

  const LikePostsErrorState({required this.errorMessage});
}

class LikePostsSuccessState extends LikePostState {
  final String message;

  const LikePostsSuccessState({required this.message});
}

class UnLikePostsLoadingState extends LikePostState {}

class UnLikePostsErrorState extends LikePostState {
  final String errorMessage;

  const UnLikePostsErrorState({required this.errorMessage});
}

class UnLikePostsSuccessState extends LikePostState {
  final String message;

  const UnLikePostsSuccessState({required this.message});
}