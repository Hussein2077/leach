import 'package:equatable/equatable.dart';
import 'package:leach/features/profile/domain/model/create_pet.dart';

abstract class CreatePetState extends Equatable {
  const CreatePetState();

  @override
  List<Object> get props => [];
}

class CreatePetInitial extends CreatePetState {}

class CreatePetLoadingState extends CreatePetState {
  const CreatePetLoadingState();
}

class CreatePetErrorMessageState extends CreatePetState {
  final String errorMessage;

  const CreatePetErrorMessageState({required this.errorMessage});
}

class CreatePetSuccessMessageState extends CreatePetState {
  final PetProfileModel petProfileModel;

  const CreatePetSuccessMessageState({
    required this.petProfileModel,
  });
}

//UpdatePet
class UpdatePetLoadingState extends CreatePetState {
  const UpdatePetLoadingState();
}

class UpdatePetErrorMessageState extends CreatePetState {
  final String errorMessage;

  const UpdatePetErrorMessageState({required this.errorMessage});
}

class UpdatePetSuccessMessageState extends CreatePetState {
  final PetProfileModel petProfileModel;

  const UpdatePetSuccessMessageState({
    required this.petProfileModel,
  });
}
// add photo for pet
class AddPhotoForPetLoadingState extends CreatePetState {
  const AddPhotoForPetLoadingState();
}

class AddPhotoForPetErrorMessageState extends CreatePetState {
  final String errorMessage;

  const AddPhotoForPetErrorMessageState({required this.errorMessage});

}

class AddPhotoForPetSuccessMessageState extends CreatePetState {
    final String message;

  const AddPhotoForPetSuccessMessageState({required this.message});
}