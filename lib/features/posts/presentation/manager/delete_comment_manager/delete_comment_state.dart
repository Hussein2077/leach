import 'package:equatable/equatable.dart';

abstract class DeleteCommentState extends Equatable {
  const DeleteCommentState();

  @override
  List<Object> get props => [];
}

class DeleteCommentInitialState extends DeleteCommentState {}

class DeleteCommentLoadingState extends DeleteCommentState {}

class DeleteCommentErrorState extends DeleteCommentState {
  final String errorMessage;

  const DeleteCommentErrorState({required this.errorMessage});
}

class DeleteCommentSuccessState extends DeleteCommentState {
  final String message;

  const DeleteCommentSuccessState({required this.message});
}


class DeleteReplyLoadingState extends DeleteCommentState {}

class DeleteReplyErrorState extends DeleteCommentState {
  final String errorMessage;

  const DeleteReplyErrorState({required this.errorMessage});
}

class DeleteReplySuccessState extends DeleteCommentState {
  final String message;

  const DeleteReplySuccessState({required this.message});
}
