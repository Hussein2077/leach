import 'package:dartz/dartz.dart';
import 'package:leach/core/base_use_case/base_use_case.dart';
import 'package:leach/core/error/failure.dart';
import 'package:leach/features/auth/data/models/auth_with_google_model.dart';
import 'package:leach/features/auth/domain/repo/base_repo.dart';

class SignInWithGoogleUC extends BaseUseCase<AuthWithGoogleModel, NoParameter> {
  BaseRepository baseRepository;

  SignInWithGoogleUC({required this.baseRepository});

  @override
  Future<Either<AuthWithGoogleModel, Failure>> call(NoParameter parameter) async {
    final result = await baseRepository.siginWithGoogle();

    return result;
  }
}
