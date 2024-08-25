import 'package:dartz/dartz.dart';
import 'package:leach/core/base_use_case/base_use_case.dart';
import 'package:leach/core/error/failure.dart';
import 'package:leach/core/models/profile_data_model.dart';
import 'package:leach/features/auth/domain/repo/base_repo.dart';

class LoginWithEmailAndPasswordUseCase
    extends BaseUseCase< UserModel, AuthModel> {
  BaseRepository baseRepository;

  LoginWithEmailAndPasswordUseCase({required this.baseRepository});

  @override
  Future<Either<UserModel, Failure>> call(
      AuthModel parameter) async {
    final result = await baseRepository.loginWithEmailAndPassword(parameter);

    return result;
  }
}

class AuthModel {
  final String phoneOrEmail;
  final String password;
  final String? socialID;

  AuthModel({
    required this.phoneOrEmail ,
    required this.password,
    this.socialID,
  });
}
