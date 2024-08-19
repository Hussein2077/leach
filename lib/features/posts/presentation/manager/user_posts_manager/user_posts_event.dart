import 'package:equatable/equatable.dart';

abstract class UserPostsEventBase extends Equatable {
  const UserPostsEventBase();

  @override
  List<Object> get props => [];
}

class GetUserPostsEvent extends UserPostsEventBase {
  final String page;
  const GetUserPostsEvent({required this.page});
}

class GetUserMorePostsEvent extends UserPostsEventBase {
  final String page;
  const GetUserMorePostsEvent({required this.page});
}

class DeleteUserPostEvent extends UserPostsEventBase {
  final String id;
  const DeleteUserPostEvent({required this.id});
}

class EditeUserPostEvent extends UserPostsEventBase {
  final dynamic data;
  final String id;
  const EditeUserPostEvent({required this.data, required this.id});
}

class CreatePostEvent extends UserPostsEventBase {
  final dynamic data;
  const CreatePostEvent({required this.data});
}