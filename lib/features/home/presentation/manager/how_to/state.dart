import 'package:equatable/equatable.dart';
import 'package:leach/features/home/data/models/how_toModel.dart';
import 'package:leach/features/home/data/models/vendor.dart';
import 'package:leach/features/profile/domain/model/all_booking_model.dart';

abstract class BaseHowToState extends Equatable {
  const BaseHowToState();

  @override
  List<Object> get props => [];
}

class HowToInitialState extends BaseHowToState {}

class GetHowToLoadingState extends BaseHowToState {}

class GetHowToErrorState extends BaseHowToState {
  final String errorMessage;

  const GetHowToErrorState({required this.errorMessage});
}

class GetHowToSuccessState extends BaseHowToState {
  final List<HowToModel>   howTo;
  const GetHowToSuccessState({required this.howTo});
}


