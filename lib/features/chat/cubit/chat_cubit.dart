import 'package:bloc/bloc.dart';
import 'package:chat_app/features/chat/chat_model.dart';
import 'package:equatable/equatable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());

  getAllChats() async {
    emit(ChatLoading());
    try {
      final userId = Supabase.instance.client.auth.currentUser!.id;
      print('Current user ID: $userId');

      // First get all chat_ids where current user is a member
      final userChats = await Supabase.instance.client
          .from("chat_member")
          .select('chat_id')
          .eq('user_id', userId);

      print('User chats: $userChats');

      if (userChats.isEmpty) {
        print('No chats found for current user');
        emit(ChatSuccess(chats: []));
        return;
      }

      // Extract chat_ids with null safety
      final chatIds = userChats
          .map((chat) => chat['chat_id'])
          .where((id) => id != null)
          .map((id) => id as int)
          .toList();

      print('Chat IDs: $chatIds');

      if (chatIds.isEmpty) {
        print('No valid chat IDs found');
        emit(ChatSuccess(chats: []));
        return;
      }

      // Get unique chats with other users
      final response =
          await Supabase.instance.client.from("chat_member").select('''
            chat_id,
            chats:chat_id(*),
            user:user_id(username, email, profile_picture)
          ''').inFilter('chat_id', chatIds).neq('user_id', userId);

      print('Final response: $response');

      if (response.isNotEmpty) {
        // Filter to get only the most recent chat for each user
        final uniqueChats = <Map<String, dynamic>>[];
        final seenUsers = <String>{};

        for (var chat in response) {
          final otherUserId = chat['user']['id'] as String;
          if (!seenUsers.contains(otherUserId)) {
            seenUsers.add(otherUserId);
            uniqueChats.add(chat);
          }
        }

        emit(ChatSuccess(
            chats: uniqueChats.map((e) => e.toChatModel()).toList()));
      } else {
        print('No chat members found for these chats');
        emit(ChatSuccess(chats: []));
      }
    } catch (e) {
      print('Error in getAllChats: ${e.toString()}');
      emit(ChatFailure(errorMessage: e.toString()));
    }
  }
}
