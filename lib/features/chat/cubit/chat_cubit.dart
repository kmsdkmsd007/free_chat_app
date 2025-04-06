import 'package:bloc/bloc.dart';
import 'package:chat_app/features/chat/user_chat_model.dart';
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
      final List<Map<String, dynamic>> userChats = await Supabase
          .instance.client
          .rpc('get_user_chats', params: {'user_uuid': userId});

      List<UserChatModel> chatModels =
          userChats.map((e) => e.toUserChatModel()).toList();
      emit(ChatSuccess(chats: chatModels));
    } catch (e) {
      print('Error in getAllChats: ${e.toString()}');
      emit(ChatFailure(errorMessage: e.toString()));
    }
  }
}
