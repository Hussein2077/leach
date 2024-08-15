import 'package:equatable/equatable.dart';
import 'package:leach/features/profile/domain/model/traits_model.dart';

abstract class GetTraitsState extends Equatable {
  const GetTraitsState();

  @override
  List<Object> get props => [];
}

class GetTraitInitialState extends GetTraitsState {
  const GetTraitInitialState();
}

class GetTraitLoadingState extends GetTraitsState {
  const GetTraitLoadingState();
}

class GetTraitErrorMessageState extends GetTraitsState {
  final String errorMessage;

  const GetTraitErrorMessageState({required this.errorMessage});
}

class GetTraitSuccessMessageState extends GetTraitsState {
  final List<PetTrait>  petTraits;

  const GetTraitSuccessMessageState({required this.petTraits});
}
