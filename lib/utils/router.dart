import 'package:flutter/material.dart';
import 'package:flutter_course/utils/router_name.dart';
import 'package:flutter_course/view/auth/login.dart';
import 'package:flutter_course/view/auth/otp.dart';
import 'package:flutter_course/view/auth/register.dart';
import 'package:flutter_course/view/home/home.dart';
import 'package:flutter_course/view/home/splash.dart';

class Routes {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    final agument = settings.arguments;
    switch (settings.name) {
      case RoutesName.splash:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      case RoutesName.login:
        return MaterialPageRoute(
          builder: (context) => const LoginPages(),
        );
      case RoutesName.register:
        return MaterialPageRoute(
          builder: (context) => const Register(),
        );

      case RoutesName.home:
        return MaterialPageRoute(
          builder: (context) => const HomePage(),
        );
      case RoutesName.add_product:
        return MaterialPageRoute(
          builder: (context) => const HomePage(),
        );
      case RoutesName.edit_profile:
        return MaterialPageRoute(
          builder: (context) => const HomePage(),
        );
      case RoutesName.detail:
        return MaterialPageRoute(
          builder: (context) => const HomePage(),
        );
      default:
        throw const FormatException("Route not found! check routes again!");
    }
  }
}
