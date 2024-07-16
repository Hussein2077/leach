import 'package:dartz/dartz.dart';
import 'package:leach/core/base_use_case/base_use_case.dart';
import 'package:leach/core/error/failure.dart';
import 'package:leach/features/auth/domain/repo/base_repo.dart';

class DeleteAccountUseCase {
  BaseRepository baseRepository;

  DeleteAccountUseCase({required this.baseRepository});

  Future<Either<String, Failure>> deleteAccount() async {
    final result = await baseRepository.deleteAccount();

    return result;
  }
}
