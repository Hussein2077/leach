import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';


class CodegenLoader extends AssetLoader {
  CodegenLoader();
  static final Map<String, dynamic> mapLocales = {
    'ar': ar,
  };
  @override
  Future<Map<String, dynamic>> load(String path, Locale locale) async{
    await Future.delayed(const Duration(milliseconds: 200));
    return mapLocales[locale.toString()] ?? {};
  }

  static const Map<String, dynamic> ar ={};

}
