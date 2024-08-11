import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:leach/core/models/profile_data_model.dart';
import 'package:leach/core/utils/api_helper.dart';
import 'package:leach/core/utils/constant_api.dart';
import 'package:leach/core/utils/methods.dart';
import 'package:leach/features/auth/domain/use_case/login_with_email_and_password_use_case.dart';
import 'package:leach/features/auth/domain/use_case/sign_up_use_case.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class BaseRemotelyDataSource {
  Future<UserModel> loginWithEmailAndPassword(AuthModel authModel);

  Future<String> deleteAccount();

  Future<UserModel> signUpWithEmailAndPassword(SignUpModel signUpModel);

  Future<String> sendCode(SignUpModel signUpModel);

  Future<Map<String, dynamic>> verifyCode(SignUpModel signUpModel);

  Future<Map<String, dynamic>> resetPassword(SignUpModel signUpModel);
  Future<PetProfileModel > createPet(PetProfileModel petProfileModel);

}

class AuthRemotelyDateSource extends BaseRemotelyDataSource {
  @override
  Future<UserModel> loginWithEmailAndPassword(AuthModel authModel) async {
    final Options options = await DioHelper().options();
    final body = {
      'identifier': authModel.phoneOrEmail,
      "password": authModel.password,

    };
    try {
      final response = await Dio().post(
        ConstantApi.login,
        data: body,
        options: options,
      );
      UserModel jsonData = UserModel.fromMap(response.data['data']['user']);
      SharedPreferences preferences = await SharedPreferences.getInstance();

      await Methods.instance
          .saveUserToken(authToken: response.data['data']['token']);
      return jsonData;
    } on DioException catch (e) {
      throw DioHelper.handleDioError(
          dioError: e, endpointName: "loginWithEmailAndPassword");
    }
  }

  @override
  Future<UserModel> signUpWithEmailAndPassword(SignUpModel signUpModel) async {
    final Options options = await DioHelper().options();
    final body = {
      'password': signUpModel.password,
      'phone_number': signUpModel.phone,
      'area': signUpModel.area,
      'city': signUpModel.city,
      'username': signUpModel.userName,
      'email': signUpModel.email,
      'name': signUpModel.name
    };

    try {
      final response = await Dio().post(
        ConstantApi.signUp,
        data: body,
        options: options,
      );
      log('messagemessagemessage');

      UserModel jsonData = UserModel.fromMap(response.data['data']['user']);

      await Methods.instance
          .saveUserToken(authToken: response.data['data']['token']);
      if (response.data['data']['token'] == null) {
        DioException? e;
        throw DioHelper.handleDioError(
            dioError: e, endpointName: "signUpWithEmailAndPassword");
      } else {
        return jsonData;
      }
    } on DioException catch (e) {
      throw DioHelper.handleDioError(
          dioError: e, endpointName: "signUpWithEmailAndPassword");
    }
  }

  @override
  Future<Map<String, dynamic>> resetPassword(SignUpModel signUpModel) async {
    final Options options = await DioHelper().options();
    final body = {
      'newPassword': signUpModel.password,
      'email': signUpModel.phone,
    };

    try {
      final response = await Dio().post(
        ' ConstantApi.resetPassword',
        data: body,
        options: options,
      );

      Map<String, dynamic> jsonData = response.data;

      return jsonData;
    } on DioException catch (e) {
      throw DioHelper.handleDioError(
          dioError: e, endpointName: "changePassword");
    }
  }

  @override
  Future<String> sendCode(SignUpModel signUpModel) async {
    final Options options = await DioHelper().options();
    late final Map<String, dynamic> body;
    body = {
      'email': signUpModel.phone,
    };

    try {
      final response = await Dio().post(
        ConstantApi.sendCodeToEmail,
        data: body,
        options: options,
      );

      // String jsonData = response.data;

      return 'Success';
    } on DioException catch (e) {
      throw DioHelper.handleDioError(dioError: e, endpointName: "sendCode");
    }
  }

  @override
  Future<Map<String, dynamic>> verifyCode(SignUpModel signUpModel) async {
    final Options options = await DioHelper().options();
    final body = {
      'email': signUpModel.phone,
    };

    try {
      final response = await Dio().post(
        ConstantApi.verifyCode,
        data: body,
        options: options,
      );

      Map<String, dynamic> jsonData = response.data;

      return jsonData;
    } on DioException catch (e) {
      throw DioHelper.handleDioError(dioError: e, endpointName: "verifyCode");
    }
  }

  @override
  Future<String> deleteAccount() async {
    final Options options = await DioHelper().options();

    try {
      final response = await Dio().delete(
        ConstantApi.deleteAccount,
        options: options,
      );

      String jsonData = response.data;

      return jsonData;
    } on DioException catch (e) {
      throw DioHelper.handleDioError(
          dioError: e, endpointName: "deleteAccount");
    }
  }

  @override
  Future<PetProfileModel> createPet(PetProfileModel petProfileModel) {
    // TODO: implement createPet
    throw UnimplementedError();
  }
}
class PetProfileModel {
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

  PetProfileModel({
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
      subtraits:
      List<SubTrait>.from(map['subtraits']?.map((x) => SubTrait.fromMap(x))),
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
}
class Trait {
  final int id;
  final String trait;
  final String description;

  Trait({
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
}

class SubTrait {
  final int id;
  final String subTrait;
  final String description;

  SubTrait({
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
}

class Picture {
  final String uuid;
  final String picture;

  Picture({
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
}