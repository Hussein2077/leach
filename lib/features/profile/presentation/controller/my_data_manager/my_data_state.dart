import 'package:equatable/equatable.dart';
import 'package:leach/core/models/profile_data_model.dart';

abstract class GetMyDataState extends Equatable {
  const GetMyDataState();

  @override
  List<Object> get props => [];
}

class MyDataInitialState extends GetMyDataState {}

class GetMyDataLoadingState extends GetMyDataState {}

class GetMyDataErrorState extends GetMyDataState {
  final String errorMessage;

  const GetMyDataErrorState({required this.errorMessage});
}

class GetMyDataSuccessState extends GetMyDataState {
  final UserModel userModel;

  const GetMyDataSuccessState({required this.userModel});
}