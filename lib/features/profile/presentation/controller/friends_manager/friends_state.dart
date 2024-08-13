import 'package:equatable/equatable.dart';
import 'package:leach/features/profile/domain/model/friends_model.dart';

abstract class GetFriendState extends Equatable {
  const GetFriendState();

  @override
  List<Object> get props => [];
}

class FriendInitialState extends GetFriendState {}

class GetFriendsLoadingState extends GetFriendState {}

class GetFriendsErrorState extends GetFriendState {
  final String errorMessage;

  const GetFriendsErrorState({required this.errorMessage});
}

class GetFriendsSuccessState extends GetFriendState {
  final FriendsModel friendsModel;

  const GetFriendsSuccessState({required this.friendsModel});
}

class GetMoreFriendsLoadingState extends GetFriendState {}

class GetMoreFriendsErrorState extends GetFriendState {
  final String errorMessage;

  const GetMoreFriendsErrorState({required this.errorMessage});
}

class GetMoreFriendsSuccessState extends GetFriendState {
  final FriendsModel friendsModel;

  const GetMoreFriendsSuccessState({required this.friendsModel});
}