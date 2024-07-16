import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:leach/core/resource_manager/string_manager.dart';
import 'package:leach/core/resource_manager/themes/enums.dart';
import 'package:leach/core/utils/api_helper.dart';
import 'package:leach/core/utils/constant_api.dart';
import 'package:leach/core/utils/methods.dart';
import 'package:leach/features/auth/domain/use_case/login_with_email_and_password_use_case.dart';
import 'package:leach/features/auth/domain/use_case/sign_up_use_case.dart';
import 'package:leach/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http_parser/http_parser.dart';

abstract class BaseRemotelyDataSource {
  Future<Map<String, dynamic>> loginWithEmailAndPassword(AuthModel authModel);
Future <String> deleteAccount();
  Future<Map<String, dynamic>> signUpWithEmailAndPassword(
      SignUpModel signUpModel);

  Future<String> sendCode(SignUpModel signUpModel);

  Future<Map<String, dynamic>> verifyCode(SignUpModel signUpModel);

  Future<Map<String, dynamic>> resetPassword(SignUpModel signUpModel);


}

class AuthRemotelyDateSource extends BaseRemotelyDataSource {
  @override
  Future<Map<String, dynamic>> loginWithEmailAndPassword(
      AuthModel authModel) async {
    final Options options = await DioHelper().options();
    final body = {
      'phoneNumber': authModel.phone,
      "password": authModel.password,
      "userRole": "User",
    };
    try {
      final response = await Dio().post(
        ConstantApi.login,
        data: body,
        options: options,
      );
      Map<String, dynamic> jsonData = response.data;
      SharedPreferences preferences = await SharedPreferences.getInstance();

      await Methods.instance.saveUserToken(authToken: jsonData['token']);
      return jsonData;
    } on DioException catch (e) {

      throw DioHelper.handleDioError(
          dioError: e, endpointName: "loginWithEmailAndPassword");
    }
  }

  @override
  Future<Map<String, dynamic>> signUpWithEmailAndPassword(
      SignUpModel signUpModel) async {
    final Options options = await DioHelper().options();
    final body = {
      'password': signUpModel.password,
      'phonenumber': signUpModel.phone,
      'otp': signUpModel.code,
      'userRole': "User"
    };

    try {
      final response = await Dio().post(
        ConstantApi.signUp,
        data: body,
        options: options,
      );
      Map<String, dynamic> jsonData = response.data;
      await Methods.instance.saveUserToken(authToken: jsonData['token']);
      if (jsonData['token'] == null) {
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
      'otp': signUpModel.code,
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
    log('${signUpModel.phoneOrEmailType} signUpModel.phoneOrEmailType');
    if (signUpModel.phoneOrEmailType == PhoneOrEmail.phone) {
      body = {
        'phoneNumber': signUpModel.phone,
      };
    } else {
      body = {
        'email': signUpModel.phone,
      };
    }

    try {
      final response = await Dio().post(
        signUpModel.phoneOrEmailType == PhoneOrEmail.phone
            ? ConstantApi.sendCode
            : ConstantApi.sendCodeToEmail,
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
      'otp': signUpModel.code,
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
  Future<String> deleteAccount() async{
    final Options options = await DioHelper().options();

    try {
      final response = await Dio().delete(
        ConstantApi.deleteAccount,
        options: options,
      );

     String jsonData = response.data;

      return jsonData;
    } on DioException catch (e) {
      throw DioHelper.handleDioError(dioError: e, endpointName: "deleteAccount");
    }
  }

}
