import 'dart:developer';
import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:leach/core/models/profile_data_model.dart';
import 'package:leach/core/resource_manager/routes.dart';
import 'package:leach/core/resource_manager/string_manager.dart';
import 'package:leach/core/service/navigator_services.dart';
import 'package:leach/core/service/service_locator.dart';
import 'package:leach/core/utils/app_size.dart';

import 'package:leach/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Methods {
//singleton class
  Methods._internal();

  static final   instance =   Methods._internal() ;

  factory  Methods() => instance ;
  Future<void> saveUserToken({String? authToken}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    log('$authToken hussssssssssssssssmmm');
    if (authToken != null) {
      preferences.setString(StringManager.userTokenKey, authToken);
    } else {
      preferences.setString(StringManager.userTokenKey, authToken ?? "noToken");
    }

  }

  Future<String> returnUserToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    String tokenPref =
        preferences.getString(StringManager.userTokenKey) ?? "noToken";
    log('$tokenPref dhjeyjeyjeyjye');
    return tokenPref;
  }

  List<T> combineLists<T>(List<T> list1, List<T> list2) {
    Set<T> resultSet = {};
    resultSet.addAll(list1);
    resultSet.addAll(list2);
    return resultSet.toList();
  }

  Future<void> saveLocalazitaon({required String language}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("languagne", language);
  }

  Future<String> getlocalization() async {
    final String defaultLocale = Platform.localeName;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String language =
        preferences.getString("languagne") ?? defaultLocale.substring(0, 2);

    return language;
  }

  EdgeInsetsGeometry paddingCustom= EdgeInsets.only(
    left: AppSize.defaultSize??10 * 2,
    right: AppSize.defaultSize??10 * 2,
    top: AppSize.defaultSize??10 * 6,
  );
  String calculateAge(DateTime birthDate) {
    DateTime currentDate = DateTime.now();

    int years = currentDate.year - birthDate.year;
    int months = currentDate.month - birthDate.month;

    if (months < 0) {
      years--;
      months = 12 + months;
    }

    if (years == 0) {
      return '$months M';
    } else {
      return '$years Y';
    }
  }

}

