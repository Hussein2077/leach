import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:leach/core/utils/api_helper.dart';
import 'package:leach/core/utils/constant_api.dart';
import 'package:leach/features/profile/domain/model/create_pet.dart';
import 'package:http_parser/http_parser.dart';
import 'package:leach/features/profile/domain/model/traits_model.dart';

abstract class ProfileBaseRemotelyDataSource {
  Future<PetProfileModel> createPet(PetProfileModel petProfileModel);
  // Future<PetTrait> getTraits();
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

  // @override
  // Future<PetTrait> getTraits() {
  //
  // }


}
