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
        const Duration(seconds: 2)); // Add a small delay for splash screen
    await Supabase.instance.client.auth.onAuthStateChange.listen((userState) {
      if (userState.session == null) {
        navigatorKey.currentState!.pushReplacementNamed(Routes.login);
      } else {
        if (userState.session!.user == null) {
          navigatorKey.currentState!.pushReplacementNamed(Routes.login);
        } else {
          navigatorKey.currentState!.pushReplacementNamed(Routes.home);
        }
      }
    });
  }
}
