import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:leach/core/base_use_case/base_use_case.dart';
import 'package:leach/core/models/profile_data_model.dart';
import 'package:leach/features/profile/domain/base_repo/profie_base_repo.dart';

import '../../../../core/error/failure.dart';

class UpdateMyDataUseCase extends BaseUseCase<UserModel, UpdateDataParams> {
  ProfileBaseRepository profileBaseRepository;
  UpdateMyDataUseCase({required this.profileBaseRepository});

  @override
  Future<Either<UserModel, Failure>> call(UpdateDataParams parameter) async {
    final result = await profileBaseRepository.updateMyData(parameter);
    return result;
  }
}
class UpdateDataParams {
  String? name;
  String? username;
  String? bio;
  String? city;
  String? area;
  File? profilePicture;


  UpdateDataParams({
    required this.name,
    required this.username,
    required this.bio,
    required this.city,
    required this.area,
    required this.profilePicture,

  });
}