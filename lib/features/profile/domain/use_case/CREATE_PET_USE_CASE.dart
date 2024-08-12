import 'package:dartz/dartz.dart';
import 'package:leach/core/base_use_case/base_use_case.dart';
import 'package:leach/core/error/failure.dart';
import 'package:leach/features/profile/domain/base_repo/profie_base_repo.dart';
import 'package:leach/features/profile/domain/model/create_pet.dart';

class CreatePetUseCase extends BaseUseCase<PetProfileModel,PetProfileModel>{
  ProfileBaseRepository  profileBaseRepository;

  CreatePetUseCase({required this.profileBaseRepository});

  @override
  Future<Either< PetProfileModel, Failure>> call(
      PetProfileModel parameter) async {
    final result = await profileBaseRepository.createPet(parameter);

    return result;
  }
}