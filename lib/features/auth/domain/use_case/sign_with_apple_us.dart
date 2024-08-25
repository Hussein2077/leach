import 'package:dartz/dartz.dart';
import 'package:leach/core/base_use_case/base_use_case.dart';
import 'package:leach/core/error/failure.dart';
import 'package:leach/features/auth/data/models/auth_with_apple_model.dart';
import 'package:leach/features/auth/domain/repo/base_repo.dart';

class SignInWithAppleUC extends BaseUseCase<AuthWithAppleModel, NoParameter> {
  BaseRepository baseRepository;

  SignInWithAppleUC({required this.baseRepository});

  @override
  Future<Either<AuthWithAppleModel, Failure>> call(NoParameter parameter) async {
    final result = await baseRepository.siginWithApple();

    return result;
  }
}
