import 'package:equatable/equatable.dart';

abstract class DeleteCommentEventBase extends Equatable {
  const DeleteCommentEventBase();

  @override
  List<Object> get props => [];
}

class DeleteCommentEvent extends DeleteCommentEventBase {
  final String id;
  const DeleteCommentEvent({required this.id});
}

class DeleteReplyEvent extends DeleteCommentEventBase {
  final String id;
  const DeleteReplyEvent({required this.id});
}
