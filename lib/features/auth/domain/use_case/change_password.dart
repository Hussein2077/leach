import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:leach/core/base_use_case/base_use_case.dart';
import 'package:leach/core/error/failure.dart';
import 'package:leach/features/auth/domain/repo/base_repo.dart';
import 'package:leach/features/auth/domain/use_case/sign_up_use_case.dart';
class ChangePasswordUseCase
    extends BaseUseCase<Map<String, dynamic>, SignUpModel> {
  BaseRepository baseRepository;

  ChangePasswordUseCase({required this.baseRepository});

  @override
  Future<Either<Map<String, dynamic>, Failure>> call(
      SignUpModel parameter) async {
    final result = await baseRepository.changePassword(parameter);

    return result;
  }
}