
import 'package:equatable/equatable.dart';
import 'package:leach/features/profile/domain/model/create_pet.dart';

abstract class CreatePetState extends Equatable {
  const CreatePetState();

  @override
  List<Object> get props => [];
}

class CreatePetInitial extends CreatePetState {}
class CreatePetLoadingState extends CreatePetState{
  const CreatePetLoadingState();
}
class CreatePetErrorMessageState extends CreatePetState{
  final String errorMessage ;

  const CreatePetErrorMessageState({required this.errorMessage});


}

class CreatePetSuccessMessageState extends CreatePetState{
  final PetProfileModel  petProfileModel ;


  const CreatePetSuccessMessageState(  {required this.petProfileModel,});
}