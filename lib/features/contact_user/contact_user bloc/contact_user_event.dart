part of 'contact_user_bloc.dart';

sealed class ContactUserEvent extends Equatable {
  const ContactUserEvent();

  @override
  List<Object> get props => [];
}

class FetchUserEvent extends ContactUserEvent {
  const FetchUserEvent();
}
