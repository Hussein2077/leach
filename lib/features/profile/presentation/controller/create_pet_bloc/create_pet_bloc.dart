import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leach/core/utils/api_helper.dart';
import 'package:leach/features/profile/domain/model/create_pet.dart';
import 'package:leach/features/profile/domain/use_case/CREATE_PET_USE_CASE.dart';
import 'package:leach/features/profile/presentation/controller/create_pet_bloc/create_pet_events.dart';
import 'package:leach/features/profile/presentation/controller/create_pet_bloc/create_pet_states.dart';

class CreatePetBloc extends Bloc<BaseCreatePetEvent, CreatePetState> {
  CreatePetUseCase createPetUseCase;

  CreatePetBloc({
    required this.createPetUseCase,
  }) : super(CreatePetInitial()) {
    on<CreatePetEvent>((event, emit) async {
      emit(
        const CreatePetLoadingState(),
      );
      final result = await createPetUseCase.call(PetProfileModel(
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
        pictures: event.pictures,

        bio: event.bio,
      ));
      result.fold(
        (l) => emit(
          CreatePetSuccessMessageState(
            petProfileModel: l,
          ),
        ),
        (r) => emit(
          CreatePetErrorMessageState(
            errorMessage: DioHelper().getTypeOfFailure(r),
          ),
        ),
      );
    });
  }
}
