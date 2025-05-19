part of 'message_cubit.dart';

sealed class MessageState extends Equatable {
  const MessageState();

  @override
  List<Object> get props => [];
}

final class MessageInitial extends MessageState {}

final class MessageLoading extends MessageState {}

final class MessageSuccess extends MessageState {
  final List<MessageModel> messages;

  const MessageSuccess({required this.messages});

  @override
  List<Object> get props => [messages];
}

final class MessageFailure extends MessageState {
  final String errorMessage;

  const MessageFailure({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
