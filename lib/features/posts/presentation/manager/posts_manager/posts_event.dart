import 'package:equatable/equatable.dart';

abstract class PostsEventBase extends Equatable {
  const PostsEventBase();

  @override
  List<Object> get props => [];
}

class GetPostsEvent extends PostsEventBase {
  final String page;
  const GetPostsEvent({required this.page});
}

class GetMorePostsEvent extends PostsEventBase {
  final String page;
  const GetMorePostsEvent({required this.page});
}