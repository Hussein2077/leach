import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:leach/core/error/exception.dart';
import 'package:leach/core/error/failure.dart';
import 'package:leach/core/error/failures_strings.dart';
import 'package:leach/core/utils/methods.dart';

class DioHelper {
  Future<Options> options() async {
    Map<String, String> headers = await DioHelper().header();
    log('headers $headers');
    return Options(
      receiveDataWhenStatusError: true,
      sendTimeout: const Duration(milliseconds: 5000),
      receiveTimeout: const Duration(milliseconds: 5000),
      headers: headers,
    );
  }

  Future<Map<String, String>> header() async {
     String token = await Methods.instance.returnUserToken();
    //String token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL2FwaS5sZWFzaHBldHMuY29tL2FwaS9sZWFzaC9sb2dpbiIsImlhdCI6MTcyMzM4NjgzOCwiZXhwIjoxNzI0NTk2NDM4LCJuYmYiOjE3MjMzODY4MzgsImp0aSI6Imw5SjI0N1F0RFIycXJhUUoiLCJzdWIiOiIxIiwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.Z91Vct-WoqLUmJdo2UFKhqGqJG5zUVC-6TMMP98wMMo";
    if (kDebugMode) {
      log('husssssssssss $token');
    }

    Map<String, String> headers = {
      "Authorization": 'Bearer $token',
      'accept': 'application/json',
      'content-type': 'application/json; charset=utf-8',
      'date': 'Sun,18 Feb 2024 17:04:08 GMT',
      'server': 'Microsoft-IIS/10.0',
      'x-powered-by': 'ASP.NET',
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
      log("dioError${dioError?.message}");
      log('endpointName$endpointName');
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
    if (kDebugMode) {
      log("end point Name =$endpointName");
      log("status code${response?.statusCode}");
      log("error response${response?.data}");
    }
    switch (response?.statusCode) {
      case 500:
        throw ServerException();
      case 401:
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
