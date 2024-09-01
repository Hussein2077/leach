import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leach/core/resource_manager/asset_path.dart';
import 'package:leach/core/resource_manager/routes.dart';
import 'package:leach/core/utils/app_size.dart';
import 'package:leach/core/utils/methods.dart';
import 'package:leach/core/widgets/background.dart';
import 'package:leach/core/widgets/loading_widget.dart';
import 'package:leach/features/profile/presentation/controller/my_data_manager/my_data_bloc.dart';
import 'package:leach/features/profile/presentation/controller/my_data_manager/my_data_event.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String? token;

  @override
  void initState() {
    super.initState();
    _initializeSplash();
  }

  Future<void> _initializeSplash() async {
    if (!mounted) return;
    token = await Methods.instance.returnUserToken();
    await Future.delayed(  Duration(seconds:(token != "noToken" || token != null)?0: 3));
    bool firstOpen = await Methods.instance.returnFirstOpen();

    log('$token mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm');
    _navigateBasedOnToken(firstOpen);
  }

  void _navigateBasedOnToken(bool firstOpen) {
    if (token == "noToken" || token == null) {
      if (firstOpen) {
        Navigator.pushReplacementNamed(context, Routes.page1);
      } else {
        Navigator.pushReplacementNamed(context, Routes.welcomePage);
      }
    } else {
      Navigator.pushReplacementNamed(context, Routes.main);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundScreen(
        image: AssetPath.welcomeImage,
        child: LoadingWidget(
          width: AppSize.defaultSize! * 20,
          height: AppSize.defaultSize! * 20,
        ),
      ),
    );
  }
}
