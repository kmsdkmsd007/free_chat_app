import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {}

class LoginUserEvent extends LoginEvent {
  final String email;
  final String passwoed;
  LoginUserEvent({required this.email, required this.passwoed});
  List<Object?> get props => [email, passwoed];
}

class LoginNewAccoutnEvent extends LoginEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoginTooglePassword extends LoginEvent {
  final bool show;
  LoginTooglePassword(this.show);
  @override
  // TODO: implement props
  List<Object?> get props => [show];
}
