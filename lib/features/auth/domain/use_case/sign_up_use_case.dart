import 'package:dartz/dartz.dart';
import 'package:leach/core/base_use_case/base_use_case.dart';
import 'package:leach/core/error/failure.dart';
import 'package:leach/core/models/profile_data_model.dart';
import 'package:leach/core/resource_manager/enums.dart';
import 'package:leach/features/auth/domain/repo/base_repo.dart';

class SignUpWithEmailAndPasswordUseCase
    extends BaseUseCase<UserModel, SignUpModel> {
  BaseRepository baseRepository;

  SignUpWithEmailAndPasswordUseCase({required this.baseRepository});

  @override
  Future<Either<UserModel, Failure>> call(
      SignUpModel parameter) async {
    final result = await baseRepository.signUpWithEmailAndPassword(parameter);

    return result;
  }
}

class SignUpModel {
  final String? userName;
  final String? email;
  final String? phone;
  final String? password;
  final String? area;
  final String? city;
  final String? name;

  SignUpModel({
     this.userName,
     this.email,
     this.phone,
     this.password,
     this.area,
     this.city,
     this.name,

  }) ;


}
