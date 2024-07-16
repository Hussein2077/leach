import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:leach/core/service/navigator_services.dart';
import 'package:leach/core/service/service_locator.dart';


class Routes {
  static const String login = "/login";
  static const String splash = "/splash";
  static const String main = "/main";
}

class RouteGenerator {
  static bool isStudent = false;

  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {


      case Routes.login:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const SizedBox(),
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
                        Routes.main, (route) => false,
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

