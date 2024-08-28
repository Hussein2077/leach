import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:leach/core/base_use_case/base_use_case.dart';
import 'package:leach/core/error/failure.dart';
import 'package:leach/features/profile/data/profile_remote_data_source.dart';
import 'package:leach/features/profile/domain/base_repo/profie_base_repo.dart';

class ReportUserUseCase extends BaseUseCase<String, ReportParameter> {
  ProfileBaseRepository profileBaseRepository;
  ReportUserUseCase({required this.profileBaseRepository});

  @override
  Future<Either<String, Failure>> call(ReportParameter parameter) async {
    final result = await profileBaseRepository.reportUser( parameter);
    return result;
  }
}
class ReportParameter {
  //fixed_report specific_report picture
  final String id;
  final String? type;
  final String? description;
  final File? picture;

  ReportParameter({
    this.type,
    required this.id,
    this.description,
    this.picture,
  });


}
