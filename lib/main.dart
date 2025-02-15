import 'package:chat_app/features/home_screen.dart/home/home_cubit.dart';
import 'package:chat_app/features/login_screen/login/login_bloc.dart';
import 'package:chat_app/features/splash/splash_cubit/splash_cubit_cubit.dart';
import 'package:chat_app/features/splash/splash_screen.dart';
import 'package:chat_app/ui/welcome_screen.dart';
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
      BlocProvider<HomeCubit>(create: (context) => HomeCubit()),
      BlocProvider<LoginBloc>(create: (context) => LoginBloc()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRouter.generateRoute,
      initialRoute: Routes.splash, // Change
    );
  }
}
