import 'package:dartz/dartz.dart';
import 'package:leach/core/error/failure.dart';
import 'package:leach/features/profile/domain/model/create_pet.dart';
import 'package:leach/features/profile/domain/model/traits_model.dart';
import 'package:leach/features/profile/domain/use_case/CREATE_PET_USE_CASE.dart';

abstract class ProfileBaseRepository {
  Future<Either<PetProfileModel, Failure>> createPet(
      PetProfileModel petProfileModel);  Future<Either<PetProfileModel, Failure>> updatePet (
      UpdatePetRequest petProfileModel);

  Future<Either<List<PetTrait>, Failure>> getTraits();
}
