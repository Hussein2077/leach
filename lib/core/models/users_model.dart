import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String uuid;
  final String username;
  final String? profilePicture;

  const User({
    required this.uuid,
    required this.username,
    this.profilePicture,
  });

  @override
  List<Object?> get props => [uuid, username, profilePicture];

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      uuid: json['uuid'],
      username: json['username'],
      profilePicture: json['profile_picture'],
    );
  }
}
