import 'package:dio/dio.dart';
import 'package:leach/core/utils/api_helper.dart';
import 'package:leach/core/utils/constant_api.dart';
import 'package:leach/features/profile/domain/model/create_pet.dart';

abstract class ProfileBaseRemotelyDataSource {

  Future<PetProfileModel> createPet(PetProfileModel petProfileModel);
}
class AuthRemotelyDateSource extends ProfileBaseRemotelyDataSource {
  @override
  Future<PetProfileModel> createPet(PetProfileModel petProfileModel)async {

    final Options options = await DioHelper().options();
    final body = {

    };
    try {
      final response = await Dio().post(
        ConstantApi.login,
        data: body,
        options: options,
      );

      PetProfileModel jsonData = PetProfileModel.fromMap(response.data['data']['user']);
      return jsonData;
    } on DioException catch (e) {
      throw DioHelper.handleDioError(
          dioError: e, endpointName: "loginWithEmailAndPassword");
    }

  }
}