import 'package:equatable/equatable.dart';
import 'package:leach/features/profile/domain/model/user_data_model.dart';

abstract class GetUserState extends Equatable {
  const GetUserState();

  @override
  List<Object> get props => [];
}

class UserInitialState extends GetUserState {}

class GetUserLoadingState extends GetUserState {}

class GetUserErrorState extends GetUserState {
  final String errorMessage;

  const GetUserErrorState({required this.errorMessage});
}

class GetUserSuccessState extends GetUserState {
  final UserDataModel userDataModel;

  const GetUserSuccessState({required this.userDataModel});
}