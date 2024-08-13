import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:leach/core/base_use_case/base_use_case.dart';
import 'package:leach/core/error/failure.dart';
import 'package:leach/features/profile/domain/base_repo/profie_base_repo.dart';
import 'package:leach/features/profile/domain/model/create_pet.dart';

class CreatePetUseCase extends BaseUseCase<PetProfileModel,PetProfileModel>{
  ProfileBaseRepository  profileBaseRepository;

  CreatePetUseCase({required this.profileBaseRepository});

  @override
  Future<Either< PetProfileModel, Failure>> call(
      PetProfileModel parameter) async {
    final result = await profileBaseRepository.createPet(parameter);

    return result;
  }
}
class UpdatePetUseCase extends BaseUseCase<PetProfileModel,UpdatePetRequest>{
  ProfileBaseRepository  profileBaseRepository;

  UpdatePetUseCase({required this.profileBaseRepository});

  @override
  Future<Either< PetProfileModel, Failure>> call(
      UpdatePetRequest parameter) async {
    final result = await profileBaseRepository.updatePet(parameter);

    return result;
  }
}
class UpdatePetRequest {
  final String? username;
  final String uuid;
  final String? name;
  final double? weight;
  final String? size;
  final bool? breedingExperience;
  final bool? neuteredSpayed;
  final bool? breedingAvailable;
  final File? profilePicture;
  final String? medicalPassport;
  final List<int>? traits;
  final List<int>? subtraits;

  UpdatePetRequest({
    this.username,
    this.name,
    required this.uuid,
    this.weight,
    this.size,
    this.breedingExperience,
    this.neuteredSpayed,
    this.breedingAvailable,
    this.profilePicture,
    this.medicalPassport,
    this.traits,
    this.subtraits,
  });

  // Function to convert the object to JSON for API requests
  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'name': name,
      'weight': weight,
      'size': size,
      'breeding_experience': breedingExperience,
      'neutered_spayed': neuteredSpayed,
      'breeding_available': breedingAvailable,
      'profile_picture': profilePicture,
      'medical_passport': medicalPassport,
      'traits[]': traits,
      'subtraits[]': subtraits,
    };
  }
}
