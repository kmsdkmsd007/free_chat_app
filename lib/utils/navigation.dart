import 'package:chat_app/features/home_screen.dart/home_screen.dart';
import 'package:chat_app/features/splash/splash_screen.dart';
import 'package:chat_app/features/login_screen/login_screen.dart';
import 'package:chat_app/ui/singup_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String login = '/login';
  static const String home = '/home';
  static const String splash = '/splash';
  static const String signUp = '/signup';
}

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case Routes.login:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case Routes.signUp:
        return MaterialPageRoute(builder: (_) => SingupScreen());
      case Routes.home:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
