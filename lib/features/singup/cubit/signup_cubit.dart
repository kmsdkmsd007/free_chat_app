import 'package:chat_app/features/singup/cubit/signup_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SupabaseClient _supabaseClient = Supabase.instance.client;

  SignUpCubit() : super(SignUpInitial());
  Future<void> signUp(
      String email, String password, String confirmPassword) async {
    emit(SignUpLoadingState());
    try {
      // Sign up the user
      final AuthResponse response = await _supabaseClient.auth.signUp(
        email: email,
        password: password,
      );

      if (response.user == null) {
        throw Exception('User creation failed');
      }

      emit(SignUpSuccessState(message: 'Successfully signed up'));
    } catch (e) {
      print(e.toString());
      emit(SignUpFailureState(error: e.toString()));
    }
  }
}
