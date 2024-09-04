import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:leach/core/error/exception.dart';
import 'package:leach/core/error/failure.dart';
import 'package:leach/core/error/failures_strings.dart';
import 'package:leach/core/resource_manager/routes.dart';
import 'package:leach/core/service/navigator_services.dart';
import 'package:leach/core/service/service_locator.dart';
import 'package:leach/core/utils/methods.dart';

class DioHelper {
  Future<Options> options() async {
    Map<String, String> headers = await DioHelper().header();
    return Options(
      receiveDataWhenStatusError: true,
      // sendTimeout: const Duration(milliseconds: 15000),
      // receiveTimeout: const Duration(milliseconds: 15000),
      headers: headers,
    );
  }

  Future<Map<String, String>> header() async {
    String token = await Methods.instance.returnUserToken();
    if (kDebugMode) {
    }
    Map<String, String> headers = {
      "Authorization": 'Bearer $token',
      'accept': '*/*',
      'content-type': 'application/json; charset=utf-8',
       'server': 'Microsoft-IIS/10.0',
    };
    return headers;
  }

  String getTypeOfFailure(
    Failure failure,
  ) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return Strings.serverFailureMessage;
      case InternetFailure:
        return Strings.checkYourInternet;
      case SiginGoogleFailure:
        return Strings.signinGoogleFailureMessage.tr();
      default:
        return failure.errorMessage ?? 'Error';
    }
  }

  static Failure buildFailure(dynamic e, {String? message1}) {
    switch (e.runtimeType) {
      case ServerException:
        return ServerFailure();
      case UnauthorizedException:
        return UnauthorizedFailure();
      case SiginGoogleException:
        return SiginGoogleFailure();
      case InternetException:
        return InternetFailure();
      case ErrorModelException:
        return ErrorMessageFailure(message: e.errorMessage);
      default:
        return ErrorMessageFailure(message: e.toString());
    }
  }

  static dynamic handleDioError(
      {DioException? dioError, String? endpointName}) {
    if (kDebugMode) {
    }

    switch (dioError!.type) {
      case DioExceptionType.badResponse:
        throw handleStatuesCodeResponse(
            response: dioError.response, endpointName: endpointName);
      case DioExceptionType.connectionError:
        throw InternetException();
      case DioExceptionType.cancel:
      case DioExceptionType.badCertificate:
      case DioExceptionType.unknown:
        throw handleStatuesCodeResponse(
            response: dioError.response, endpointName: endpointName);
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.connectionTimeout:
        throw ConnectionTimeoutException();
    }
  }

  static Exception handleStatuesCodeResponse(
      {Response? response, String? endpointName}) {

    switch (response?.statusCode) {
      case 500:
        throw ServerException();
      case 401:
        Navigator.pushNamedAndRemoveUntil(
            getIt<NavigationService>().navigatorKey.currentContext!,
            Routes.login,
            (route) => false);
        if (response?.data.runtimeType == String) {
          throw ErrorModelException(errorMessage: response!.data);
        } else {
          throw ErrorModelException.fromJson(response!.data);
        }

      default:
        // throw ServerException();
        if (response?.data.runtimeType == String) {
          throw ErrorModelException(errorMessage: response!.data);
        } else {
          throw ErrorModelException.fromJson(response!.data);
        }
    }
  }
}
