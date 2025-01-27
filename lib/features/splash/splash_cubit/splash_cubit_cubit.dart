import 'package:bloc/bloc.dart';
import 'package:chat_app/main.dart';
import 'package:chat_app/utils/navigation.dart';
import 'package:equatable/equatable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'splash_cubit_state.dart';

class SplashCubitCubit extends Cubit<SplashCubitState> {
  SplashCubitCubit() : super(SplashCubitInitial());

  checkAuthState() async {
    await Future.delayed(
        const Duration(seconds: 4)); // Add a small delay for splash screen
    await Supabase.instance.client.auth.onAuthStateChange.listen((userState) {
      print(userState.session == null);

      if (userState.session == null) {
        if (navigatorKey.currentState != null) {
          navigatorKey.currentState!.pushReplacementNamed(Routes.login);
        } else {
          // Handle the case when navigatorKey.currentState is null
          print("Navigator key current state is null");
        }
      } else {
        if (navigatorKey.currentState != null) {
          navigatorKey.currentState!.pushReplacementNamed(Routes.home);
        } else {
          // Handle the case when navigatorKey.currentState is null
          print("Navigator key current state is null");
        }
      }
    });
  }
}
