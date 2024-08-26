import 'dart:convert';
import 'package:leach/core/models/pet_model.dart';
import 'package:leach/core/models/users_model.dart';

import '../../features/profile/domain/model/user_data_model.dart';

class UserModel {
  String? id;
  String? email;
  String? name;
  String? phoneNumber;
  String? username;
  String? city;
  String? area;
  String? uuid;
  String? image ;
  String? bio ;
  String? accountStatus ;
  bool? privateAccount ;
  List<Pet>? pets;
  Friends? friends;

  static UserModel? _instance;

  UserModel({
    this.id,
    this.email,
    this.name,
    this.phoneNumber,
    this.username,
    this.city,
    this.area,
    this.uuid,
    this.image,
    this.bio,
    this.accountStatus,
    this.privateAccount,
    this.pets,
    this.friends
  });

  void clearInstance() {
    _instance = null;
  }

  setNewUserData({
    String? id,
    String? email,
    String? name,
    String? phoneNumber,
    String? username,
    String? city,
    String? area,
    String? uuid,
    String? image,
    String? bio ,
    String? accountStatus ,
    bool? privateAccount ,
    List<Pet>? pets ,
    Friends? friends ,

  }) {
    this.id = id ?? this.id;
    this.email = email ?? this.email;
    this.name = name ?? this.name;
    this.phoneNumber = phoneNumber ?? this.phoneNumber;
    this.username = username ?? this.username;
    this.city = city ?? this.city;
    this.area = area ?? this.area;
    this.uuid = uuid ?? this.uuid;
    this.image = image ?? this.image;
    this.bio = bio ?? this.bio;
    this.accountStatus = accountStatus ?? this.accountStatus;
    this.privateAccount = privateAccount ?? this.privateAccount;
    this.pets = pets ?? this.pets;
    this.friends = friends ?? this.friends;
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    if (_instance == null) {
      _instance = UserModel(
        id: map['id']?.toString(),
        email: map['email']??'',
        name: map['name'] ?? '',
        phoneNumber: map['phone_number']?? '',
        username: map['username']?? '',
        city: map['city']?? '',
        area: map['area']?? '',
        uuid: map['uuid']?? '',
        image: map['profile_picture']?? '',
        bio: map['bio']?? '',
        accountStatus: map['account_status']?? '',
        privateAccount: map['private_account']  ==0 ? false: true,
        pets: map['pets'] == null ? [] :  (map['pets'] as List).map((e) => Pet.fromJson(e)).toList(),
        friends:map['friends'] == null ? null :  Friends.fromJson(map['friends']),
      );
    } else {
      _instance?.setNewUserData(
        id: map['id']?.toString(),
        email: map['email']?? '',
        name: map['name']?? '',
        phoneNumber: map['phone_number']?? '',
        username: map['username']?? '',
        city: map['city']?? '',
        area: map['area']?? '',
        uuid: map['uuid']?? '',
        image: map['profile_picture']?? '',
        bio: map['bio']?? '',
        accountStatus: map['account_status']?? '',
        privateAccount: map['private_account']==0 ? false: true,
        pets: map['pets'] == null ? [] :  (map['pets'] as List).map((e) => Pet.fromJson(e)).toList(),
        friends:  Friends.fromJson(map['friends']),
      );
    }
    return _instance!;
  }

  static UserModel getInstance() {
    return _instance ?? UserModel();
  }
}
