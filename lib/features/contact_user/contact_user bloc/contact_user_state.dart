part of 'contact_user_bloc.dart';

sealed class ContactUserState extends Equatable {
  const ContactUserState();

  @override
  List<Object> get props => [];
}

final class ContactUserInitial extends ContactUserState {}

final class ContactUserLoading extends ContactUserState {}

final class ContactUserLoaded extends ContactUserState {
  final List<MyUser> users;

  const ContactUserLoaded(this.users);

  @override
  List<Object> get props => [users];
}

final class ContactUserError extends ContactUserState {
  final String message;

  const ContactUserError(this.message);

  @override
  List<Object> get props => [message];
}
