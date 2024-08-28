import 'package:equatable/equatable.dart';
import 'package:leach/features/profile/domain/model/traits_model.dart';

abstract class ReportUserState extends Equatable {
  const ReportUserState();

  @override
  List<Object> get props => [];
}

class ReportUserInitialState extends ReportUserState {
  const ReportUserInitialState();
}

class ReportUserLoadingState extends ReportUserState {
  const ReportUserLoadingState();
}

class ReportUserErrorMessageState extends ReportUserState {
  final String errorMessage;

  const ReportUserErrorMessageState({required this.errorMessage});
}

class ReportUserSuccessMessageState extends ReportUserState {
  final String message;

  const ReportUserSuccessMessageState({required this.message});
}
