import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {}

class LoginInital extends LoginState {
  final bool showPassword;
  LoginInital({this.showPassword = false});
  @override
  List<Object?> get props => [];
}

class LoginLoadingState extends LoginState {
  @override
  List<Object?> get props => [];
}

class LoginSuccessState extends LoginState {
  @override
  List<Object?> get props => [];
}

class LoginFailureState extends LoginState {
  final String message;
  LoginFailureState(this.message);
  @override
  List<Object?> get props => [message];
}
