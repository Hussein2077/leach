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
