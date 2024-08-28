import 'package:flutter/material.dart';
import 'package:leach/core/resource_manager/asset_path.dart';
import 'package:leach/core/resource_manager/routes.dart';
import 'package:leach/core/utils/app_size.dart';
import 'package:leach/core/utils/methods.dart';
import 'package:leach/core/widgets/background.dart';
import 'package:leach/core/widgets/loading_widget.dart';

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

    await Future.delayed(const Duration(seconds: 3));
    bool firstOpen = await Methods.instance.returnFirstOpen();
    token = await Methods.instance.returnUserToken();

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
