import 'package:equatable/equatable.dart';
import 'package:leach/features/home/data/models/breeding_model.dart';

abstract class BreedingState extends Equatable {
  const BreedingState();

  @override
  List<Object> get props => [];
}

class BreedingInitialState extends BreedingState {}

class GetBreedingLoadingState extends BreedingState {}

class GetBreedingErrorState extends BreedingState {
  final String errorMessage;

  const GetBreedingErrorState({required this.errorMessage});
}

class GetBreedingSuccessState extends BreedingState {
  final BreedingModel breedingModel;

  const GetBreedingSuccessState({required this.breedingModel});
}

class GetMoreBreedingLoadingState extends BreedingState {}

class GetMoreBreedingErrorState extends BreedingState {
  final String errorMessage;

  const GetMoreBreedingErrorState({required this.errorMessage});
}

class GetMoreBreedingSuccessState extends BreedingState {
  final BreedingModel breedingModel;

  const GetMoreBreedingSuccessState({required this.breedingModel});
}