import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:leach/core/models/profile_data_model.dart';
import 'package:leach/core/utils/api_helper.dart';
import 'package:leach/core/utils/constant_api.dart';
import 'package:leach/features/profile/domain/model/all_booking_model.dart';
import 'package:leach/features/profile/domain/model/create_pet.dart';
import 'package:http_parser/http_parser.dart';
import 'package:leach/features/profile/domain/model/friends_model.dart';
import 'package:leach/features/profile/domain/model/pending_friend_requests_model.dart';
import 'package:leach/features/profile/domain/model/traits_model.dart';
import 'package:leach/features/profile/domain/model/user_data_model.dart';
import 'package:leach/features/profile/domain/use_case/CREATE_PET_USE_CASE.dart';
import 'package:leach/features/profile/domain/use_case/report_user_uc.dart';
import 'package:leach/features/profile/domain/use_case/update_my_data_use_case.dart';
import 'package:leach/features/profile/presentation/profile/componant/add_photo_for_pet.dart';

abstract class ProfileBaseRemotelyDataSource {
  Future<PetProfileModel> createPet(PetProfileModel petProfileModel);

  Future<PetProfileModel> updatePet(UpdatePetRequest updatePetRequest);

  Future<List<PetTrait>> getTraits();

  Future<PendingFriendRequestsModel> getPendingFriendRequests(
      {required String page});

  Future<String> sendFriendRequests({required String id});

  Future<String> acceptFriendRequests({required String id});

  Future<String> rejectFriendRequests({required String id});

  Future<FriendsModel> getFriends({required String page});

  Future<UserModel> getMyData();

  Future<UserModel> updateMyData(UpdateDataParams parameter);

  Future<String> changePrivacy();

  Future<List<AllBookingModel>> getAllBooking();

  Future<void> cancelBooking(int bookingId);

  Future<UserDataModel> getUser({required String id});

  Future<String> removeFriend({required String id});

  Future<String> reportUser(ReportParameter reportParameter);

  Future<String> addPhotoForPet({
    required String petId,
    File? image,
  });

  Future<String> blockUser({required String id});

  Future<String> unBlockUser({required String id});

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
  Future<PetProfileModel> updatePet(UpdatePetRequest updatePetRequest) async {
    FormData? formData;

    final Options options = await DioHelper().options();
    log('updatePetRequest.uuid ${updatePetRequest.uuid}');
    log('updatePetRequest.uuid ${updatePetRequest.uuid}');
    log('updatePetRequest.uuid ${updatePetRequest.username}');

    formData = FormData.fromMap({
      'username': updatePetRequest.username,
      'name': updatePetRequest.name,
      'weight': updatePetRequest.weight,
      'size': updatePetRequest.size,
      'breeding_experience': updatePetRequest.breedingExperience! ? 1 : 0,
      'neutered_spayed': updatePetRequest.neuteredSpayed! ? 1 : 0,
      'breeding_available': updatePetRequest.breedingAvailable! ? 1 : 0,
      'traits[]': updatePetRequest.traits,
      'subtraits[]': updatePetRequest.subtraits,
    });


    if (updatePetRequest.profilePicture != null) {


      formData.files.add(MapEntry(
        'profile_picture',
        await MultipartFile.fromFile(
          updatePetRequest.profilePicture!.path,
          filename: updatePetRequest.profilePicture!.path.split('/').last,
          contentType: MediaType("image", "jpeg"),
        ),
      ));
    }

    if (updatePetRequest.medicalPassport != null) {

      formData.files.add(MapEntry(
        'medical_passport',
        await MultipartFile.fromFile(
          updatePetRequest.medicalPassport!.path,
          filename: updatePetRequest.medicalPassport!.path.split('/').last,
          contentType: MediaType("image", "jpeg"),
        ),
      ));
    }
    log('$formData erherheh');
    try {
      final response = await Dio().post(
        ConstantApi.updatePet(updatePetRequest.uuid),
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
  Future<List<PetTrait>> getTraits() async {
    final Options options = await DioHelper().options();
    try {
      final response = await Dio().get(
        ConstantApi.getTraits,
        options: options,
      );
      List<PetTrait> jsonData = List<PetTrait>.from(
          (response.data['data'] as List).map((e) => PetTrait.fromJson(e)));
      return jsonData;
    } on DioException catch (e) {
      throw DioHelper.handleDioError(dioError: e, endpointName: " getTraits");
    }
  }

  @override
  Future<PendingFriendRequestsModel> getPendingFriendRequests(
      {required String page}) async {
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
      throw DioHelper.handleDioError(
          dioError: e, endpointName: 'getPendingFriendRequests');
    }
  }

  @override
  Future<String> sendFriendRequests({required String id}) async {
    Map<String, String> headers = await DioHelper().header();

    try {
      final response = await Dio().post(
        ConstantApi.sendFriendRequests(id),
        options: Options(
          headers: headers,
        ),
      );

      Map<String, dynamic> data = response.data;

      return data["message"] ?? "Success";
    } on DioException catch (e) {
      throw DioHelper.handleDioError(
          dioError: e, endpointName: 'sendFriendRequests');
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

      return data["message"] ?? "Success";
    } on DioException catch (e) {
      throw DioHelper.handleDioError(
          dioError: e, endpointName: 'acceptFriendRequests');
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

      return data["message"] ?? "Success";
    } on DioException catch (e) {
      throw DioHelper.handleDioError(
          dioError: e, endpointName: 'rejectFriendRequests');
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
    Options options = await DioHelper().options();
    try {
      final response = await Dio().get(ConstantApi.getMyData, options: options);
      UserModel userModel = UserModel.fromMap(response.data['data']);
      log('${ userModel.pets!.first.pictures.length}UserModel.fromMap(response.data');

      return    userModel;
    } on DioException catch (e) {
      throw DioHelper.handleDioError(dioError: e, endpointName: 'getMyData');
    }
  }

  @override
  Future<UserModel> updateMyData(UpdateDataParams parameter) async {
    Options options = await DioHelper().options();
    final FormData formData = FormData.fromMap({
      "name": parameter.name,
      "username": parameter.username,
      "bio": parameter.bio,
      "city": parameter.city,
      "area": parameter.area,
      "profile_picture": parameter.profilePicture != null
          ? await MultipartFile.fromFile(parameter.profilePicture!.path)
          : null,
    });
    try {
      final response = await Dio()
          .post(ConstantApi.updateMyData, options: options, data: formData);

      return UserModel.fromMap(response.data['data']);
    } on DioException catch (e) {
      throw DioHelper.handleDioError(dioError: e, endpointName: 'updateMyData');
    }
  }

  @override
  Future<String> changePrivacy() async {
    Options options = await DioHelper().options();

    try {
      final response = await Dio().post(
        ConstantApi.togglePrivacy,
        options: options,
      );

      return 'Success';
    } on DioException catch (e) {
      throw DioHelper.handleDioError(
          dioError: e, endpointName: ' changePrivacy');
    }
  }

  @override
  Future<List<AllBookingModel>> getAllBooking() async {
    Options options = await DioHelper().options();

    try {
      final response = await Dio().get(
        ConstantApi.getAllBooking,
        options: options,
      );

      List<AllBookingModel> jsonData = List<AllBookingModel>.from(
          (response.data['bookings']['data'] as List)
              .map((e) => AllBookingModel.fromJson(e)));
      return jsonData;
    } on DioException catch (e) {
      throw DioHelper.handleDioError(
          dioError: e, endpointName: ' getAllBooking');
    }
  }

  @override
  Future<void> cancelBooking(int bookingId) async {
    Map<String, String> headers = await DioHelper().header();

    try {
      final response = await Dio().delete(
        ConstantApi.cancelBooking(bookingId.toString()),
        options: Options(
          headers: headers,
        ),
      );
    } on DioException catch (e) {
      throw DioHelper.handleDioError(
          dioError: e, endpointName: 'cancelBooking');
    }
  }

  @override
  Future<UserDataModel> getUser({required String id}) async {
    Options options = await DioHelper().options();

    try {
      final response =
          await Dio().get(ConstantApi.getUser(id: id), options: options);

      return UserDataModel.fromJson(response.data);
    } on DioException catch (e) {
      throw DioHelper.handleDioError(dioError: e, endpointName: 'getUser');
    }
  }

  @override
  Future<String> removeFriend({required String id}) async {
    Options options = await DioHelper().options();

    try {
      final response =
          await Dio().delete(ConstantApi.removeFriend(id: id), options: options);
      Map<String, dynamic> data = response.data;

      return data["message"] ?? "Success";
    } on DioException catch (e) {
      throw DioHelper.handleDioError(dioError: e, endpointName: 'removeFriend');
    }
  }

  @override
  Future<String> reportUser(ReportParameter reportParameter) async {
    Options options = await DioHelper().options();
    log('${reportParameter.picture} beiughe ${reportParameter.type}');
    late FormData formData;
    if (reportParameter.picture == null &&
        (reportParameter.description == null) &&
        reportParameter.type != null) {
      formData = FormData.fromMap({
        "fixed_report": reportParameter.type,
      });
    }
   else if (reportParameter.picture == null) {
      formData = FormData.fromMap({
        "specific_report": reportParameter.description,
      });
    } else {
      formData = FormData.fromMap({
        "specific_report": reportParameter.description,
        "picture": await MultipartFile.fromFile(
          reportParameter.picture!.path,
          filename: reportParameter.picture!.path.split('/').last,
          contentType: MediaType("image", "jpeg"),
        )
      });
    }
    try {
      final response = await Dio().post(
        ConstantApi.reportUser(id: reportParameter.id),
        options: options,
        data: formData,
      );
      Map<String, dynamic> data = response.data;

      return data["message"] ?? "Success";
    } on DioException catch (e) {
      throw DioHelper.handleDioError(dioError: e, endpointName: 'reportUser');
    }
  }

  @override
  Future<String> addPhotoForPet({required String petId, File? image}) async {
    Options options = await DioHelper().options();
    FormData? formData;
    late Map<String, dynamic> data;
    if (image != null) {
      formData = FormData.fromMap({
        'pet_id': petId,
        'picture': await MultipartFile.fromFile(image.path,
            filename: image.path.split('/').last.toString(),
            contentType: MediaType("image", "jpeg")),
      });
    }
    try {
      if (image == null) {
        final response = await Dio().delete(
          ConstantApi.removePhotoForPet(id: petId),
          options: options,
        );
        data = response.data;
      } else {
        final response = await Dio()
            .post(ConstantApi.addPhotoForPet, options: options, data: formData);
        data = response.data;
      }

      return data["message"] ?? "Success";
    } on DioException catch (e) {
      throw DioHelper.handleDioError(
          dioError: e, endpointName: 'addPhotoForPet');
    }
  }

  @override
  Future<String> blockUser({required String id}) async {
    Options options = await DioHelper().options();

    try {
      final response =
      await Dio().post(ConstantApi.blockUser(id: id), options: options);
      Map<String, dynamic> data = response.data;

      return data["message"] ?? "Success";
    } on DioException catch (e) {
      throw DioHelper.handleDioError(dioError: e, endpointName: 'blockUser');
    }
  }

  @override
  Future<String> unBlockUser({required String id}) async {
    Options options = await DioHelper().options();

    try {
      final response =
      await Dio().delete(ConstantApi.unBlockUser(id: id), options: options);
      Map<String, dynamic> data = response.data;

      return data["message"] ?? "Success";
    } on DioException catch (e) {
      throw DioHelper.handleDioError(dioError: e, endpointName: 'unBlockUser');
    }
  }
}
