
import 'package:equatable/equatable.dart';

abstract class GetFriendsEventBase extends Equatable {
  const GetFriendsEventBase();

  @override
  List<Object> get props => [];
}

class GetFriendsEvent extends GetFriendsEventBase {
  final String page;
  const GetFriendsEvent({required this.page});
}

class GetMoreFriendsEvent extends GetFriendsEventBase {
  final String page;
  const GetMoreFriendsEvent({required this.page});
}