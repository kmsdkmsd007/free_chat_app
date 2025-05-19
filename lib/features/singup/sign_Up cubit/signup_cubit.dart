import 'package:chat_app/features/singup/sign_Up%20cubit/signup_state.dart';

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
      await _supabaseClient.from('profiles').insert({
        'id': response.user!.id,
        'email': email,
      });

      emit(SignUpSuccessState(message: 'Successfully signed up'));
    } catch (e) {
      emit(SignUpFailureState(error: e.toString()));
    }
  }
}
