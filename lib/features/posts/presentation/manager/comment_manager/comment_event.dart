import 'package:equatable/equatable.dart';

abstract class CommentEventBase extends Equatable {
  const CommentEventBase();

  @override
  List<Object> get props => [];
}

class GetCommentsEvent extends CommentEventBase {
  final String id;
  const GetCommentsEvent({required this.id});
}

class AddCommentEvent extends CommentEventBase {
  final String id;
  final String comment;
  const AddCommentEvent({required this.id, required this.comment});
}

class ReplyOnCommentEvent extends CommentEventBase {
  final String commentId;
  final String comment;
  const ReplyOnCommentEvent({required this.commentId, required this.comment});
}
