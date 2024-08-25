import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:leach/core/base_use_case/base_use_case.dart';
import 'package:leach/core/error/failure.dart';
import 'package:leach/features/profile/domain/base_repo/profie_base_repo.dart';

class AddPhotoForPetUseCase extends BaseUseCase<String, AddPhotoForPetParams> {
  ProfileBaseRepository profileBaseRepository;

  AddPhotoForPetUseCase({required this.profileBaseRepository});

  @override
  Future<Either<String, Failure>> call(AddPhotoForPetParams parameter) async {
    final result = await profileBaseRepository.addPhotoForPet(
        petId: parameter.id, image: parameter.image);
    return result;
  }
}

class AddPhotoForPetParams {
  final String id;
  final File image;

  AddPhotoForPetParams({
    required this.id,
    required this.image,
  });
}
