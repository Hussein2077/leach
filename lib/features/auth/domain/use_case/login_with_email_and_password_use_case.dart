import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:leach/core/base_use_case/base_use_case.dart';
import 'package:leach/core/error/failure.dart';
import 'package:leach/features/auth/domain/repo/base_repo.dart';

class LoginWithEmailAndPasswordUseCase
    extends BaseUseCase<Map<String, dynamic>, AuthModel> {
  BaseRepository baseRepository;

  LoginWithEmailAndPasswordUseCase({required this.baseRepository});

  @override
  Future<Either<Map<String, dynamic>, Failure>> call(
      AuthModel parameter) async {
    final result = await baseRepository.loginWithEmailAndPassword(parameter);

    return result;
  }
}

class AuthModel {
  final String phone;
  final String? password;
  final String? socialID;

  AuthModel({
    required this.phone,
    this.password,
    this.socialID,
  });
}
