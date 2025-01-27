import 'package:equatable/equatable.dart';

abstract class SignUpState extends Equatable {}

class RegisterNewUserState extends SignUpState {
  final String email;
  final String passward;
  RegisterNewUserState({required this.email, required this.passward});
  @override
  List<Object?> get props => [passward, email];
}

class SignUpLoadingState extends SignUpState {
  @override
  List<Object?> get props => [];
}

class SignUpSuccessState extends SignUpState {
  SignUpSuccessState({required this.message});

  final String message;
  @override
  List<Object?> get props => [message];
}

class SignUpInitial extends SignUpState {
  @override
  List<Object?> get props => [];
}

class SignUpFailureState extends SignUpState {
  SignUpFailureState({required this.error, required String message});

  final String error;

  @override
  List<Object?> get props => [error];
}
