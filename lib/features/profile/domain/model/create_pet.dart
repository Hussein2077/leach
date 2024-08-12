import 'package:equatable/equatable.dart';

class PetProfileModel  extends Equatable{
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
  final String? profilePicture;
  final String? medicalPassport;
  final bool breedingAvailable;
  final bool adoptionAvailable;
  final List<Trait> traits;
  final List<SubTrait> subtraits;
  final List<Picture> pictures;
  final int id;
  final String uuid;
  final int userId;

  final int age;

  final String? bio;

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
    required this.adoptionAvailable,
    required this.pictures,
    required this.traits,
    required this.subtraits,
    required this.id,
    required this.uuid,
    required this.userId,
    required this.age,
    this.bio,
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
      profilePicture: map['profile_picture'],
      medicalPassport: map['medical_passport'],
      bio: map['bio'],
      breedingAvailable: map['breeding_available'],
      adoptionAvailable: map['adoption_available'],
      traits: List<Trait>.from(map['traits']?.map((x) => Trait.fromMap(x))),
      subtraits: List<SubTrait>.from(
          map['subtraits']?.map((x) => SubTrait.fromMap(x))),
      pictures:
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
      'adoption_available': adoptionAvailable,
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
    adoptionAvailable,
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