import 'package:dartz/dartz.dart';
import 'package:leach/core/error/failure.dart';
import 'package:leach/core/utils/api_helper.dart';
import 'package:leach/features/profile/data/profile_remote_data_source.dart';
import 'package:leach/features/profile/domain/base_repo/profie_base_repo.dart';
import 'package:leach/features/profile/domain/model/create_pet.dart';

class ProfileRepositoryImp extends ProfileBaseRepository {
  final ProfileBaseRemotelyDataSource profileBaseRemotelyDataSource;

  ProfileRepositoryImp({required this.profileBaseRemotelyDataSource});

  @override
  Future<Either<PetProfileModel, Failure>> createPet(PetProfileModel petProfileModel)async {
    try {
      final result =
          await profileBaseRemotelyDataSource.createPet(petProfileModel);
      return Left(result);
    } on Exception catch (e) {
      return right(DioHelper.buildFailure(e));
    }
  }

}