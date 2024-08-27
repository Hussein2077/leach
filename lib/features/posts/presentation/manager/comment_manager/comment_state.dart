import 'package:leach/features/posts/data/models/comments_model.dart';

abstract class CommentState {}

class CommentInitialState extends CommentState {}

class AddCommentLoadingState extends CommentState {}

class AddCommentErrorState extends CommentState {
  final String errorMessage;

  AddCommentErrorState({required this.errorMessage});
}

class AddCommentSuccessState extends CommentState {
  final String message;

  AddCommentSuccessState({required this.message});
}

class GetCommentLoadingState extends CommentState {}

class GetCommentErrorState extends CommentState {
  final String errorMessage;

  GetCommentErrorState({required this.errorMessage});
}

class GetCommentSuccessState extends CommentState {
  final CommentsModel commentsModel;

  GetCommentSuccessState({required this.commentsModel});
}
