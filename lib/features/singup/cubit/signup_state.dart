import 'package:equatable/equatable.dart';

abstract class SignUpState extends Equatable {}

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
  SignUpFailureState({
    required this.error,
  });

  final String error;

  @override
  List<Object?> get props => [error];
}
