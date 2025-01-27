import 'package:chat_app/features/singup/cubit/signup_state.dart';
import 'package:chat_app/main.dart';
import 'package:chat_app/utils/navigation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:supabase_flutter/supabase_flutter.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());

  Future<void> signUp(
      String email, String password, String confirmPassword) async {
    emit(SignUpLoadingState());

    try {
      // Check if passwords match
      if (password != confirmPassword) {
        throw Exception("Passwords do not match");
      }
      final supabaseClient = Supabase.instance.client;
      final response = await supabaseClient.auth.currentUser;

      if (response != null) {
        emit(SignUpFailureState(
            message: "User already exists", error: "User already exists"));

        // Check if the user already exists

        // Register a new user
        final signUpResponse = await Supabase.instance.client.auth.signUp(
          email: email,
          password: password,
        );

        if (signUpResponse.user == null) {
          throw Exception("Failed to sign up:.message}");
        }

        emit(SignUpSuccessState(message: "congratulatipn on sucess "));
        navigatorKey.currentState!.pushNamed(Routes.home);
      }
    } on Exception catch (e) {
      emit(
        SignUpFailureState(
          error: e.toString(),
          message: '',
        ),
      );
      Future.delayed(Duration(seconds: 5));
      // navigatorKey.currentState!.pushNamed(Routes.login);
    }
  }
}
