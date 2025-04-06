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

  Future<int> insertOrUpdateChatTable(String receiverId) async {
    final chatId = await findCommonChat(receiverId);
    if (chatId != 0) {
      return chatId;
    }
    var a = await Supabase.instance.client
        .from(C.t_chats)
        .insert(createChatModel().toJson())
        .select('id');
    await insertUserToChat(receiverId, a.first['id']);
    await insertUserToChat(
        Supabase.instance.client.auth.currentUser!.id, a.first['id']);

    return a.first['id'];
  }

  Future<void> insertUserToChat(String userId, int chatId) async {
    await Supabase.instance.client
        .from(C.t_chat_member)
        .insert({'chat_id': chatId, "user_id": userId});
    print(userId);
  }

  Future<int> findCommonChat(String otherId) async {
    final response = await Supabase.instance.client.rpc('get_common_chat_ids',
        params: {
          'user_id1': Supabase.instance.client.auth.currentUser!.id,
          'user_id2': otherId
        },
        get: true);
    if (response.isNotEmpty) {
      return response[0];
    } else {
      return 0;
    }
  }

  insertConversation(
      ConversationModel conversationModel, String receiverId) async {
    emit(ConversationLoading());
    try {
      int chatId = await insertOrUpdateChatTable(receiverId);

      await _supabaseClient.from(C.t_messages).insert(conversationModel
          .copyWith(
            chatId: chatId,
            senderId: Supabase.instance.client.auth.currentUser!.id,
          )
          .toJson());
    } catch (e) {
      print(e.toString());
      emit(ConversationError(errorMessage: e.toString()));
    }
  }
}
