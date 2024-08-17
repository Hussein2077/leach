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
  final double? weight;
  final  dynamic? weightFromApi;
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
  final String? breedSize;


  const PetProfileModel({
    required this.username,
    required this.name,
    required this.gender,
    required this.petType,
    required this.pureBred,
    required this.breed,
    this.secondBreed,
    this.weightFromApi,
    required this.dateOfBirth,
      this.weight,
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
    this.breedSize,

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
      pureBred: map['pure_bred']==1,
      breed: map['breed'],
      secondBreed: map['second_breed'],
      dateOfBirth: map['date_of_birth'],
      age: map['age'],
      weightFromApi: map['weight'],
      breedingExperience: map['breeding_experience']==1,
      neuteredSpayed: map['neutered_spayed']==1,
      profilePictureFromApi: map['profile_picture'],
      medicalPassportFromApi: map['medical_passport'],
      bio: map['bio'],
      breedSize:  map['size'],
      breedingAvailable: map['breeding_available']==1,
      picturesFromApi:
      List<Picture>.from(map['pictures']?.map((x) => Picture.fromMap(x))),

    );
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