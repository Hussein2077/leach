import 'package:equatable/equatable.dart';

class PetTrait extends Equatable {
  final int id;
  final String trait;
  final String description;
  final List<SubTrait> subtraits;

  const PetTrait({
    required this.id,
    required this.trait,
    required this.description,
    required this.subtraits,
  });

  factory PetTrait.fromJson(Map<String, dynamic> json) {
    return PetTrait(
      id: json['id'] as int,
      trait: json['trait'] as String,
      description: json['description'] as String,
      subtraits: (json['subtraits'] as List<dynamic>)
          .map((item) => SubTrait.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'trait': trait,
      'description': description,
      'subtraits': subtraits.map((subtrait) => subtrait.toJson()).toList(),
    };
  }

  @override
  List<Object?> get props => [id, trait, description, subtraits];
}

class SubTrait extends Equatable {
  final int id;
  final int petTraitId;
  final String subTrait;
  final String description;

  const SubTrait({
    required this.id,
    required this.petTraitId,
    required this.subTrait,
    required this.description,
  });

  factory SubTrait.fromJson(Map<String, dynamic> json) {
    return SubTrait(
      id: json['id'] as int,
      petTraitId: json['pet_trait_id'] as int,
      subTrait: json['sub_trait'] as String,
      description: json['description'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'pet_trait_id': petTraitId,
      'sub_trait': subTrait,
      'description': description,
    };
  }

  @override
  List<Object?> get props => [id, petTraitId, subTrait, description];
}