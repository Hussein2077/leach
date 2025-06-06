import 'package:dartz/dartz.dart';
import 'package:leach/core/base_use_case/base_use_case.dart';
import 'package:leach/core/error/failure.dart';
import 'package:leach/features/profile/domain/base_repo/profie_base_repo.dart';

class UnBlockUserUseCase extends BaseUseCase<String, String> {
  ProfileBaseRepository profileBaseRepository;
  UnBlockUserUseCase({required this.profileBaseRepository});

  @override
  Future<Either<String, Failure>> call(String parameter) async {
    final result = await profileBaseRepository.unBlockUser(id: parameter);
    return result;
  }
}
