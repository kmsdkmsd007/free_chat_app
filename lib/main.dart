import 'package:chat_app/features/chat/cubit/chat_cubit.dart';
import 'package:chat_app/features/contact_user/contact_user%20bloc/contact_user_bloc.dart';
import 'package:chat_app/features/contact_user/contact_user_screen.dart';
import 'package:chat_app/features/conversation/cubit/conversation_cubit.dart';
import 'package:chat_app/features/login/login_bloc/login_bloc.dart';
import 'package:chat_app/features/pick_image/pick_image_cubit/userInfo_cubit.dart';
import 'package:chat_app/features/singup/sign_Up%20cubit/signup_cubit.dart';
import 'package:chat_app/features/splash/splash_cubit/splash_cubit_cubit.dart';
import 'package:chat_app/utils/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final navigatorKey = GlobalKey<NavigatorState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImtmZGtzeGRlYXRodHF2bGpodWx4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzY3NTA0MzgsImV4cCI6MjA1MjMyNjQzOH0.85vHOAhdARopt1RdZyg8AHzNY12vcBZoj1l20d722mQ',
    url: 'https://kfdksxdeathtqvljhulx.supabase.co',
  );
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<SplashCubitCubit>(create: (context) => SplashCubitCubit()),
      BlocProvider<ChatCubit>(create: (context) => ChatCubit()),
      BlocProvider<ContactUserBloc>(
          create: (context) =>
              ContactUserBloc(Supabase.instance.client)..add(FetchUserEvent())),
      BlocProvider<LoginBloc>(create: (context) => LoginBloc()),
      BlocProvider<ConversationCubit>(create: (context) => ConversationCubit()),
      BlocProvider<SignUpCubit>(create: (context) => SignUpCubit()),
      BlocProvider<ImageCubit>(create: (context) => ImageCubit()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: ContactuserScreen(),
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRouter.generateRoute,
      initialRoute: Routes.splash,
    );
  }
}
