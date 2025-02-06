import 'package:chat_app/features/singup/cubit/signup_state.dart';
import 'package:chat_app/main.dart';
import 'package:chat_app/utils/navigation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:supabase_flutter/supabase_flutter.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SupabaseClient _supabaseClient = Supabase.instance.client;
  SignUpCubit() : super(SignUpInitial());
  Future<void> signUp(
      String email, String password, String confirmPassword) async {
    emit(SignUpLoadingState());
    try {
      final response = await _supabaseClient.auth.signUp(
        email: email,
        password: password,
      );

      if (response.user != null) {
        emit(SignUpSuccessState(message: "successfuly registered"));
        navigatorKey.currentState!.pushNamed(Routes.home);
      } else {
        emit(SignUpFailureState(
            error: "Registration field plz try again later"));
        Future.delayed(Duration(seconds: 8));
        navigatorKey.currentState!.pushNamed(Routes.signUp);
      }
    } on AuthException catch (e) {
      emit(SignUpFailureState(error: e.toString()));
    } catch (e) {
      emit(SignUpFailureState(
          error: "Unexpected error occured try again later"));
      navigatorKey.currentState!.pushNamed(Routes.signUp);
    }
  }
}
