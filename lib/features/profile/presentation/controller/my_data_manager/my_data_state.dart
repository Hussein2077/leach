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
//////////////////////////////////////////////////
class ChangePrivacyLoadingState extends GetMyDataState {}

class ChangePrivacyErrorState extends GetMyDataState {
  final String errorMessage;

  const ChangePrivacyErrorState({required this.errorMessage});
}

class ChangePrivacySuccessState extends GetMyDataState {
  final String message ;

  const ChangePrivacySuccessState({required this.message});
}
///////////////////////////////////////

class UpdateMyDataLoadingState extends GetMyDataState {}

class UpdateMyDataErrorState extends GetMyDataState {
  final String errorMessage;

  const UpdateMyDataErrorState({required this.errorMessage});
}

class UpdateMyDataSuccessState extends GetMyDataState {
  final UserModel userModel;

  const UpdateMyDataSuccessState({required this.userModel});

}