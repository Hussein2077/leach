import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:leach/core/utils/api_helper.dart';
import 'package:leach/core/utils/constant_api.dart';
import 'package:leach/core/utils/enums.dart';
import 'package:leach/features/home/data/models/breeding_model.dart';
import 'package:leach/features/home/data/models/how_toModel.dart';
import 'package:leach/features/home/data/models/search_user_model.dart';
import 'package:leach/features/home/data/models/vendor.dart';
import 'package:leach/features/home/domain/use_case/how_to_uc.dart';
import 'package:leach/features/home/domain/use_case/request_booking_uc.dart';
import 'package:leach/features/home/presentation/widgets/times.dart';

abstract class HomeBaseRemotelyDataSource {
  Future<BreedingModel> getBreeding(
      {required String type, required String page});

  Future<List<Vendor>> getVendors(TypeOfVendor type);

  Future<List<HowToModel>> getHowTo(GetHowToParameter type);

  Future<void> requestBooking(RequestBookingParam requestBooking);

  Future<SearchUserResponse> getSearchUser({required String page});
}

class HomeRemotelyDateSource extends HomeBaseRemotelyDataSource {
  @override
  Future<BreedingModel> getBreeding(
      {required String type, required String page}) async {
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

  @override
  Future<List<Vendor>> getVendors(TypeOfVendor type) async {
    Map<String, String> headers = await DioHelper().header();

    try {
      final response = await Dio().get(
        ConstantApi.getVendors(
          type: type == TypeOfVendor.vet
              ? 'vet'
              : type == TypeOfVendor.grooming
                  ? 'grooming'
                  : 'training_center',
        ),
        options: Options(
          headers: headers,
        ),
      );
      List<Vendor> vendors = (response.data['vendors']['data'] as List)
          .map((e) => Vendor.fromJson(e))
          .toList();
      return vendors;
    } on DioException catch (e) {
      throw DioHelper.handleDioError(dioError: e, endpointName: 'getVendors');
    }
  }

  @override
  Future<List<HowToModel>> getHowTo(GetHowToParameter type) async {
    Map<String, String> headers = await DioHelper().header();
    log('${type.petType} agagewrgq ${type.category}');
    final body = {"pet_type": type.petType, "category": type.category};
    try {
      final response = await Dio().post(ConstantApi.getHowToPosts,
          options: Options(
            headers: headers,
          ),
          data: body);
      List<HowToModel> jsonData = (response.data['posts']['data'] as List)
          .map((e) => HowToModel.fromJson(e))
          .toList();
      return jsonData;
    } on DioException catch (e) {
      throw DioHelper.handleDioError(dioError: e, endpointName: 'getHowTo');
    }
  }

  @override
  Future<void> requestBooking(RequestBookingParam requestBooking) async {
    Map<String, String> headers = await DioHelper().header();
    log('${requestBooking.vendorId.toString()} agagewrgq ${requestBooking.date} ${requestBooking.time}');
    final body = {
      "vendor_id": requestBooking.vendorId.toString(),
      "date": requestBooking.date,
      "time": requestBooking.time
    };
    try {
      final response = await Dio().post(
        ConstantApi.requestBooking,
        data: body,
        options: Options(
          headers: headers,
        ),
      );
    } on DioException catch (e) {
      throw DioHelper.handleDioError(
          dioError: e, endpointName: 'requestBooking');
    }
  }

  @override
  Future<SearchUserResponse> getSearchUser({required String page}) async {
    Map<String, String> headers = await DioHelper().header();

    try {
      final response = await Dio().get(
        ConstantApi.getFriends(page),
        options: Options(
          headers: headers,
        ),
      );

      return SearchUserResponse.fromJson(response.data['data']);
    } on DioException catch (e) {
      throw DioHelper.handleDioError(dioError: e, endpointName: 'getFriends');
    }
  }
}
