import 'package:chat_app/features/chat/chat_screen.dart';
import 'package:chat_app/features/contact_user/contact_user_screen.dart';
import 'package:chat_app/features/conversation/conversation_screen.dart';
import 'package:chat_app/features/pick_image/pick_image_screen.dart';
import 'package:chat_app/features/splash/splash_screen.dart';
import 'package:chat_app/features/login/login_screen.dart';
import 'package:chat_app/features/singup/singup_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String login = '/login';
  static const String chats = '/chats';
  static const String conversation = '/conversation';
  static const String splash = '/splash';
  static const String signUp = '/signup';
  static const String profile = '/profile';
  static const String contact = '/contact';
}

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case Routes.login:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case Routes.contact:
        return MaterialPageRoute(builder: (_) => ContactuserScreen());
      case Routes.signUp:
        return MaterialPageRoute(builder: (_) => SingupScreen());
      case Routes.chats:
        return MaterialPageRoute(builder: (_) => ChatsScreen());
      case Routes.profile:
        return MaterialPageRoute(builder: (_) => PickImageScreen());
      case Routes.conversation:
        return MaterialPageRoute(
            builder: (_) => ConversationScreen(
                  username: (settings.arguments as Map)['name'],
                  userId: (settings.arguments as Map)['user_Id'],
                ));

      default:
        return MaterialPageRoute(
          builder: (_) => LoginScreen(),
        );
    }
  }
}
