import 'package:equatable/equatable.dart';
import 'package:leach/features/profile/domain/model/pending_friend_requests_model.dart';

abstract class GetFriendRequestState extends Equatable {
  const GetFriendRequestState();

  @override
  List<Object> get props => [];
}

class FriendRequestInitialState extends GetFriendRequestState {}

class GetFriendRequestsLoadingState extends GetFriendRequestState {}

class GetFriendRequestsErrorState extends GetFriendRequestState {
  final String errorMessage;

  const GetFriendRequestsErrorState({required this.errorMessage});
}

class GetFriendRequestsSuccessState extends GetFriendRequestState {
  final PendingFriendRequestsModel pendingFriendRequestsModel;

  const GetFriendRequestsSuccessState({required this.pendingFriendRequestsModel});
}

class GetMoreFriendRequestsLoadingState extends GetFriendRequestState {}

class GetMoreFriendRequestsErrorState extends GetFriendRequestState {
  final String errorMessage;

  const GetMoreFriendRequestsErrorState({required this.errorMessage});
}

class GetMoreFriendRequestsSuccessState extends GetFriendRequestState {
  final PendingFriendRequestsModel pendingFriendRequestsModel;

  const GetMoreFriendRequestsSuccessState({required this.pendingFriendRequestsModel});
}

class AcceptFriendRequestsLoadingState extends GetFriendRequestState {}

class AcceptFriendRequestsErrorState extends GetFriendRequestState {
  final String errorMessage;
  const AcceptFriendRequestsErrorState({required this.errorMessage});
}

class AcceptFriendRequestsSuccessState extends GetFriendRequestState {
  final String message;
  const AcceptFriendRequestsSuccessState({required this.message});
}

class RejectFriendRequestsLoadingState extends GetFriendRequestState {}

class RejectFriendRequestsErrorState extends GetFriendRequestState {
  final String errorMessage;
  const RejectFriendRequestsErrorState({required this.errorMessage});
}

class RejectFriendRequestsSuccessState extends GetFriendRequestState {
  final String message;
  const RejectFriendRequestsSuccessState({required this.message});
}

class RemoveFriendLoadingState extends GetFriendRequestState {}

class RemoveFriendErrorState extends GetFriendRequestState {
  final String errorMessage;
  const RemoveFriendErrorState({required this.errorMessage});
}

class RemoveFriendSuccessState extends GetFriendRequestState {
  final String message;
  const RemoveFriendSuccessState({required this.message});
}

class SendFriendRequestsLoadingState extends GetFriendRequestState {}

class SendFriendRequestsErrorState extends GetFriendRequestState {
  final String errorMessage;
  const SendFriendRequestsErrorState({required this.errorMessage});
}

class SendFriendRequestsSuccessState extends GetFriendRequestState {
  final String message;
  const SendFriendRequestsSuccessState({required this.message});
}

class BlockUserLoadingState extends GetFriendRequestState {}

class BlockUserErrorState extends GetFriendRequestState {
  final String errorMessage;
  const BlockUserErrorState({required this.errorMessage});
}

class BlockUserSuccessState extends GetFriendRequestState {
  final String message;
  const BlockUserSuccessState({required this.message});
}

class UnBlockUserLoadingState extends GetFriendRequestState {}

class UnBlockUserErrorState extends GetFriendRequestState {
  final String errorMessage;
  const UnBlockUserErrorState({required this.errorMessage});
}

class UnBlockUserSuccessState extends GetFriendRequestState {
  final String message;
  const UnBlockUserSuccessState({required this.message});
}