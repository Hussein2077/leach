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

class DeletePostEvent extends PostsEventBase {
  final String id;
  const DeletePostEvent({required this.id});
}

class EditePostEvent extends PostsEventBase {
  final dynamic data;
  final String id;
  const EditePostEvent({required this.data, required this.id});
}

class CreatePostEvent extends PostsEventBase {
  final dynamic data;
  const CreatePostEvent({required this.data});
}