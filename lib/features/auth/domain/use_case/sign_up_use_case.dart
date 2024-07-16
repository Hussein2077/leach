import 'package:dartz/dartz.dart';
import 'package:leach/core/base_use_case/base_use_case.dart';
import 'package:leach/core/error/failure.dart';
import 'package:leach/core/resource_manager/themes/enums.dart';
import 'package:leach/features/auth/domain/repo/base_repo.dart';

class SignUpWithEmailAndPasswordUseCase
    extends BaseUseCase<Map<String, dynamic>, SignUpModel> {
  BaseRepository baseRepository;

  SignUpWithEmailAndPasswordUseCase({required this.baseRepository});

  @override
  Future<Either<Map<String, dynamic>, Failure>> call(
      SignUpModel parameter) async {
    final result = await baseRepository.signUpWithEmailAndPassword(parameter);

    return result;
  }
}

class SignUpModel {
  final String? phone;
  final String? password;
  final String? code;
  final PhoneOrEmail? phoneOrEmailType ;

  const SignUpModel( {
    this.phone,
    this.code,
    this.password,
    this.phoneOrEmailType,
  });
}
