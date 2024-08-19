import 'package:dio/dio.dart';
import 'package:leach/core/utils/api_helper.dart';
import 'package:leach/core/utils/constant_api.dart';
import 'package:leach/features/home/data/models/breeding_model.dart';

abstract class HomeBaseRemotelyDataSource {
  Future<BreedingModel> getBreeding({required String type, required String page});

}

class HomeRemotelyDateSource extends HomeBaseRemotelyDataSource {

  @override
  Future<BreedingModel> getBreeding({required String type, required String page}) async {
    Map<String, String> headers = await DioHelper().header();

    try {
      final response = await Dio().get(
        ConstantApi.getBreeding(type: type, page: page),
        options: Options(
          headers: headers,
        ),
      );

      return BreedingModel.fromJson(response.data);
    } on DioException catch (e) {
      throw DioHelper.handleDioError(dioError: e, endpointName: 'getBreeding');
    }
  }

}