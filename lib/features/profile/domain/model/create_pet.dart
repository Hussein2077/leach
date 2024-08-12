import 'dart:io';

import 'package:equatable/equatable.dart';

class PetProfileModel  extends Equatable{
  final String username;
  final String name;
  final String gender;
  final String petType;
  final bool pureBred;
  final String breed;
  final String? secondBreed;
  final String? dateOfBirth;
  final double weight;
  final bool breedingExperience;
  final bool neuteredSpayed;
  final File? profilePicture;
  final String? profilePictureFromApi;
  final File? medicalPassport;
  final String? medicalPassportFromApi;
  final bool breedingAvailable;
  final List<int>? traits;
  final List<int>? subtraits;
  final List<File>? pictures;
  final int? id;
  final String? uuid;
  final int? userId;

  final int? age;

  final String? bio;
  final List<Trait>? traitsFromApi;
  final List<SubTrait>? subtraitsFromApi;
  final List<Picture>? picturesFromApi;
  const PetProfileModel({
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

      this.pictures,
      this.traits,
      this.subtraits,
      this.id,
      this.uuid,
      this.userId,
      this.age,
    this.bio,
    this.traitsFromApi,
    this.subtraitsFromApi,
    this.picturesFromApi,
    this.medicalPassportFromApi,
    this.profilePictureFromApi,
  });

  factory PetProfileModel.fromMap(Map<String, dynamic> map) {
    return PetProfileModel(
      id: map['id'],
      uuid: map['uuid'],
      userId: map['user_id'],
      username: map['username'],
      name: map['name'],
      gender: map['gender'],
      petType: map['pet_type'],
      pureBred: map['pure_bred'],
      breed: map['breed'],
      secondBreed: map['second_breed'],
      dateOfBirth: map['date_of_birth'],
      age: map['age'],
      weight: map['weight'],
      breedingExperience: map['breeding_experience'],
      neuteredSpayed: map['neutered_spayed'],
      profilePictureFromApi: map['profile_picture'],
      medicalPassportFromApi: map['medical_passport'],
      bio: map['bio'],
      breedingAvailable: map['breeding_available'],
      traitsFromApi: List<Trait>.from(map['traits']?.map((x) => Trait.fromMap(x))),
      subtraitsFromApi: List<SubTrait>.from(
          map['subtraits']?.map((x) => SubTrait.fromMap(x))),
      picturesFromApi:
      List<Picture>.from(map['pictures']?.map((x) => Picture.fromMap(x))),

    );
  }

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'name': name,
      'gender': gender,
      'pet_type': petType,
      'pure_bred': pureBred,
      'breed': breed,
      'second_breed': secondBreed,
      'date_of_birth': dateOfBirth,
      'weight': weight,
      'breeding_experience': breedingExperience,
      'neutered_spayed': neuteredSpayed,
      'profile_picture': profilePicture,
      'medical_passport': medicalPassport,
      'breeding_available': breedingAvailable,
      'pictures[]': pictures,
      'traits[]': traits,
      'subtraits[]': subtraits,
    };
  }

  @override
  // TODO: implement props
  List<Object?> get props =>[
    username,
    name,
    gender,
    petType,
    pureBred,
    breed,
    secondBreed,
    dateOfBirth,
    weight,
    breedingExperience,
    neuteredSpayed,
    profilePicture,
    medicalPassport,
    breedingAvailable,
    pictures,
    traits,
    subtraits,
    id,
    uuid,
    userId,
    age,
    bio

  ];
}

class Trait extends Equatable{
  final int id;
  final String trait;
  final String description;

  const Trait({
    required this.id,
    required this.trait,
    required this.description,
  });

  factory Trait.fromMap(Map<String, dynamic> map) {
    return Trait(
      id: map['id'],
      trait: map['trait'],
      description: map['description'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'trait': trait,
      'description': description,
    };
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
    id,
    trait,
    description
  ];
}

class SubTrait extends Equatable{
  final int id;
  final String subTrait;
  final String description;

  const SubTrait({
    required this.id,
    required this.subTrait,
    required this.description,
  });

  factory SubTrait.fromMap(Map<String, dynamic> map) {
    return SubTrait(
      id: map['id'],
      subTrait: map['sub_trait'],
      description: map['description'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'sub_trait': subTrait,
      'description': description,
    };
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
    id,
    subTrait,
    description
  ];
}

class Picture extends Equatable{
  final String uuid;
  final String picture;

  const Picture({
    required this.uuid,
    required this.picture,
  });

  factory Picture.fromMap(Map<String, dynamic> map) {
    return Picture(
      uuid: map['uuid'],
      picture: map['picture'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uuid': uuid,
      'picture': picture,
    };
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
    uuid,
    picture
  ];
}