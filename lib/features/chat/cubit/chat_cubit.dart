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
      final response = await Supabase.instance.client.from("chats").select();

      if (response.isNotEmpty) {
        emit(ChatSuccess(chats: response.map((e) => e.toChatModel()).toList()));
      } else {
        emit(ChatSuccess(chats: []));
      }
    } catch (e) {
      print(e.toString());
      emit(ChatFailure(errorMessage: e.toString()));
    }
  }
}
