import 'package:dartz/dartz.dart';
import 'package:leach/core/base_use_case/base_use_case.dart';
import 'package:leach/core/error/failure.dart';
import 'package:leach/features/profile/domain/base_repo/profie_base_repo.dart';

class ChangePrivacyUseCase extends BaseUseCase<String, NoParameter> {
  ProfileBaseRepository profileBaseRepository;

  ChangePrivacyUseCase({required this.profileBaseRepository});

  @override
  Future<Either<String, Failure>> call(parameter) async {
    final result = await profileBaseRepository.changePrivacy();

    return result;
  }
}
