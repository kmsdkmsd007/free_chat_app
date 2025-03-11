import 'package:bloc/bloc.dart';
import 'package:chat_app/features/chat/chat_model.dart';
import 'package:chat_app/features/conversation/conversation_model.dart';
import 'package:chat_app/utils/const_Strings.dart';
import 'package:equatable/equatable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'conversation_state.dart';

class ConversationCubit extends Cubit<ConversationState> {
  final SupabaseClient _supabaseClient = Supabase.instance.client;
  ConversationCubit() : super(ConversationInitial());

  insertChatModel(String? name, bool isGroup) async {
    try {
      await _supabaseClient.from('chats').insert({
        'name': name,
        'is_grouped': isGroup,
        'timestamp': DateTime.now().toString(),
      });
    } catch (e) {
      emit(ConversationError(errorMessage: e.toString()));
    }
  }

  Future<int> insertOrUpdateChatTable() async {
    var a = await Supabase.instance.client
        .from(C.t_chats)
        .insert(createChatModel().toJson())
        .select('id');
    return a.first['id'];
  }

  Future<void> insertUserToChat(String userId, int chatId) async {
    await Supabase.instance.client
        .from(C.t_chat_member)
        .insert({'chat_id': chatId, "user_id": userId});
    print(userId);
  }

  insertConversation(
      ConversationModel conversationModel, String receiverId) async {
    emit(ConversationLoading());
    try {
      int chatId = await insertOrUpdateChatTable();
      print(chatId);
      await insertUserToChat(receiverId, chatId);
      await insertUserToChat(
          Supabase.instance.client.auth.currentUser!.id, chatId);

      await _supabaseClient.from(C.t_messages).insert(conversationModel
          .copyWith(
            chatId: chatId,
            content: " u Usman",
            contentType: "211",
            senderId: Supabase.instance.client.auth.currentUser!.id,
            // Update the receiverId in the conversation model
          )
          .toJson());
    } catch (e) {
      print(e.toString());
      emit(ConversationError(errorMessage: e.toString()));
    }
  }
}
