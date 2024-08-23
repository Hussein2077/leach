import 'package:equatable/equatable.dart';

abstract class GetFriendRequestEventBase extends Equatable {
  const GetFriendRequestEventBase();

  @override
  List<Object> get props => [];
}

class GetFriendRequestEvent extends GetFriendRequestEventBase {
  final String page;
  const GetFriendRequestEvent({required this.page});
}

class GetMoreFriendRequestEvent extends GetFriendRequestEventBase {
  final String page;
  const GetMoreFriendRequestEvent({required this.page});
}

class AcceptFriendRequestEvent extends GetFriendRequestEventBase {
  final String id;
  const AcceptFriendRequestEvent({required this.id});
}

class RejectFriendRequestEvent extends GetFriendRequestEventBase {
  final String id;
  const RejectFriendRequestEvent({required this.id});
}

class RemoveFriendEvent extends GetFriendRequestEventBase {
  final String id;
  const RemoveFriendEvent({required this.id});
}

class SendFriendRequestEvent extends GetFriendRequestEventBase {
  final String id;
  const SendFriendRequestEvent({required this.id});
}