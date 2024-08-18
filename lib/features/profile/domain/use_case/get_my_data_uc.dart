import 'package:dartz/dartz.dart';
import 'package:leach/core/base_use_case/base_use_case.dart';
import 'package:leach/core/error/failure.dart';
import 'package:leach/core/models/profile_data_model.dart';
import 'package:leach/features/profile/domain/base_repo/profie_base_repo.dart';

class GetMyDataUseCase extends BaseUseCase<UserModel, NoParameter> {
  ProfileBaseRepository profileBaseRepository;
  GetMyDataUseCase({required this.profileBaseRepository});

  @override
  Future<Either<UserModel, Failure>> call(NoParameter parameter) async {
    final result = await profileBaseRepository.getMyData();
    return result;
  }
}

