import 'package:equatable/equatable.dart';

class HowToModel extends Equatable {
  final int id;
  final String title;
  final String description;
  final int difficultyLevel;
  final List<Step> steps;
  final List<Tip> tips;

  const HowToModel({
    required this.id,
    required this.title,
    required this.description,
    required this.difficultyLevel,
    required this.steps,
    required this.tips,
  });

  @override
  List<Object?> get props => [id, title, description, difficultyLevel, steps, tips];

  factory HowToModel.fromJson(Map<String, dynamic> json) {
    return HowToModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      difficultyLevel: json['difficulty_level'],
      steps: List<Step>.from(json['steps'].map((x) => Step.fromJson(x))),
      tips: List<Tip>.from(json['tips'].map((x) => Tip.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'difficulty_level': difficultyLevel,
      'steps': steps.map((x) => x.toJson()).toList(),
      'tips': tips.map((x) => x.toJson()).toList(),
    };
  }
}

class Step extends Equatable {
  final int id;
  final String text;
  final String picture;

  const Step({
    required this.id,
    required this.text,
    required this.picture,
  });

  @override
  List<Object?> get props => [id, text, picture];

  factory Step.fromJson(Map<String, dynamic> json) {
    return Step(
      id: json['id'],
      text: json['text'],
      picture: json['picture'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'text': text,
      'picture': picture,
    };
  }
}

class Tip extends Equatable {
  final int id;
  final String text;

  const Tip({
    required this.id,
    required this.text,
  });

  @override
  List<Object?> get props => [id, text];

  factory Tip.fromJson(Map<String, dynamic> json) {
    return Tip(
      id: json['id'],
      text: json['text'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'text': text,
    };
  }
}