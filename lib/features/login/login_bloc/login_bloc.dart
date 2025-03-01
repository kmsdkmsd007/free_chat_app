import 'package:bloc/bloc.dart';
import 'package:chat_app/features/login/login_bloc/Login_states.dart';
import 'package:chat_app/main.dart';
import 'package:chat_app/utils/navigation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'login_event.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInital()) {
    on<LoginEvent>((event, emit) async {
      if (event is LoginTooglePassword) {
        emit(LoginInital(showPassword: event.show));
      }
      if (event is LoginUserEvent) {
        emit(LoginLoadingState());
        try {
          var res = await Supabase.instance.client.auth
              .signInWithPassword(password: event.passwoed, email: event.email);
          if (res.user != null) {
            navigatorKey.currentState?.pop();

            navigatorKey.currentState?.pushNamed(Routes.chats);
          } else {
            emit(LoginFailureState("error from supabase"));
          }
        } catch (e) {
          emit(LoginFailureState(e.toString()));
        }
      }
    });
  }
}
