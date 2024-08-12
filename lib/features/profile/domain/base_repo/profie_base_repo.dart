import 'package:dartz/dartz.dart';
import 'package:leach/core/error/failure.dart';
import 'package:leach/features/profile/domain/model/create_pet.dart';

abstract class ProfileBaseRepository {
  Future<Either<PetProfileModel, Failure>> createPet (PetProfileModel petProfileModel);


}
