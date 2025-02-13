import 'package:chat_app/features/home/home_screen.dart';
import 'package:chat_app/features/user_info/userInfo_screen.dart';
import 'package:chat_app/features/splash/splash_screen.dart';
import 'package:chat_app/features/login/login_screen.dart';
import 'package:chat_app/features/singup/singup_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String login = '/login';
  static const String home = '/home';
  static const String splash = '/splash';
  static const String signUp = '/signup';
  static const String profile = '/profile';
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
        return MaterialPageRoute(builder: (_) => ChatPage());
      case Routes.profile:
        return MaterialPageRoute(builder: (_) => UserInfoScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => SplashScreen(),
        );
    }
  }
}
