part of 'conversation_cubit.dart';

sealed class ConversationState extends Equatable {
  const ConversationState();

  @override
  List<Object> get props => [];
}

final class ConversationInitial extends ConversationState {}

final class ConversationLoading extends ConversationState {}

final class ConversationError extends ConversationState {
  final String errorMessage;
  const ConversationError({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}

final class ConversationSuccess extends ConversationState {
  final List<ConversationModel> conversations;
  const ConversationSuccess({required this.conversations});
  @override
  List<Object> get props => [conversations];
}
