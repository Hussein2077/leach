import 'package:equatable/equatable.dart';

abstract class LikePostsEventBase extends Equatable {
  const LikePostsEventBase();

  @override
  List<Object> get props => [];
}

class LikeEvent extends LikePostsEventBase {
  final String id;
  const LikeEvent({required this.id});
}

class UnLikeEvent extends LikePostsEventBase {
  final String id;
  const UnLikeEvent({required this.id});
}
