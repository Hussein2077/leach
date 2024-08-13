import 'package:equatable/equatable.dart';

class Pet extends Equatable {
  final int id;
  final String uuid;
  final int userId;
  final String username;
  final String name;
  final String gender;
  final String petType;
  final bool pureBred;
  final String breed;
  final String? secondBreed;
  final DateTime dateOfBirth;
  final int age;
  final int weight;
  final String? size;
  final bool breedingExperience;
  final bool neuteredSpayed;
  final String profilePicture;
  final String medicalPassport;
  final String bio;
  final bool breedingAvailable;
  final bool adoptionAvailable;
  final List<Trait> traits;
  final List<Trait> subtraits;
  final List<PetPicture> pictures;

  const Pet({
    required this.id,
    required this.uuid,
    required this.userId,
    required this.username,
    required this.name,
    required this.gender,
    required this.petType,
    required this.pureBred,
    required this.breed,
    this.secondBreed,
    required this.dateOfBirth,
    required this.age,
    required this.weight,
    this.size,
    required this.breedingExperience,
    required this.neuteredSpayed,
    required this.profilePicture,
    required this.medicalPassport,
    required this.bio,
    required this.breedingAvailable,
    required this.adoptionAvailable,
    required this.traits,
    required this.subtraits,
    required this.pictures,
  });

  @override
  List<Object?> get props => [
    id,
    uuid,
    userId,
    username,
    name,
    gender,
    petType,
    pureBred,
    breed,
    secondBreed,
    dateOfBirth,
    age,
    weight,
    size,
    breedingExperience,
    neuteredSpayed,
    profilePicture,
    medicalPassport,
    bio,
    breedingAvailable,
    adoptionAvailable,
    traits,
    subtraits,
    pictures,
  ];

  factory Pet.fromJson(Map<String, dynamic> json) {
    return Pet(
      id: json['id'],
      uuid: json['uuid'],
      userId: json['user_id'],
      username: json['username'],
      name: json['name'],
      gender: json['gender'],
      petType: json['pet_type'],
      pureBred: json['pure_bred'] == 1,
      breed: json['breed'],
      secondBreed: json['second_breed'],
      dateOfBirth: DateTime.parse(json['date_of_birth']),
      age: json['age'],
      weight: json['weight'],
      size: json['size'],
      breedingExperience: json['breeding_experience'] == 1,
      neuteredSpayed: json['neutered_spayed'] == 1,
      profilePicture: json['profile_picture'],
      medicalPassport: json['medical_passport'],
      bio: json['bio'],
      breedingAvailable: json['breeding_available'] == 1,
      adoptionAvailable: json['adoption_available'] == 1,
      traits: (json['traits'] as List).map((e) => Trait.fromJson(e)).toList(),
      subtraits:
      (json['subtraits'] as List).map((e) => Trait.fromJson(e)).toList(),
      pictures: (json['pictures'] as List)
          .map((e) => PetPicture.fromJson(e))
          .toList(),
    );
  }
}

class Trait extends Equatable {
  final String name;

  const Trait({required this.name});

  @override
  List<Object?> get props => [name];

  factory Trait.fromJson(Map<String, dynamic> json) {
    return Trait(name: json['name']);
  }
}

class PetPicture extends Equatable {
  final String uuid;
  final String picture;

  const PetPicture({
    required this.uuid,
    required this.picture,
  });

  @override
  List<Object?> get props => [uuid, picture];

  factory PetPicture.fromJson(Map<String, dynamic> json) {
    return PetPicture(
      uuid: json['uuid'],
      picture: json['picture'],
    );
  }
}
