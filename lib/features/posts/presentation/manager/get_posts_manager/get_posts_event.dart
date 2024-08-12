import 'package:equatable/equatable.dart';

abstract class GetPostsEventBase extends Equatable {
  const GetPostsEventBase();

  @override
  List<Object> get props => [];
}

class GetPostsEvent extends GetPostsEventBase {
  final String page;
  const GetPostsEvent({required this.page});
}

class GetMorePostsEvent extends GetPostsEventBase {
  final String page;
  const GetMorePostsEvent({required this.page});
}
