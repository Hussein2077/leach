import 'dart:io';
import 'package:equatable/equatable.dart';
abstract class BaseCreatePetEvent extends Equatable {
  const BaseCreatePetEvent();

  @override
  List<Object> get props => [];
}

class CreatePetEvent
    extends BaseCreatePetEvent {
  final String username;
  final String name;
  final String gender;
  final String petType;
  final bool pureBred;
  final String breed;
  final String? secondBreed;
  final String dateOfBirth;
  final double weight;
  final bool breedingExperience;
  final bool neuteredSpayed;
  final File? profilePicture;
  final File? medicalPassport;
  final bool breedingAvailable;
  final List<int>? traits;
  final List<int> ? subtraits;
  final List<File> pictures;

  final String? bio;
final String breedSize;
  const CreatePetEvent({
    required this.username,
    required this.name,
    required this.gender,
    required this.petType,
    required this.pureBred,
    required this.breed,
    this.secondBreed,
    required this.dateOfBirth,
    required this.weight,
    required this.breedingExperience,
    required this.neuteredSpayed,
    this.profilePicture,
    this.medicalPassport,
    required this.breedingAvailable,
    required this.pictures,
    required this.breedSize,
      this.traits,
      this.subtraits,

    this.bio,
  });
}
class  UpdatePetEvent
    extends BaseCreatePetEvent {
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

  const UpdatePetEvent({
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
}

