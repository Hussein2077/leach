import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:leach/core/models/profile_data_model.dart';
import 'package:leach/core/utils/api_helper.dart';
import 'package:leach/core/utils/constant_api.dart';
import 'package:leach/features/profile/domain/model/create_pet.dart';
import 'package:http_parser/http_parser.dart';
import 'package:leach/features/profile/domain/model/friends_model.dart';
import 'package:leach/features/profile/domain/model/pending_friend_requests_model.dart';
import 'package:leach/features/profile/domain/model/traits_model.dart';
import 'package:leach/features/profile/domain/use_case/CREATE_PET_USE_CASE.dart';

abstract class ProfileBaseRemotelyDataSource {
  Future<PetProfileModel> createPet(PetProfileModel petProfileModel);
  Future<PetProfileModel> updatePet (UpdatePetRequest updatePetRequest);
  Future<List<PetTrait>> getTraits();
  Future<PendingFriendRequestsModel> getPendingFriendRequests({required String page});
  Future<String> acceptFriendRequests({required String id});
  Future<String> rejectFriendRequests({required String id});
  Future<FriendsModel> getFriends({required String page});
  Future<UserModel> getMyData();

}

class ProfileRemotelyDateSource extends ProfileBaseRemotelyDataSource {
  @override
  Future<PetProfileModel> createPet(PetProfileModel petProfileModel) async {
    FormData? formData;
    final Options options = await DioHelper().options();
    if (petProfileModel.profilePicture != null) {
      List<MultipartFile> pictureFiles = [];
      for (var picture in petProfileModel.pictures!) {
        pictureFiles.add(await MultipartFile.fromFile(
          picture.path,
          filename: picture.path.split('/').last,
          contentType: MediaType("image", "jpeg"),
        ));
      }
      formData = FormData.fromMap({
        'username': petProfileModel.username,
        'name': petProfileModel.name,
        'gender': petProfileModel.gender,
        'pet_type': petProfileModel.petType,
        'pure_bred': petProfileModel.pureBred ? 1 : 0,
        'breed': petProfileModel.breed,
        'second_breed': petProfileModel.secondBreed,
        'date_of_birth': petProfileModel.dateOfBirth,
        'weight': petProfileModel.weight,
        'breeding_experience': petProfileModel.breedingExperience ? 1 : 0,
        'neutered_spayed': petProfileModel.neuteredSpayed ? 1 : 0,
        'profile_picture': await MultipartFile.fromFile(
            petProfileModel.profilePicture!.path,
            filename:
                petProfileModel.profilePicture!.path.split('/').last.toString(),
            contentType: MediaType("image", "jpeg")),
        'pictures[]': pictureFiles,
        'medical_passport': await MultipartFile.fromFile(
            petProfileModel.medicalPassport!.path,
            filename: petProfileModel.medicalPassport!.path
                .split('/')
                .last
                .toString(),
            contentType: MediaType("image", "jpeg")),
        'breeding_available': petProfileModel.breedingAvailable ? 1 : 0,
        'size': petProfileModel.breedSize,
      });
    }

    try {
      final response = await Dio().post(
        ConstantApi.createPet,
        data: formData,
        options: options,
      );

      PetProfileModel jsonData =
          PetProfileModel.fromMap(response.data['data']['pet']);
      return jsonData;
    } on DioException catch (e) {
      throw DioHelper.handleDioError(dioError: e, endpointName: " createPet");
    }
  }
  @override
  Future<PetProfileModel> updatePet (UpdatePetRequest updatePetRequest) async {
    FormData? formData;
    final Options options = await DioHelper().options();

  if(updatePetRequest.profilePicture!=null){
    formData=FormData.fromMap({
      'username': updatePetRequest.username,
      'name': updatePetRequest.name,
      'weight': updatePetRequest.weight,
      'size': updatePetRequest.size,
      'breeding_experience': updatePetRequest.breedingExperience! ? 1 : 0,
      'neutered_spayed': updatePetRequest.neuteredSpayed! ? 1 : 0,
      'breeding_available': updatePetRequest.breedingAvailable! ? 1 : 0,
      'profile_picture': await MultipartFile.fromFile(
          updatePetRequest.profilePicture!.path,
          filename:
          updatePetRequest.profilePicture!.path.split('/').last.toString(),
          contentType: MediaType("image", "jpeg")),
      'medical_passport': updatePetRequest.medicalPassport,
      'traits[]': updatePetRequest.traits,
      'subtraits[]': updatePetRequest.subtraits,
    }) ;
  }
  else{
    formData=FormData.fromMap({
      'username': updatePetRequest.username,
      'name': updatePetRequest.name,
      'weight': updatePetRequest.weight,
      'size': updatePetRequest.size,
      'breeding_experience': updatePetRequest.breedingExperience! ? 1 : 0,
      'neutered_spayed': updatePetRequest.neuteredSpayed! ? 1 : 0,
      'breeding_available': updatePetRequest.breedingAvailable! ? 1 : 0,
      'medical_passport': updatePetRequest.medicalPassport,
      'traits[]': updatePetRequest.traits,
      'subtraits[]': updatePetRequest.subtraits,
    }) ;
  }

  @override
  Future<PendingFriendRequestsModel> getPendingFriendRequests({required String page}) async {
    Map<String, String> headers = await DioHelper().header();

    try {
      final response = await Dio().get(
        ConstantApi.getPendingFriendRequests(page),
        options: Options(
          headers: headers,
        ),
      );

      return PendingFriendRequestsModel.fromJson(response.data);
    } on DioException catch (e) {
      throw DioHelper.handleDioError(dioError: e, endpointName: 'getPendingFriendRequests');
    }
  }

  @override
  Future<String> acceptFriendRequests({required String id}) async {
    Map<String, String> headers = await DioHelper().header();

    try {
      final response = await Dio().post(
        ConstantApi.acceptFriendRequests(id),
        options: Options(
          headers: headers,
        ),
      );

      Map<String, dynamic> data = response.data;

      return data["message"];
    } on DioException catch (e) {
      throw DioHelper.handleDioError(dioError: e, endpointName: 'acceptFriendRequests');
    }
  }

  @override
  Future<String> rejectFriendRequests({required String id}) async {
    Map<String, String> headers = await DioHelper().header();

    try {
      final response = await Dio().delete(
        ConstantApi.rejectFriendRequests(id),
        options: Options(
          headers: headers,
        ),
      );

      Map<String, dynamic> data = response.data;

      return data["message"];
    } on DioException catch (e) {
      throw DioHelper.handleDioError(dioError: e, endpointName: 'rejectFriendRequests');
    }
  }

  @override
  Future<FriendsModel> getFriends({required String page}) async {
    Map<String, String> headers = await DioHelper().header();

    try {
      final response = await Dio().get(
        ConstantApi.getFriends(page),
        options: Options(
          headers: headers,
        ),
      );

      return FriendsModel.fromJson(response.data);
    } on DioException catch (e) {
      throw DioHelper.handleDioError(dioError: e, endpointName: 'getFriends');
    }
  }

  @override
  Future<UserModel> getMyData() async {
    Map<String, String> headers = await DioHelper().header();

    try {
      final response = await Dio().get(
        ConstantApi.getMyData,
        options: Options(
          headers: headers,
        ),
      );

      return UserModel.fromMap(response.data);
    } on DioException catch (e) {
      throw DioHelper.handleDioError(dioError: e, endpointName: 'getMyData');
    }
  }
    try {
      final response = await Dio().post(
        ConstantApi.updatePet(updatePetRequest.uuid ),
        data: formData,
        options: options,
      );

      PetProfileModel jsonData =
          PetProfileModel.fromMap(response.data['data']['pet']);
      return jsonData;
    } on DioException catch (e) {
      throw DioHelper.handleDioError(dioError: e, endpointName: " updatePet ");
    }
  }

  @override
  Future<List<PetTrait> > getTraits() async{
    final Options options = await DioHelper().options();
    try {
      final response =await Dio().get(ConstantApi.getTraits,
        options: options,
      );
      List<PetTrait> jsonData = List<PetTrait>.from(
          (response.data['data'] as List)
              .map((e) => PetTrait.fromJson(e)));
      return jsonData;
    } on DioException catch (e) {
      throw DioHelper.handleDioError(dioError: e, endpointName: " getTraits");
    }
  }

  @override
  Future<PendingFriendRequestsModel> getPendingFriendRequests({required String page}) async {
    Map<String, String> headers = await DioHelper().header();

    try {
      final response = await Dio().get(
        ConstantApi.getPendingFriendRequests(page),
        options: Options(
          headers: headers,
        ),
      );

      return PendingFriendRequestsModel.fromJson(response.data);
    } on DioException catch (e) {
      throw DioHelper.handleDioError(dioError: e, endpointName: 'getPendingFriendRequests');
    }
  }

  @override
  Future<String> acceptFriendRequests({required String id}) async {
    Map<String, String> headers = await DioHelper().header();

    try {
      final response = await Dio().post(
        ConstantApi.acceptFriendRequests(id),
        options: Options(
          headers: headers,
        ),
      );

      Map<String, dynamic> data = response.data;

      return data["message"];
    } on DioException catch (e) {
      throw DioHelper.handleDioError(dioError: e, endpointName: 'acceptFriendRequests');
    }
  }

  @override
  Future<String> rejectFriendRequests({required String id}) async {
    Map<String, String> headers = await DioHelper().header();

    try {
      final response = await Dio().delete(
        ConstantApi.rejectFriendRequests(id),
        options: Options(
          headers: headers,
        ),
      );

      Map<String, dynamic> data = response.data;

      return data["message"];
    } on DioException catch (e) {
      throw DioHelper.handleDioError(dioError: e, endpointName: 'rejectFriendRequests');
    }
  }

  @override
  Future<FriendsModel> getFriends({required String page}) async {
    Map<String, String> headers = await DioHelper().header();

    try {
      final response = await Dio().get(
        ConstantApi.getFriends(page),
        options: Options(
          headers: headers,
        ),
      );

      return FriendsModel.fromJson(response.data);
    } on DioException catch (e) {
      throw DioHelper.handleDioError(dioError: e, endpointName: 'getFriends');
    }
  }

  @override
  Future<UserModel> getMyData() async {
    Map<String, String> headers = await DioHelper().header();

    try {
      final response = await Dio().get(
        ConstantApi.getMyData,
        options: Options(
          headers: headers,
        ),
      );

      return UserModel.fromMap(response.data);
    } on DioException catch (e) {
      throw DioHelper.handleDioError(dioError: e, endpointName: 'getMyData');
    }
  }
}
