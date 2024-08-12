import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:leach/features/profile/domain/model/create_pet.dart';

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
      this.traits,
      this.subtraits,

    this.bio,
  });
}

class DeleteAccountEvent extends BaseCreatePetEvent {}
