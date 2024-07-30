import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:leach/core/service/navigator_services.dart';
import 'package:leach/core/service/service_locator.dart';
import 'package:leach/features/auth/presentation/forgot_password/code_page.dart';
import 'package:leach/features/auth/presentation/forgot_password/forgot_password.dart';
import 'package:leach/features/auth/presentation/forgot_password/reset_password_screen.dart';
import 'package:leach/features/auth/presentation/login_screen.dart';
import 'package:leach/features/auth/presentation/sign_up/register.dart';
import 'package:leach/features/auth/presentation/welcome_screen.dart';
import 'package:leach/features/doctors.dart';
import 'package:leach/features/main_screen.dart';
import 'package:leach/features/profile/presentation/add_pet/add_pet_screen.dart';
import 'package:leach/features/profile/presentation/add_pet/cat_bread.dart';
import 'package:leach/features/profile/presentation/add_pet/cat_breed2.dart';
import 'package:leach/features/profile/presentation/add_pet/cat_breed3.dart';
import 'package:leach/features/profile/presentation/add_pet/dog_bread.dart';
import 'package:leach/features/profile/presentation/add_pet/dog_breed2.dart';
import 'package:leach/features/profile/presentation/add_pet/dog_breed3.dart';
import 'package:leach/features/profile/presentation/add_pet/type_of_pet.dart';
import 'package:leach/features/profile/presentation/profile/side_bar.dart';

class Routes {
  static const String login = "/login";
  static const String welcomePage = "/welcomePage";
  static const String splash = "/splash";
  static const String main = "/main";
  static const String signUp = "/signUp";
  static const String forgotPasswordScreen = "/ForgotPasswordScreen";
  static const String otpCode = "/otpCode";
  static const String  resetPassword = "/resetPassword";
  static const String  addPetScreen = "/addPetScreen";
  static const String  typeOfPetScreen  = "/TypeOfPetScreen";
  static const String  catBread  = "/CatBread";
  static const String    dogBread  = "/dogBread";
  static const String  TypeOfPetScreen  = "/TypeOfPetScreen";
  static const String  doctor  = "/Doctors";
  static const String  catBreed2  = "/CatBreed2";
  static const String  catBreed3  = "/CatBreed3";
  static const String    dogBreed2  = "/dogBreed2";
  static const String    dogBreed3  = "/dogBreed3";
  static const String    sidebar  = "/side_bar";
}

class RouteGenerator {
  static bool isStudent = false;

  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.login:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const LoginScreen(),
            transitionsBuilder: customAnimate);   case Routes.main:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const MainScreen( ),
            transitionsBuilder: customAnimate);
      case Routes.welcomePage:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const WelcomePage(),
            transitionsBuilder: customAnimate);
      case Routes.signUp:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const SignUpScreen(),
            transitionsBuilder: customAnimate);
      case Routes.forgotPasswordScreen:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const ForgotPasswordScreen(),
            transitionsBuilder: customAnimate);
        case Routes.otpCode:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const CodeScreen(),
            transitionsBuilder: customAnimate);
        case Routes.resetPassword:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const ResetPasswordScreen(),
            transitionsBuilder: customAnimate);
        case Routes.addPetScreen:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const AddPetScreen(),
            transitionsBuilder: customAnimate);
        case Routes.typeOfPetScreen:
          bool? isFromBreeding = settings.arguments as bool?;
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                  TypeOfPetScreen(
                    isFromBreeding:isFromBreeding??false,
                ),
            transitionsBuilder: customAnimate);
        case Routes.doctor:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const Doctors(),
            transitionsBuilder: customAnimate);
        case Routes.catBread:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const CatBread(),
            transitionsBuilder: customAnimate);
        case Routes.dogBread:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const  DogBread(),
            transitionsBuilder: customAnimate);
      case Routes.dogBreed2:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
            const  DogBreed2(),
            transitionsBuilder: customAnimate);
      case Routes.dogBreed3:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
            const  DogBreed3(),
            transitionsBuilder: customAnimate);
      case Routes.catBreed2:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
            const  CatBreed2(),
            transitionsBuilder: customAnimate);
      case Routes.catBreed3:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
            const  CatBreed3(),
            transitionsBuilder: customAnimate);
      case Routes.sidebar:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
            const  SideBar(),
            transitionsBuilder: customAnimate);


    }
    return unDefinedRoute(
        getIt<NavigationService>().navigatorKey.currentContext!);
  }

  static Route<dynamic> unDefinedRoute(BuildContext context) {
    return MaterialPageRoute(
      builder: (context) => WillPopScope(
        onWillPop: () async {
          bool leaveApp = await showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Confirm Exit'),
              content: const Text('Are you sure you want to leave the app?'),
              actions: [
                TextButton(
                  onPressed: () {
                    // Stay in the app
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      Routes.main,
                      (route) => false,
                    );
                  },
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    // Leave the app
                    Navigator.of(context).pop(true);
                  },
                  child: const Text('Exit'),
                ),
              ],
            ),
          );

          // Return whether to leave the app or not
          return leaveApp ?? false;
        },
        child: Container(), // Replace with your app's content
      ),
    );
  }
}

Widget customAnimate(BuildContext context, Animation<double> animation,
    Animation<double> secondaryAnimation, Widget child) {
  // var begin = Offset(1.0, 0.0);
  // var end = Offset.zero;
  // var curve = Curves.decelerate;
  //
  // var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
  return FadeTransition(
    opacity: animation,
    child: child,
  );
}
