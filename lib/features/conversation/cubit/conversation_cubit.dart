import 'package:bloc/bloc.dart';
import 'package:chat_app/features/chat_screen.dart/conversation_model.dart';
import 'package:equatable/equatable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'conversation_state.dart';

class ConversationCubit extends Cubit<ConversationState> {
  final SupabaseClient _supabaseClient = Supabase.instance.client;
  ConversationCubit() : super(ConversationInitial());

  insertChatModel() async {
    try {
      await _supabaseClient.from('chats').insert({
        'user_one': _supabaseClient.auth.currentUser!.id,
        'user_two': _supabaseClient.auth.currentUser!.id,
        'timestamp': DateTime.now().toString(),
      });
    } catch (e) {
      emit(ConversationError(errorMessage: e.toString()));
    }
  }

  insertConversation(ConversationModel conversationModel) async {
    emit(ConversationLoading());
    try {
      await _supabaseClient
          .from('converstations')
          .insert(conversationModel.toJson());
    } catch (e) {
      emit(ConversationError(errorMessage: e.toString()));
    }
  }
}
