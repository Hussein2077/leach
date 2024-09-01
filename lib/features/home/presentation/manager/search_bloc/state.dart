import 'package:equatable/equatable.dart';
import 'package:leach/features/home/data/models/search_user_model.dart';
import 'package:leach/features/profile/domain/model/friends_model.dart';

abstract class GetSearchState extends Equatable {
  const GetSearchState();

  @override
  List<Object> get props => [];
}

class SearchUserInitialState extends GetSearchState {}

class GetSearchUserLoadingState extends GetSearchState {}

class GetSearchUserErrorState extends GetSearchState {
  final String errorMessage;

  const GetSearchUserErrorState({required this.errorMessage});
}

class GetSearchUserSuccessState extends GetSearchState {
  final  SearchUserResponse searchUserResponse ;

  const GetSearchUserSuccessState({required this.searchUserResponse});
}

class GetMoreSearchUserLoadingState extends GetSearchState {}

class GetMoreSearchUserErrorState extends GetSearchState {
  final String errorMessage;

  const GetMoreSearchUserErrorState({required this.errorMessage});
}

class GetMoreSearchUserSuccessState extends GetSearchState {
  final  SearchUserResponse searchUserResponse ;

  const GetMoreSearchUserSuccessState({required this.searchUserResponse});
}