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

  Future<Map<String, dynamic>> changePassword(SignUpModel signUpModel);

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
  Future<Map<String, dynamic>> changePassword(SignUpModel signUpModel) async {
    final Options options = await DioHelper().options();
    final body = {
      'password': signUpModel.password,
      'old_password': signUpModel.oldPassword,
    };

    try {
      final response = await Dio().post(
         ConstantApi.changePassword,
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

      Map<String, dynamic>  jsonData = response.data;

      return jsonData['message'];
    } on DioException catch (e) {
      throw DioHelper.handleDioError(
          dioError: e, endpointName: "deleteAccount");
    }
  }


}


