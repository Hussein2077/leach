import 'package:dartz/dartz.dart';
import 'package:leach/core/base_use_case/base_use_case.dart';
import 'package:leach/core/error/failure.dart';
import 'package:leach/features/profile/domain/base_repo/profie_base_repo.dart';
import 'package:leach/features/profile/domain/model/user_data_model.dart';

class GetUserUseCase extends BaseUseCase<UserDataModel, String> {
  ProfileBaseRepository profileBaseRepository;
  GetUserUseCase({required this.profileBaseRepository});

  @override
  Future<Either<UserDataModel, Failure>> call(String parameter) async {
    final result = await profileBaseRepository.getUser(id: parameter);
    return result;
  }
}
