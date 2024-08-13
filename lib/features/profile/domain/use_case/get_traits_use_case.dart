import 'package:dartz/dartz.dart';
import 'package:leach/core/base_use_case/base_use_case.dart';
import 'package:leach/core/error/failure.dart';
import 'package:leach/features/profile/domain/base_repo/profie_base_repo.dart';
import 'package:leach/features/profile/domain/model/create_pet.dart';
import 'package:leach/features/profile/domain/model/traits_model.dart';

class GetTraitsUseCase extends BaseUseCase<List<PetTrait>, NoParameter> {
  ProfileBaseRepository profileBaseRepository;

  GetTraitsUseCase({required this.profileBaseRepository});

  @override
  Future<Either<List<PetTrait>, Failure>> call(parameter) async {
    final result = await profileBaseRepository.getTraits();

    return result;
  }
}
