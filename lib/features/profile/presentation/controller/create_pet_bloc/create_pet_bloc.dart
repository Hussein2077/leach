import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leach/core/utils/api_helper.dart';
import 'package:leach/features/profile/domain/model/create_pet.dart';
import 'package:leach/features/profile/domain/use_case/CREATE_PET_USE_CASE.dart';
import 'package:leach/features/profile/domain/use_case/add_photo_for_pet.dart';
import 'package:leach/features/profile/presentation/controller/create_pet_bloc/create_pet_events.dart';
import 'package:leach/features/profile/presentation/controller/create_pet_bloc/create_pet_states.dart';

class CreatePetBloc extends Bloc<BaseCreatePetEvent, CreatePetState> {
  final CreatePetUseCase createPetUseCase;
  final UpdatePetUseCase updatePetUseCase;
  final AddPhotoForPetUseCase addPhotoForPetUseCase;

  CreatePetBloc({
    required this.createPetUseCase,
    required this.updatePetUseCase,
    required this.addPhotoForPetUseCase,
  }) : super(CreatePetInitial()) {
    on<CreatePetEvent>(_handleCreatePetEvent);
    on<UpdatePetEvent>(_handleUpdatePetEvent);
    on<AddPhotoForPetEvent>(_handleAddPhotoForPetEvent);
  }

  Future<void> _handleCreatePetEvent(
      CreatePetEvent event,
      Emitter<CreatePetState> emit,
      ) async {
    emit(const CreatePetLoadingState());
    final result = await createPetUseCase.call(
      PetProfileModel(
        username: event.username,
        name: event.name,
        gender: event.gender,
        petType: event.petType,
        pureBred: event.pureBred,
        breed: event.breed,
        secondBreed: event.secondBreed,
        dateOfBirth: event.dateOfBirth,
        weight: event.weight,
        breedingExperience: event.breedingExperience,
        neuteredSpayed: event.neuteredSpayed,
        profilePicture: event.profilePicture,
        medicalPassport: event.medicalPassport,
        breedingAvailable: event.breedingAvailable,
        traits: event.traits,
        subtraits: event.subtraits,
        breedSize: event.breedSize,
        pictures: event.pictures,
        bio: event.bio,
      ),
    );
    result.fold(
          (l) => emit(CreatePetSuccessMessageState(petProfileModel: l)),
          (r) => emit(CreatePetErrorMessageState(errorMessage: DioHelper().getTypeOfFailure(r))),
    );
  }

  Future<void> _handleUpdatePetEvent(
      UpdatePetEvent event,
      Emitter<CreatePetState> emit,
      ) async {
    emit(const UpdatePetLoadingState());
    final result = await updatePetUseCase.call(
      UpdatePetRequest(
        username: event.username,
        name: event.name,
        weight: event.weight,
        size: event.size,
        breedingExperience: event.breedingExperience,
        neuteredSpayed: event.neuteredSpayed,
        profilePicture: event.profilePicture,
        medicalPassport: event.medicalPassport,
        traits: event.traits,
        subtraits: event.subtraits,
        uuid: event.uuid,
        breedingAvailable: event.breedingAvailable,
      ),
    );
    result.fold(
          (l) => emit(UpdatePetSuccessMessageState(petProfileModel: l)),
          (r) => emit(UpdatePetErrorMessageState(errorMessage: DioHelper().getTypeOfFailure(r))),
    );
  }

  Future<void> _handleAddPhotoForPetEvent(
      AddPhotoForPetEvent event,
      Emitter<CreatePetState> emit,
      ) async {
    emit(const AddPhotoForPetLoadingState());
    final result = await addPhotoForPetUseCase.call(
      AddPhotoForPetParams(id: event.petId, image: event.image),
    );
    result.fold(
          (l) => emit(AddPhotoForPetSuccessMessageState(message: l)),
          (r) => emit(AddPhotoForPetErrorMessageState(errorMessage: DioHelper().getTypeOfFailure(r))),
    );
  }
}
